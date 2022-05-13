package com.tnl.staffservice.service;

import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.dto.FileDTO;
import com.tnl.staffservice.dto.request.StaffFilter;
import com.tnl.staffservice.entity.Staff;

import java.util.List;

public interface StaffService {
    Staff createOne(RestAPIRequest<Staff> request);
    List<Staff> getAll();
    Staff findById(String id);
    Staff updateOne(String id, RestAPIRequest<Staff> request);
    List<Staff> searchByFilter(RestAPIRequest<StaffFilter> request);
    FileDTO exportExcel(RestAPIRequest<StaffFilter> request);
}
