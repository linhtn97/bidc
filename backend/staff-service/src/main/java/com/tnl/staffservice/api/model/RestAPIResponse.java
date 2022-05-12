package com.tnl.staffservice.api.model;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;

import java.io.Serializable;

@Data
public class RestAPIResponse<T> implements Serializable {
    private int status;
    private String code;
    private String message;
    private T data;

    public RestAPIResponse(T data) {
        this.data = data;
    }

    public RestAPIResponse(int status, String code, String message) {
        this.status = status;
        this.code = code;
        this.message = message;
    }

    public RestAPIResponse(int status, String code, String message,T data) {
        this.status = status;
        this.code = code;
        this.message = message;
        this.data = data;
    }
}
