package com.jplus.service;
/*
 * author maskwang
 */
import java.util.List;

import com.jplus.model.Member;

public interface MemberService {

	String delete(Integer id);

    String add(Member member);
 
    Member findById(Integer id);

    String update(Member member);
    
    List<Member> getAll();
    
    List<Member> getIdentifyUserMember(int id);

}
