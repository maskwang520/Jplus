package com.jplus.dao;

import java.util.List;

import com.jplus.model.Jtask;
import com.jplus.model.TaskPage;

/**
 * @author Chitry
 * 
 * @title JPlus常务任务大厅任务DAO
 * @since 2015-07-22 20:52:51
 */
public interface JtaskMapper {

	int deleteByPrimaryKey(Integer id);

    int insert(Jtask record);

    int insertSelective(Jtask record);

    Jtask selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Jtask record);

    int updateByPrimaryKeyWithBLOBs(Jtask record);

    int updateByPrimaryKey(Jtask record);
    
    List<Jtask> selectAll();
    
    List<Jtask> getUserJtask(TaskPage taskpage);
    
    int getTaskTotal();
}