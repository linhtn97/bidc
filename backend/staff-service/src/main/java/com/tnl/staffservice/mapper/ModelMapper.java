package com.tnl.staffservice.mapper;

import java.util.List;

public interface ModelMapper< D, E>{
    D toDto(E e);
    E toEntity(D d);

    List<D> toDto(E...e);
    List<E> toEntities(D...d);
}
