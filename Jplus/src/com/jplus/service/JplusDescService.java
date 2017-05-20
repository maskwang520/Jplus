package com.jplus.service;

import java.util.List;

import com.jplus.model.JplusDesc;

public interface JplusDescService {

	String delete(Integer id);

    String add(JplusDesc jplusDesc);
 
    JplusDesc findById(Integer id);

    String update(JplusDesc jplusDesc);
    
    List<JplusDesc> getAll();

}
