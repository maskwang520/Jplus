package com.jplus.service;

import java.util.List;
import java.util.Map;

import com.jplus.model.AccessSum;
import com.jplus.model.BBSRecommend;
import com.jplus.model.Closeweb;
import com.jplus.model.FriendLink;
import com.jplus.model.Identify;
import com.jplus.model.Jnotice;
import com.jplus.model.JplusDesc;
import com.jplus.model.Jtask;
import com.jplus.model.Member;
import com.jplus.model.NavUrl;
import com.jplus.model.NetPurl;
import com.jplus.model.Res;
import com.jplus.model.ResClass;
import com.jplus.model.ToolOfficeRecommend;
import com.jplus.model.User;
import com.jplus.model.UserLevel;
import com.jplus.model.UserMsg;
import com.jplus.model.VedioRecommend;

public interface SystemManageService {
	 User findUserByNPL(String username,String password,String levle);

	List<User> findAllUser();

//	List<User> findUserByUnios(String username, String realname,
//			String telephone,String qq,  String limits, String identifys,
//			String userlevelId);

	User findUserByuserId(String id);

	void deleteUserByuserId(String id);

	void updateUser(User user);

	List<Member> findAllMembers();

	Member findMemberById(String id);

	void updateMember(Member m);

	void deleteMemberByuserId(String id);

	List<UserMsg> findAllUsermsg();

	UserMsg findUserMsgById(String id);

	void updateUserMsgById(UserMsg um);

	void deletedeleteUserMsgById(String id);

	List<UserLevel> findAllLevel();
	
	UserLevel findUserlevel(int userlevelId);

	void updateUserLevel(UserLevel ul);

	List<Identify> findAllIndentify();

	Identify findIdentifyById(String id);

	void updateIdentify(Identify iden);

	void deleteIdentifyById(String id);

	void addIdentify(Identify iden);

	Member findMemberByuserId(String id);


	User findUserBylimits(int limits);

	List<AccessSum> findUserAccess();

	AccessSum findUserAccessById(String id);

	void updateUserAccess(AccessSum acc);


	List<FriendLink> findFriendlink();

	FriendLink findFriendLinkById(String id);

	void updateFriendlink(FriendLink fl);

	List<NetPurl> findNetPurl();

	NetPurl findNetPurlById(String id);

	void updateNetPurl(NetPurl np);

	List<NavUrl> findNavUrl();

	NavUrl findNavUrlById(String id);

	void updateNavUrl(NavUrl nv);

	List<BBSRecommend> findBbsRecommend();

	BBSRecommend findBbsRecommendById(String id);

	void updateBbsRecommend(BBSRecommend br);

	List<VedioRecommend> findVedioRecommend();

	VedioRecommend findVedioRecommendId(String id);

	void updateVedioRecommend(VedioRecommend vr);

	List<ToolOfficeRecommend> findToolRecommend();

	ToolOfficeRecommend findToolRecommendById(String id);

	void updateToolRecommend(ToolOfficeRecommend tr);

	List<Jnotice> findNotices();

	Jnotice findNoticesById(String id);

	void deleteNotices(Integer id);

	void addNotices(Jnotice jt);

	void updateNotices(Jnotice jt);

	List<Jtask> findTaks();

	Jtask findTasksById(String id);

	void updateTasks(Jtask jt);

	void deleteTasks(Integer id);

	void addTasks(Jtask jt);

	List<ResClass> findResclass();

	ResClass findResclassById(Integer id);

	void updateResclass(ResClass rc);

	void addResclass(ResClass rc);

	void deleteResclass(Integer id);

	List<Res> findRes();

	Res findResById(Integer id);

	void updateRes(Res r);

	void deleteRes(Integer id);

	void addRess(Res r);

	List<JplusDesc> findJplusDes();

	JplusDesc findJplusDesById(Integer id);

	void updateJplusDes(JplusDesc jd);

	Closeweb findClodewebById(int i);

	void updateClodeweb(Closeweb c);

	void addFriendLink(FriendLink fl);

	void addNavUrl(NavUrl nv);

	void addBs(BBSRecommend bs);

}
