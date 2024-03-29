package com.model.member;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.model.orders.OrdersDTO;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Builder
public class MemberDTO {
    private String id       ; 
    private String passwd   ;
    private String mname    ;
    private String tel      ;
    private String email    ;
    private String zipcode  ;
    private String address1 ;
    private String address2 ;
    private String job      ;
    private String mdate    ;
    private String fname    ;
    private String grade    ;
    private MultipartFile fnameMF;
    
    private List<OrdersDTO> list;
}
