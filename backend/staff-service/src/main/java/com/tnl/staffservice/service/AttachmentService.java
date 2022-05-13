package com.tnl.staffservice.service;

import com.tnl.staffservice.dto.FileDTO;
import com.tnl.staffservice.entity.Attachment;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface AttachmentService {
    List<FileDTO> saveAll(MultipartFile[] file);
    Attachment getById(String fileId);
}
