package com.tnl.staffservice.api.model;


import com.tnl.staffservice.exception.ApplicationException;
import org.springframework.stereotype.Component;

@Component
@SuppressWarnings(value = "all")
public class APIUtil {
    public static <T> RestAPIResponse<T> buildResponse(T data){
//        try{
            return new RestAPIResponse<>(APIStatus.SUCCESS.getStatus(), APIStatus.SUCCESS.name(), APIStatus.SUCCESS.getMessage(), data);
//        }catch (ApplicationException e){
////            String message = e.getApiStatus().getMessage();
////            if(e.getCustomMessage() != null || e.getCustomMessage() != "") message +=" " + e.getCustomMessage();
////            return new RestAPIResponse<>(e.getApiStatus().getStatus(), e.getApiStatus().name(), message);
//            return new RestAPIResponse<>(e.getApiStatus().getStatus(), e.getApiStatus().name(), e.getApiStatus().getMessage());
//        }
    }
 }