package com.jplus.service;
/*
 * author maskwang
 */
import java.util.List;

import com.jplus.model.Jnotice;

public interface JnoticeService {

	String delete(Integer id);

    String add(Jnotice jnotice);
 
    Jnotice findById(Integer id);

    String update(Jnotice jnotice);
    
    List<Jnotice> getAll();
    
    List<Jnotice> getUserJnotice();

}
