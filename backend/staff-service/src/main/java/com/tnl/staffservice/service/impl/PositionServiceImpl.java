package com.tnl.staffservice.service.impl;

import com.tnl.staffservice.api.model.APIStatus;
import com.tnl.staffservice.api.model.RestAPIRequest;
import com.tnl.staffservice.entity.Position;
import com.tnl.staffservice.exception.ApplicationException;
import com.tnl.staffservice.repository.PositionRepository;
import com.tnl.staffservice.service.PositionService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class PositionServiceImpl implements PositionService {
    private final PositionRepository positionRepository;
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

    @Override
    public List<Position> getAll() {
        return positionRepository.findAll();
    }

    @Override
    public Position findByCode(String code) {
        try{
            Optional<Position> optionalPosition = positionRepository.findByCode(code);
            if(optionalPosition.isEmpty()) throw new ApplicationException(APIStatus.POSITION_NOT_EXISTS);
            return optionalPosition.get();
        }catch (ApplicationException e){
            throw e;
        }
    }
}
