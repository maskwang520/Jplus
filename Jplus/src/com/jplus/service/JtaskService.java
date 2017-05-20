package com.jplus.service;
/*
 * author maskwang
 */
import java.util.List;

import com.jplus.model.Jtask;
import com.jplus.model.TaskPage;

public interface JtaskService {

	String delete(Integer id);

    String add(Jtask jtask);
 
    Jtask findById(Integer id);

    String update(Jtask jtask);
    
    List<Jtask> getAll();
    
    List<Jtask> getUserJtask(TaskPage taskpage);
    
    int getTaskTotal();

}
