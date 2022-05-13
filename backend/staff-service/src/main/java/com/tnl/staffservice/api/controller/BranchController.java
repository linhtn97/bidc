package com.tnl.staffservice.api.controller;

import com.tnl.staffservice.api.model.APIUtil;
import com.tnl.staffservice.api.model.RestAPIResponse;
import com.tnl.staffservice.service.BranchService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/branch")
@RequiredArgsConstructor
public class BranchController {
    private final BranchService branchService;

    @GetMapping("/find-by")
    RestAPIResponse<?> findByCode(@RequestParam String code){
        return APIUtil.buildResponse(branchService.findByCode(code));
    }

    @GetMapping("/get-all")
    public RestAPIResponse<?> getAll(){
        return APIUtil.buildResponse(branchService.getAll());
    }
}
