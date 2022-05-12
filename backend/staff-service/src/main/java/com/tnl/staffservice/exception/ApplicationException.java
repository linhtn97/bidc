package com.tnl.staffservice.exception;

import com.tnl.staffservice.api.model.APIStatus;
import lombok.Getter;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Getter
public class ApplicationException extends RuntimeException {
    private final APIStatus apiStatus;
}
