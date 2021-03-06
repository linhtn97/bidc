package com.tnl.staffservice.api.controller;

import com.tnl.staffservice.api.model.APIUtil;
import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.api.model.RestAPIResponse;
import com.tnl.staffservice.dto.request.StaffFilter;
import com.tnl.staffservice.entity.Staff;
import com.tnl.staffservice.service.StaffService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
@CrossOrigin
@RequestMapping("/api/v1/staff")
@RequiredArgsConstructor
public class StaffController {
    private final StaffService staffService;

    @PostMapping("/create-one")
    public RestAPIResponse<?> createOne(@RequestBody RestAPIRequest<Staff> request){
        return APIUtil.buildResponse(staffService.createOne(request));
    }

    @GetMapping("/get-all")
    public RestAPIResponse<?> getAll(){
        return APIUtil.buildResponse(staffService.getAll());
    }

    @GetMapping("/find-by")
    RestAPIResponse<?> findByCode(@RequestParam String id){
        return APIUtil.buildResponse(staffService.findById(id));
    }

    @PutMapping("/update-one")
    public RestAPIResponse<?> updateOne(@RequestParam String id,@RequestBody RestAPIRequest<Staff> request){
        return APIUtil.buildResponse(staffService.updateOne(id,request));
    }

    @PostMapping("/search-by-filter")
    public RestAPIResponse<?> searchByFilter(@RequestBody RestAPIRequest<StaffFilter> request){
        return APIUtil.buildResponse(staffService.searchByFilter(request));
    }

    @PostMapping("/export-excel")
    public RestAPIResponse<?> exportExcel(@RequestBody RestAPIRequest<StaffFilter> request){
        return APIUtil.buildResponse(staffService.exportExcel(request));
    }

    @DeleteMapping("/delete-one")
    public RestAPIResponse<?> deleteOne(@RequestParam String id){
        return APIUtil.buildResponse(staffService.deleteOne(id));
    }

    @GetMapping("/get-create-form-info")
    public RestAPIResponse<?> createFormInfo(){
        return APIUtil.buildResponse(staffService.getCreateFormInfo());
    }
}
