package com.tnl.staffservice.api.controller;

import com.tnl.staffservice.api.model.RestAPIResponse;
import com.tnl.staffservice.exception.ApplicationException;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import java.util.HashMap;
import java.util.Map;

@ControllerAdvice
@RequiredArgsConstructor
public class ExceptionValidationHandler {
    @ExceptionHandler({ApplicationException.class})
    @ResponseBody
    protected RestAPIResponse<?> throwApplicationExceptionHandler(ApplicationException e) {
        return new RestAPIResponse<>(e.getApiStatus().getStatus(), e.getApiStatus().name(), e.getApiStatus().getMessage());
    }

//    @ResponseStatus(HttpStatus.BAD_REQUEST)
//    @ExceptionHandler(MethodArgumentNotValidException.class)
//    public Map<String, String> handleValidationExceptions(
//            MethodArgumentNotValidException ex) {
//        Map<String, String> errors = new HashMap<>();
//        ex.getBindingResult().getAllErrors().forEach((error) -> {
//            String fieldName = ((FieldError) error).getField();
//            String errorMessage = error.getDefaultMessage();
//            errors.put(fieldName, errorMessage);
//        });
//        return errors;
//    }
}

