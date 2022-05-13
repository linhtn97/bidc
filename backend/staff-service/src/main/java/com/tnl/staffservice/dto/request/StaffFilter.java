package com.tnl.staffservice.dto.request;

import lombok.Data;

@Data
public class StaffFilter {
    String code;
    String fullName;
    String preDateOfBirth;
    String nextDateOfBirth;
    String preJoinDate;
    String nextJoinDate;

    public StaffFilter(String code, String fullName, String preDateOfBirth, String nextDateOfBirth, String preJoinDate, String nextJoinDate) {
        this.code = code;
        if (code != null) this.code = code.toLowerCase();
        this.fullName = fullName;
        if(fullName !=null) this.fullName = fullName.toLowerCase();
        this.preDateOfBirth = preDateOfBirth;
        this.nextDateOfBirth = nextDateOfBirth;
        this.preJoinDate = preJoinDate;
        this.nextJoinDate = nextJoinDate;
    }
}
