package com.tnl.staffservice.api.controller;

import com.tnl.staffservice.api.model.APIUtil;
import com.tnl.staffservice.api.model.RestAPIResponse;
import com.tnl.staffservice.entity.Attachment;
import com.tnl.staffservice.service.AttachmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
@RequestMapping("/attachment")
@RequiredArgsConstructor
public class AttachmentController {
    private final AttachmentService attachmentService;

    @PostMapping("/upload")
    public RestAPIResponse<?> upload(@RequestParam("files") MultipartFile[] files){
        return APIUtil.buildResponse(attachmentService.saveAll(files));
    }

    @GetMapping("/download/{fileId}")
    public ResponseEntity<Resource> download(@PathVariable String fileId){
        Attachment attachment = null;
        attachment = attachmentService.getById(fileId);
        return ResponseEntity
                .ok()
                .contentType(MediaType.parseMediaType(attachment.getFileType()))
                .header(HttpHeaders.CONTENT_DISPOSITION,"attachment; filename=\"" + attachment.getFileName()+"\"")
                .body(new ByteArrayResource(attachment.getData())) ;
    }
}
