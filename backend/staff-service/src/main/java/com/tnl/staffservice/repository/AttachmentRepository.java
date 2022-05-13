package com.tnl.staffservice.repository;

import com.tnl.staffservice.entity.Attachment;
import com.tnl.staffservice.entity.Attachment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AttachmentRepository extends JpaRepository<Attachment,String> {
}
