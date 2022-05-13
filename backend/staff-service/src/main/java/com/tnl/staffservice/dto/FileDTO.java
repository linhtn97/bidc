package com.tnl.staffservice.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
@AllArgsConstructor
public class FileDTO {
    private String fileName;
    private String fileType;
    private long fileSize;
    private String downloadURL;
}
