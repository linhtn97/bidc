package com.tnl.staffservice.repository;

import com.tnl.staffservice.entity.Staff;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;
import java.util.Optional;

@Repository
public interface StaffRepository extends JpaRepository<Staff,String> {
    Optional<Staff> findByCode(String code);

    @Query("SELECT st " +
            "FROM Staff st " +
            "WHERE (:code is null or st.code like '%:code%') " +
            "and (:fullName is null or st.fullName like '%:fullName%') ")
    List<Staff> findByFilter(@Param("code") String code,@Param("fullName") String fullName);//
}
