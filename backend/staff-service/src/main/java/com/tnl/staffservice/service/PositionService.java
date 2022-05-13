package com.tnl.staffservice.service;

import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.entity.Position;

import java.util.List;

public interface PositionService {
    Position createOne(RestAPIRequest<Position> request);
    List<Position> getAll();
    Position findByCode(String code);
}
