package com.tnl.staffservice.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import java.sql.Date;

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
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date dateOfBirth;
    private Long unitId;
    private Long departmentId;
    private Long positionId;
    @JsonFormat(pattern="yyyy-MM-dd")
    private Date joinTime;
    private Integer status;

    public Staff(String id, String code, String firstName, String lastName, Date dateOfBirth, Long unitId, Long departmentId, Long positionId, Date joinTime, Integer status) {
        this.id = id;
        this.code = code;
        this.firstName = firstName;
        this.lastName = lastName;
        this.fullName = firstName + " " + lastName;
        this.dateOfBirth = dateOfBirth;
        this.unitId = unitId;
        this.departmentId = departmentId;
        this.positionId = positionId;
        this.joinTime = joinTime;
        this.status = status;
    }
}
