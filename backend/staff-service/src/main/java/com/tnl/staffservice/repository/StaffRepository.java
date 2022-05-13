package com.tnl.staffservice.repository;

import com.tnl.staffservice.entity.Staff;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface StaffRepository extends JpaRepository<Staff,String> {
    Optional<Staff> findById(String id);
    Optional<Staff> findByCode(String code);

    @Query("SELECT st FROM Staff st WHERE (:code is null or LOWER(st.code) like %:code%) and (:fullName is null or lower(st.fullName) like %:fullName%) and (:preDateOfBirth is null or st.dateOfBirth between :preDateOfBirth and :nextDateOfBirth) and (:preJoinDate is null or st.joinDate between :preJoinDate and :nextJoinDate)")
    List<Staff> searchByFilter(
            @Param("code") String code,
            @Param("fullName") String fullName,
            @Param("preDateOfBirth") Date preDateOfBirth,
            @Param("nextDateOfBirth") Date nextDateOfBirth,
            @Param("preJoinDate") Date preJoinDate,
            @Param("nextJoinDate") Date nextJoinDate
    );
}
