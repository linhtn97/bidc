package com.tnl.staffservice.service;

import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.entity.Department;

import java.util.List;

public interface DepartmentService {
    Department createOne(RestAPIRequest<Department> request);
    List<Department> getAll();
    Department findByCode(String code);
}
