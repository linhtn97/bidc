package com.tnl.staffservice.dto.request;

import lombok.Data;

import java.sql.Date;

@Data
public class StaffFilter {
    String code;
    String fullName;
    Date preDateOfBirth;
    Date nextDateOfBirth;
    Date preJoinTime;
    Date nextJoinTime;
}
