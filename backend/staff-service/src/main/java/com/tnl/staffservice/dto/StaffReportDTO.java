package com.tnl.staffservice.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.*;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StaffReportDTO {
    private String id;
    private String code;
    private String firstName;
    private String lastName;
    private String dateOfBirth;
    private String joinDate;
    private String status;
    private String branch;
    private String department;
    private String position;
}
