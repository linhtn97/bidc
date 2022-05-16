package com.tnl.staffservice.dto.request;

import com.tnl.staffservice.api.model.APIStatus;
import lombok.*;

import javax.validation.constraints.NotNull;

@Data
@Getter
@Builder
@NoArgsConstructor
public class StaffFilter {
    String code;
    String fullName;
    String preDateOfBirth;
    String nextDateOfBirth;
    String preJoinDate;
    String nextJoinDate;
    Integer status;

    public StaffFilter(String code, String fullName, String preDateOfBirth, String nextDateOfBirth, String preJoinDate, String nextJoinDate,Integer status) {
        this.code = code;
        if (code != null) this.code = code.toLowerCase();
        this.fullName = fullName;
        if(fullName !=null) this.fullName = fullName.toLowerCase();
        this.preDateOfBirth = preDateOfBirth;
        this.nextDateOfBirth = nextDateOfBirth;
        this.preJoinDate = preJoinDate;
        this.nextJoinDate = nextJoinDate;
        this.status = status;
    }
}
