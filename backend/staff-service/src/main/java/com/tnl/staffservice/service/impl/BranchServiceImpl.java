package com.tnl.staffservice.service.impl;

import com.tnl.staffservice.api.model.APIStatus;
import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.entity.Branch;
import com.tnl.staffservice.exception.ApplicationException;
import com.tnl.staffservice.repository.BranchRepository;
import com.tnl.staffservice.service.BranchService;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BranchServiceImpl implements BranchService {
    private final BranchRepository branchRepository;
    @Override
    public Branch createOne(RestAPIRequest<Branch> request) {
        try {
            Branch newBranch = request.getObjFil();
            if(newBranch.getCode() == null) throw new ApplicationException(APIStatus.BRANCH_CODE_MUST_BE_NOT_NULL);
            return branchRepository.save(newBranch);
        } catch (ApplicationException e){
            throw e;
        }
    }

    @Override
    public List<Branch> getAll() {
        return branchRepository.findAll();
    }

    @Override
    public Branch findByCode(String code) {
        try{
            Optional<Branch> optionalBranch = branchRepository.findByCode(code);
            if (optionalBranch.isEmpty()) throw new ApplicationException(APIStatus.BRANCH_NOT_EXISTS);
            return optionalBranch.get();
        } catch (ApplicationException e){
            throw e;
        }
    }
}
