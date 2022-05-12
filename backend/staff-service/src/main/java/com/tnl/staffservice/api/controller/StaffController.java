package com.tnl.staffservice.api.controller;

import com.tnl.staffservice.api.model.APIUtil;
import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.api.model.RestAPIResponse;
import com.tnl.staffservice.dto.request.StaffFilter;
import com.tnl.staffservice.entity.Staff;
import com.tnl.staffservice.service.StaffService;
import lombok.RequiredArgsConstructor;
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

    @PutMapping("/{id}")
    RestAPIResponse<?> updateOne(@PathVariable String id,@RequestBody RestAPIRequest<Staff> request){
        return APIUtil.buildResponse(staffService.updateOne(id,request));
    }

    @PostMapping("/find-by-filter")
    RestAPIResponse<?> findByFilter(@RequestBody RestAPIRequest<StaffFilter> request){
        return APIUtil.buildResponse(staffService.findByFilter(request));
    }
}
