package com.tnl.staffservice.api.model;

import lombok.Getter;

@Getter
public enum APIStatus {
    STAFF_CODE_MUST_BE_NOT_NULL(410,"Staff code must be not null"),
    DEPARTMENT_CODE_MUST_BE_NOT_NULL(410,"Department code must be not null"),
    POSITION_CODE_MUST_BE_NOT_NULL(410,"Position code must be not null"),
    BRANCH_CODE_MUST_BE_NOT_NULL(410,"Branch code must be not null"),

    STAFF_CODE_ALREADY_EXISTS(410,"Staff code already exists"),
    DEPARTMENT_CODE_ALREADY_EXISTS(410,"Department code already exists"),
    POSITION_CODE_ALREADY_EXISTS(410,"Position code already exists"),
    BRANCH_CODE_ALREADY_EXISTS(410,"Branch code already exists"),

    STAFF_NOT_EXISTS(410,"Staff not exists"),
    DEPARTMENT_NOT_EXISTS(410,"Department not exists"),
    POSITION_NOT_EXISTS(410,"Position not exists"),
    BRANCH_NOT_EXISTS(410,"Branch not exists"),

    NO_DATA_TO_EXPORT_FILE(410,"No data to export file"),

    //default
    INTERNAL_SERVER(500, "Internal Service"),
    BAD_REQUEST(400, "Bad request parameters"),
    NOT_FOUND(404, "Not Found"),
    PRODUCT_SAVE_ERROR(123, "Not Found"), //vi , en
    SUCCESS(200, "Ok");

    private int status;
    private String message;

    APIStatus(int status, String message) {
        this.status = status;
        this.message = message;
    }
}