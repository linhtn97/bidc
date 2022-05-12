package com.tnl.staffservice.service.impl;

import com.tnl.staffservice.api.model.APIStatus;
import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.entity.Department;
import com.tnl.staffservice.entity.Staff;
import com.tnl.staffservice.exception.ApplicationException;
import com.tnl.staffservice.repository.DepartmentRepository;
import com.tnl.staffservice.service.DepartmentService;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@NoArgsConstructor
@AllArgsConstructor
public class DepartmentServiceImpl implements DepartmentService {
    DepartmentRepository departmentRepository;
    @Override
    public Department createOne(RestAPIRequest<Department> request) {
        try {
            Department newDepartment = request.getObjFil();
            if(newDepartment.getCode() == null) throw new ApplicationException(APIStatus.DEPARTMENT_CODE_MUST_BE_NOT_NULL);
            return departmentRepository.save(newDepartment);
        } catch (ApplicationException e){
            throw e;
        }
    }
}
