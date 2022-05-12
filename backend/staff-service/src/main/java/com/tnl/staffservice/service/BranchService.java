package com.tnl.staffservice.service;

import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.entity.Branch;

public interface BranchService {
    Branch createOne(RestAPIRequest<Branch> request);
}
