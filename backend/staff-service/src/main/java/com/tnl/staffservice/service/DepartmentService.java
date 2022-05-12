package com.tnl.staffservice.service;

import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.entity.Department;

public interface DepartmentService {
    Department createOne(RestAPIRequest<Department> request);
}
