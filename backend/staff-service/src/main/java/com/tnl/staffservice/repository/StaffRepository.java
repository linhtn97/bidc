package com.tnl.staffservice.repository;

import com.tnl.staffservice.dto.StaffReportDTO;
import com.tnl.staffservice.entity.Staff;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface StaffRepository extends JpaRepository<Staff,String> {
    Optional<Staff> findById(String id);
    Optional<Staff> findByCode(String code);

//    @Query("SELECT st.id,st.code,st.firstName,st.lastName,st.joinDate,st. FROM Staff st left join  Branch br on st.branchId = br.id left join Department dp on st.departmentId = dp.id left join Position po on st.positionId = po.id WHERE (:code is null or LOWER(st.code) like %:code%) and (:fullName is null or lower(st.fullName) like %:fullName%) and (:preDateOfBirth is null or st.dateOfBirth between :preDateOfBirth and :nextDateOfBirth) and (:preJoinDate is null or st.joinDate between :preJoinDate and :nextJoinDate)")
//    List<Staff> searchByFilter(
//            @Param("code") String code,
//            @Param("fullName") String fullName,
//            @Param("preDateOfBirth") Date preDateOfBirth,
//            @Param("nextDateOfBirth") Date nextDateOfBirth,
//            @Param("preJoinDate") Date preJoinDate,
//            @Param("nextJoinDate") Date nextJoinDate
//    );
    @Procedure("proc_staff_report")
    List<Object[]> searchByFilter(
            String code,
            String fullName,
            Date preDateOfBirth,
            Date nextDateOfBirth,
            Date preJoinDate,
            Date nextJoinDate
    );
}
