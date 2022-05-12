package com.tnl.staffservice.service;

import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.dto.request.StaffFilter;
import com.tnl.staffservice.entity.Staff;
import org.springframework.web.bind.annotation.RequestBody;

import java.util.List;

public interface StaffService {
    Staff createOne(RestAPIRequest<Staff> request);
    List<Staff> getAll();
    Staff updateOne(String id, RestAPIRequest<Staff> request);
    List<Staff> findByFilter(RestAPIRequest<StaffFilter> request);
}
