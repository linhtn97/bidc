package com.tnl.staffservice.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;


@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "staff")
public class Staff {
    @Id
    @GeneratedValue(generator = "uuid")
    @GenericGenerator(name = "uuid", strategy = "uuid2")
    private String id;
    private String code;
    private String firstName;
    private String lastName;
    private String fullName;

    @Temporal(TemporalType.DATE)
    @JsonFormat(pattern="dd/MM/yyyy")
    private Date dateOfBirth;
    private String branchCode;
    private String departmentCode;
    private String positionCode;
    @Temporal(TemporalType.DATE)
    @JsonFormat(pattern="dd/MM/yyyy")
    private Date joinDate;
    private Integer status;

    public Staff(String id, String code, String firstName, String lastName, Date dateOfBirth, String branchCode, String departmentCode, String positionCode, Date joinDate, Integer status) {
        this.id = id;
        this.code = code;
        this.firstName = firstName;
        this.lastName = lastName;
        this.fullName = firstName + " " + lastName;
        this.dateOfBirth = dateOfBirth;
        this.branchCode = branchCode;
        this.departmentCode = departmentCode;
        this.positionCode = positionCode;
        this.joinDate = joinDate;
        this.status = status;
    }
}
