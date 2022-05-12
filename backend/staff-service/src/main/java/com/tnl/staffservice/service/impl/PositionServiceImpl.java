package com.tnl.staffservice.service.impl;

import com.tnl.staffservice.api.model.APIStatus;
import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.entity.Position;
import com.tnl.staffservice.entity.Staff;
import com.tnl.staffservice.exception.ApplicationException;
import com.tnl.staffservice.repository.PositionRepository;
import com.tnl.staffservice.service.PositionService;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@NoArgsConstructor
@AllArgsConstructor
public class PositionServiceImpl implements PositionService {
    private PositionRepository positionRepository;
    @Override
    public Position createOne(RestAPIRequest<Position> request) {
        try {
            Position newPosition = request.getObjFil();
            if(newPosition.getCode() == null) throw new ApplicationException(APIStatus.POSITION_CODE_MUST_BE_NOT_NULL);
            return positionRepository.save(newPosition);
        } catch (ApplicationException e){
            throw e;
        }
    }
}
