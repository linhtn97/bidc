package com.tnl.staffservice.api.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class RestAPIRequest<O>{
    O objFil;
}
