package com.tnl.staffservice.service.impl;

import com.tnl.staffservice.api.model.APIStatus;
import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.dto.request.StaffFilter;
import com.tnl.staffservice.entity.Staff;
import com.tnl.staffservice.exception.ApplicationException;
import com.tnl.staffservice.repository.StaffRepository;
import com.tnl.staffservice.service.StaffService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class StaffServiceImpl implements StaffService {
    private final StaffRepository staffRepository;

    @Override
    public Staff createOne(RestAPIRequest<Staff> request) {
        try {
            Staff newStaff = request.getObjFil();
            if(newStaff.getCode() == null) throw new ApplicationException(APIStatus.STAFF_CODE_MUST_BE_NOT_NULL);
            Optional<Staff> temp = staffRepository.findByCode(newStaff.getCode());
            if(temp.isPresent()) throw new ApplicationException(APIStatus.STAFF_CODE_ALREADY_EXISTS);
            newStaff.setFullName(newStaff.getFirstName()+ " "+ newStaff.getLastName());
            return staffRepository.save(newStaff);
        } catch (ApplicationException e){
            throw e;
        }
    }

    @Override
    public List<Staff> getAll() {
        return staffRepository.findAll();
    }

    @Override
    public Staff updateOne(String id, RestAPIRequest<Staff> request) {
        try {
            Optional<Staff> temp = staffRepository.findById(id);
            if(temp.isEmpty()) throw new ApplicationException(APIStatus.STAFF_NOT_EXISTS);
            Staff updatedStaff = temp.get();
            updatedStaff = request.getObjFil();
            updatedStaff.setId(id);
            return staffRepository.save(updatedStaff);
        } catch (ApplicationException e){
            throw e;
        }
    }

    @Override
    public List<Staff> findByFilter(RestAPIRequest<StaffFilter> request) {
        try{
            StaffFilter staffFilter = request.getObjFil();
            List<Staff> o = staffRepository.findByFilter(staffFilter.getCode(),staffFilter.getFullName());//
            System.out.println(o);
            return null;
        } catch (ApplicationException e){
            throw e;
        }
    }
}
