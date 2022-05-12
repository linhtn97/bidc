package com.tnl.staffservice.service;

import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.entity.Position;

public interface PositionService {
    Position createOne(RestAPIRequest<Position> request);

}
