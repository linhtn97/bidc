package com.tnl.staffservice.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.time.LocalDate;
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
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date dateOfBirth;
    private Long branchId;
    private Long departmentId;
    private Long positionId;
    @Temporal(TemporalType.DATE)
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date joinDate;
    private Integer status;

    public Staff(String code, String firstName, String lastName, Date dateOfBirth, Long branchId, Long departmentId, Long positionId, Date joinDate, Integer status) {
        this.code = code.trim();
        this.firstName = firstName;
        this.lastName = lastName;
        this.fullName = firstName + " " + lastName;
        this.dateOfBirth = dateOfBirth;
        this.branchId = branchId;
        this.departmentId = departmentId;
        this.positionId = positionId;
        this.joinDate = joinDate;
        this.status = status;
    }
}
