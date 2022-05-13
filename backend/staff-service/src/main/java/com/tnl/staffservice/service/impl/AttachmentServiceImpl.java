package com.tnl.staffservice.service.impl;

import com.tnl.staffservice.entity.Attachment;
import com.tnl.staffservice.exception.ApplicationException;
import com.tnl.staffservice.repository.AttachmentRepository;
import com.tnl.staffservice.service.AttachmentService;
import com.tnl.staffservice.dto.FileDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AttachmentServiceImpl implements AttachmentService{
    private final AttachmentRepository attachmentRepository;

    @Override
    @Transactional
    public List<FileDTO> save(MultipartFile[] files) {
        try{
            List<FileDTO> fileResponses = new ArrayList<>();
            List<Attachment> attachments = new ArrayList<>();
            Attachment attachment;
            FileDTO fileDTO;
            String fileName ;

            for (MultipartFile file: files){
                fileName = StringUtils.cleanPath(file.getOriginalFilename());
//                if(fileName.contains(".."))
//                if(true)
//                    throw new ApplicationException(APIStatus.PRODUCT_SAVE_ERROR);
                attachment = new Attachment(fileName,file.getContentType(),file.getSize(),file.getBytes());
                attachments.add(attachment);
            }
            attachments = attachmentRepository.saveAll(attachments);

            String downloadURL = "";
            for(Attachment attach: attachments){
                fileDTO = new FileDTO();
                fileDTO.setFileName(attach.getFileName());
                fileDTO.setFileType(attach.getFileType());

                downloadURL = ServletUriComponentsBuilder
                        .fromCurrentContextPath()
                        .path("attachment/download/")
                        .path(attach.getId())
                        .toUriString();
                fileDTO.setDownloadURL(downloadURL);
                fileDTO.setFileSize(attach.getFileSize());
                fileResponses.add(fileDTO);
            }

            return fileResponses;

        } catch (ApplicationException e){
            throw e;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public Attachment getById(String fileId) {
        try{
            Attachment attachment = attachmentRepository.getById(fileId);
            if (attachment.getData() == null) {
                String fileLocation = new File("src\\main\\resources\\static\\file").getAbsolutePath() + "\\" + attachment.getId()+".xlsx";
                Path path = Paths.get(fileLocation);
                byte[] data = Files.readAllBytes(path);
                attachment.setData(data);
            }
            return attachment;
        }catch (ApplicationException e){
            throw e;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }
}
