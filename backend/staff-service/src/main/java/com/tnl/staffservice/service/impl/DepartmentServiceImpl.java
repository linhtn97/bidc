package com.tnl.staffservice.service.impl;

import com.tnl.staffservice.api.model.APIStatus;
import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.entity.Department;
import com.tnl.staffservice.exception.ApplicationException;
import com.tnl.staffservice.repository.DepartmentRepository;
import com.tnl.staffservice.service.DepartmentService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class DepartmentServiceImpl implements DepartmentService {
    private final DepartmentRepository departmentRepository;
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

    @Override
    public List<Department> getAll() {
        return departmentRepository.findAll();
    }

    @Override
    public Department findByCode(String code) {
        try{
            Optional<Department> optionalDepartment = departmentRepository.findByCode(code);
            if(optionalDepartment.isEmpty()) throw new ApplicationException(APIStatus.DEPARTMENT_NOT_EXISTS);
            return optionalDepartment.get();
        }catch (ApplicationException e){
            throw e;
        }
    }
}
