package com.jplus.service;

import java.util.List;

import com.jplus.model.Identify;
import com.jplus.model.Member;

public interface IdentifyService {
	String delete(Integer id);

    String add(Identify identify);
 
    Identify findById(Integer id);

    String update(Identify identify);
    
    List<Identify> getAll();
	
    List<Member> getIdentifyMember();
    
    Identify findByName(String uname);
    
    
    

}
