package com.jplus.service.impl;
/*
 * author maskwang
 */
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.MemberMapper;
import com.jplus.model.Member;
import com.jplus.service.MemberService;
@Service("memberService")
public class MemberServiceImpl implements MemberService {

	private MemberMapper memberMapper;
	

	public MemberMapper getMemberMapper() {
		return memberMapper;
	}
	@Autowired
	public void setMemberMapper(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	@Override
	public String delete(Integer id) {
		if (memberMapper.deleteByPrimaryKey(id) == 1) {
			return "删除成功";
		}
		return "删除失败";
	}

	@Override
	public String add(Member member) {
		if (memberMapper.insert(member) == 1) {
			return "添加成功";
		}
		return "添加失败";
	}

	@Override
	public Member findById(Integer id) {
		return memberMapper.selectByPrimary(id);
	}

	@Override
	public String update(Member member) {
		if (memberMapper.updateByPrimaryKeySelective(member) == 1) {
			return "更新成功";
		}
		return "更新失败";
	}

	@Override
	public List<Member> getAll() {
		return memberMapper.selectAll();
	}
	@Override
	public List<Member> getIdentifyUserMember(int id) {
		
		return memberMapper.getIdentifyUserMember(id);
	}

}
