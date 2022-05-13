package com.tnl.staffservice.api.controller;

import com.tnl.staffservice.api.model.APIUtil;
import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.api.model.RestAPIResponse;
import com.tnl.staffservice.service.PositionService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/position")
@RequiredArgsConstructor
public class PositionController {
    private final PositionService positionService;

    @GetMapping("/find-by")
    RestAPIResponse<?> findByCode(@RequestParam String code){
        return APIUtil.buildResponse(positionService.findByCode(code));
    }

    @GetMapping("/get-all")
    public RestAPIResponse<?> getAll(){
        return APIUtil.buildResponse(positionService.getAll());
    }
}
