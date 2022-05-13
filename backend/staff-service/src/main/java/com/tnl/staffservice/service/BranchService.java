package com.tnl.staffservice.service;

import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.entity.Branch;

import java.util.List;

public interface BranchService {
    Branch createOne(RestAPIRequest<Branch> request);
    List<Branch> getAll();
    Branch findByCode(String code);
}
