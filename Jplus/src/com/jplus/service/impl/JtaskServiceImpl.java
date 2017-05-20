package com.jplus.service.impl;
/*
 * author maskwang
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.JtaskMapper;
import com.jplus.model.Jtask;
import com.jplus.model.TaskPage;
import com.jplus.service.JtaskService;
@Service("jtaskService")
public class JtaskServiceImpl implements JtaskService {

	private JtaskMapper jtaskMapper;
	

	public JtaskMapper getJtaskMapper() {
		return jtaskMapper;
	}
	@Autowired
	public void setJtaskMapper(JtaskMapper jtaskMapper) {
		this.jtaskMapper = jtaskMapper;
	}

	@Override
	public String delete(Integer id) {
		if (jtaskMapper.deleteByPrimaryKey(id) == 1) {
			return "删除成功";
		}
		return "删除失败";
	}

	@Override
	public String add(Jtask jtask) {
		if (jtaskMapper.insert(jtask) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}

	@Override
	public Jtask findById(Integer id) {
		return jtaskMapper.selectByPrimaryKey(id);
	}

	@Override
	public String update(Jtask jtask) {
		if (jtaskMapper.updateByPrimaryKeySelective(jtask) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}

	@Override
	public List<Jtask> getAll() {
		return jtaskMapper.selectAll();
	}
	
	@Override
	public int getTaskTotal() {
		// TODO Auto-generated method stub
		return jtaskMapper.getTaskTotal();
	}
	@Override
	public List<Jtask> getUserJtask(TaskPage taskpage) {
		// TODO Auto-generated method stub
		return jtaskMapper.getUserJtask(taskpage);
	}
	
	

}
