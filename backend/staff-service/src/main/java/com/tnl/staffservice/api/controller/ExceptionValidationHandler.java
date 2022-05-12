package com.tnl.staffservice.api.controller;

import com.tnl.staffservice.api.model.RestAPIResponse;
import com.tnl.staffservice.exception.ApplicationException;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

@ControllerAdvice
@RequiredArgsConstructor
public class ExceptionValidationHandler {
    @ExceptionHandler({ApplicationException.class})
    @ResponseBody
    protected RestAPIResponse<?> throwApplicationExceptionHandler(ApplicationException e) {
        return new RestAPIResponse<>(e.getApiStatus().getStatus(), e.getApiStatus().name(), e.getApiStatus().getMessage());
    }
}
