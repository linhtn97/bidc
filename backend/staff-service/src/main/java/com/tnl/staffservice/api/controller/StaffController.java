package com.tnl.staffservice.api.controller;

import com.tnl.staffservice.api.model.APIUtil;
import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.api.model.RestAPIResponse;
import com.tnl.staffservice.dto.AttachmentDTO;
import com.tnl.staffservice.dto.request.StaffFilter;
import com.tnl.staffservice.entity.Staff;
import com.tnl.staffservice.service.StaffService;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/staff")
@RequiredArgsConstructor
public class StaffController {
    private final StaffService staffService;

    @PostMapping("/create-one")
    RestAPIResponse<?> createOne(@RequestBody RestAPIRequest<Staff> request){
        return APIUtil.buildResponse(staffService.createOne(request));
    }

    @GetMapping("/get-all")
    RestAPIResponse<?> getAll(){
        return APIUtil.buildResponse(staffService.getAll());
    }

    @PutMapping("/update")
    RestAPIResponse<?> updateOne(@RequestParam String id,@RequestBody RestAPIRequest<Staff> request){
        return APIUtil.buildResponse(staffService.updateOne(id,request));
    }

    @PostMapping("/search-by-filter")
    RestAPIResponse<?> findByFilter(@RequestBody RestAPIRequest<StaffFilter> request){
        return APIUtil.buildResponse(staffService.searchByFilter(request));
    }

    @PostMapping("/export-excel")
    ResponseEntity<Resource> exportExcel(@RequestBody RestAPIRequest<StaffFilter> request){
        AttachmentDTO attachmentDTO = null;
        attachmentDTO = staffService.exportExcel(request);
        return ResponseEntity
                .ok()
                .contentType(MediaType.parseMediaType(attachmentDTO.getFileType()))
                .header(HttpHeaders.CONTENT_DISPOSITION,"attachment; filename=\"" + attachmentDTO.getFileName()+"\"")
                .body(new ByteArrayResource(attachmentDTO.getData())) ;
    }
}
