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

    public StaffFilter(String code, String fullName, Date preDateOfBirth, Date nextDateOfBirth, Date preJoinTime, Date nextJoinTime) {
        this.code = code;
        if (code != null) this.code = code.toLowerCase();
        this.fullName = fullName;
        if(fullName !=null) this.fullName = fullName.toLowerCase();
        this.preDateOfBirth = preDateOfBirth;
        this.nextDateOfBirth = nextDateOfBirth;
        this.preJoinTime = preJoinTime;
        this.nextJoinTime = nextJoinTime;
    }

    Date nextJoinTime;
}
