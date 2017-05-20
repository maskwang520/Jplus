package com.jplus.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jplus.dao.AccessSumMapper;
import com.jplus.dao.BBSRecommendMapper;
import com.jplus.dao.ClosewebMapper;
import com.jplus.dao.FriendLinkMapper;
import com.jplus.dao.IdentifyMapper;
import com.jplus.dao.JnoticeMapper;
import com.jplus.dao.JplusDescMapper;
import com.jplus.dao.JtaskMapper;
import com.jplus.dao.MemberMapper;
import com.jplus.dao.NavUrlMapper;
import com.jplus.dao.NetPurlMapper;
import com.jplus.dao.ResClassMapper;
import com.jplus.dao.ResMapper;
import com.jplus.dao.ToolOfficeRecommendMapper;
import com.jplus.dao.UserLevelMapper;
import com.jplus.dao.UserMapper;
import com.jplus.dao.UserMsgMapper;
import com.jplus.dao.VedioRecommendMapper;
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
import com.jplus.service.SystemManageService;
import com.sun.jdi.IntegerValue;

@Service("systemManageService")
public class SystemManageServiceImpl implements SystemManageService {
	private UserMapper userMapper;
	private UserLevelMapper userLevelMapper;
	private MemberMapper memberMapper;
	private UserMsgMapper usermsgmapper;
	private IdentifyMapper identifyMapper;
	private AccessSumMapper accessSumMapper;
	private FriendLinkMapper friendLinkMapper;
	private NetPurlMapper netPurlMapper;
	private NavUrlMapper navUrlMapper;
	private BBSRecommendMapper bBSRecommendMapper;
	private VedioRecommendMapper vedioRecommendMapper;
	private ToolOfficeRecommendMapper toolOfficeRecommendMapper;
	private JnoticeMapper jnoticeMapper;
	private JtaskMapper jtaskMapper;
	private ResClassMapper resClassMapper;
	private ResMapper resMapper;
	private JplusDescMapper jplusDesMapper;
	private ClosewebMapper closewebMapper;
	
	
	public ClosewebMapper getClosewebMapper() {
		return closewebMapper;
	}
	@Autowired
	public void setClosewebMapper(ClosewebMapper closewebMapper) {
		this.closewebMapper = closewebMapper;
	}
	public JplusDescMapper getJplusDesMapper() {
		return jplusDesMapper;
	}
	@Autowired
	public void setJplusDesMapper(JplusDescMapper jplusDesMapper) {
		this.jplusDesMapper = jplusDesMapper;
	}
	public ResMapper getResMapper() {
		return resMapper;
	}
	@Autowired
	public void setResMapper(ResMapper resMapper) {
		this.resMapper = resMapper;
	}
	public ResClassMapper getResClassMapper() {
		return resClassMapper;
	}
	@Autowired
	public void setResClassMapper(ResClassMapper resClassMapper) {
		this.resClassMapper = resClassMapper;
	}
	public JtaskMapper getJtaskMapper() {
		return jtaskMapper;
	}
	@Autowired
	public void setJtaskMapper(JtaskMapper jtaskMapper) {
		this.jtaskMapper = jtaskMapper;
	}
	public JnoticeMapper getJnoticeMapper() {
		return jnoticeMapper;
	}
	@Autowired
	public void setJnoticeMapper(JnoticeMapper jnoticeMapper) {
		this.jnoticeMapper = jnoticeMapper;
	}
	public ToolOfficeRecommendMapper getToolOfficeRecommendMapper() {
		return toolOfficeRecommendMapper;
	}
	@Autowired
	public void setToolOfficeRecommendMapper(
			ToolOfficeRecommendMapper toolOfficeRecommendMapper) {
		this.toolOfficeRecommendMapper = toolOfficeRecommendMapper;
	}
	public VedioRecommendMapper getVedioRecommendMapper() {
		return vedioRecommendMapper;
	}
	@Autowired
	public void setVedioRecommendMapper(VedioRecommendMapper vedioRecommendMapper) {
		this.vedioRecommendMapper = vedioRecommendMapper;
	}
	public BBSRecommendMapper getbBSRecommendMapper() {
		return bBSRecommendMapper;
	}
	@Autowired
	public void setbBSRecommendMapper(BBSRecommendMapper bBSRecommendMapper) {
		this.bBSRecommendMapper = bBSRecommendMapper;
	}
	public NavUrlMapper getNavUrlMapper() {
		return navUrlMapper;
	}
	@Autowired
	public void setNavUrlMapper(NavUrlMapper navUrlMapper) {
		this.navUrlMapper = navUrlMapper;
	}
	public NetPurlMapper getNetPurlMapper() {
		return netPurlMapper;
	}
	@Autowired
	public void setNetPurlMapper(NetPurlMapper netPurlMapper) {
		this.netPurlMapper = netPurlMapper;
	}
	public FriendLinkMapper getFriendLinkMapper() {
		return friendLinkMapper;
	}
	@Autowired
	public void setFriendLinkMapper(FriendLinkMapper friendLinkMapper) {
		this.friendLinkMapper = friendLinkMapper;
	}
	public AccessSumMapper getAccessSumMapper() {
		return accessSumMapper;
	}
	@Autowired
	public void setAccessSumMapper(AccessSumMapper accessSumMapper) {
		this.accessSumMapper = accessSumMapper;
	}

	public IdentifyMapper getIdentifyMapper() {
		return identifyMapper;
	}
	
	@Autowired
	public void setIdentifyMapper(IdentifyMapper identifyMapper) {
		this.identifyMapper = identifyMapper;
	}

	public UserMsgMapper getUsermsgmapper() {
		return usermsgmapper;
	}
	
	@Autowired
	public void setUsermsgmapper(UserMsgMapper usermsgmapper) {
		this.usermsgmapper = usermsgmapper;
	}

	public MemberMapper getMemberMapper() {
		return memberMapper;
	}
	
	@Autowired
	public void setMemberMapper(MemberMapper memberMapper) {
		this.memberMapper = memberMapper;
	}

	public UserLevelMapper getUserLevelMapper() {
		return userLevelMapper;
	}

	@Autowired
	public void setUserLevelMapper(UserLevelMapper userLevelMapper) {
		this.userLevelMapper = userLevelMapper;
	}

	public UserMapper getUserMapper() {
		return userMapper;
	}

	@Autowired
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	public User findUserByNPL(String username, String password, String limit) {
		// TODO Auto-generated method stub
		return userMapper.findUserByNPL(username, password, limit);
	}

	@Override
	public List<User> findAllUser() {
		return userMapper.findAllUser();
	}

	@Override
	public UserLevel findUserlevel(int userlevelId) {
		// TODO Auto-generated method stub
		return userLevelMapper.selectByPrimaryKey(userlevelId);
	}

//	@Override
//	public List<User> findUserByUnios(String username, String realname,
//			String telephone, String qq, String limits, String identifys,
//			String userlevelId) {
//		
//		return userMapper.findUserByUnios(username, realname,telephone,qq,limits,identifys,userlevelId);
//	}

	@Override
	public User findUserByuserId(String id) {
		return userMapper.findUserByuserId(id);
	}

	@Override
	public void deleteUserByuserId(String id) {
		 userMapper.deleteUserByuserId(id);
	}

	@Override
	public void updateUser(User user) {
		userMapper.updateByPrimaryKeySelective(user);
	}

	@Override
	public List<Member> findAllMembers() {
		return memberMapper.selectAll();
	}

	@Override
	public Member findMemberById(String id) {
		return memberMapper.selectByPrimaryKey(Integer.valueOf(id));
	}

	@Override
	public void updateMember(Member m) {
		memberMapper.updateByPrimaryKeySelective(m);
	}

	@Override
	public void deleteMemberByuserId(String id) {
		memberMapper.deleteByPrimaryKey(Integer.valueOf(id));
	}

	@Override
	public List<UserMsg> findAllUsermsg() {
		return usermsgmapper.selectAll();
	}

	@Override
	public UserMsg findUserMsgById(String id) {
		return usermsgmapper.selectByPrimaryKey(Integer.valueOf(id));
	}

	@Override
	public void updateUserMsgById(UserMsg um) {
		usermsgmapper.updateByPrimaryKeySelective(um);
	}

	@Override
	public void deletedeleteUserMsgById(String id) {
		usermsgmapper.deleteByPrimaryKey(Integer.valueOf(id));
	}

	@Override
	public List<UserLevel> findAllLevel() {
		return userLevelMapper.selectAll();
	}

	@Override
	public void updateUserLevel(UserLevel ul) {
		userLevelMapper.updateByPrimaryKeySelective(ul);
	}

	@Override
	public List<Identify> findAllIndentify() {
		return identifyMapper.selectAll();
	}

	@Override
	public Identify findIdentifyById(String id) {
		return identifyMapper.selectByPrimaryKey(Integer.valueOf(id));
	}

	@Override
	public void updateIdentify(Identify iden) {
		identifyMapper.updateByPrimaryKeySelective(iden);
	}

	@Override
	public void deleteIdentifyById(String id) {
		identifyMapper.deleteByPrimaryKey(Integer.valueOf(id));
	}

	@Override
	public void addIdentify(Identify iden) {
		identifyMapper.insertSelective(iden);
	}

	@Override
	public Member findMemberByuserId(String id) {
		return memberMapper.findMemberByuserId(id);
	}

	@Override
	public User findUserBylimits(int limits) {
		return userMapper.findUserBylimits(limits);
	}

	@Override
	public List<AccessSum> findUserAccess() {
		return accessSumMapper.selectAll();
	}
	@Override
	public AccessSum findUserAccessById(String id) {
		return accessSumMapper.selectByPrimaryKey(Integer.valueOf(id));
	}
	@Override
	public void updateUserAccess(AccessSum acc) {
		accessSumMapper.updateByPrimaryKeySelective(acc);
	}
	@Override
	public List<FriendLink> findFriendlink() {
		return friendLinkMapper.selectAll();
	}
	@Override
	public FriendLink findFriendLinkById(String id) {
		return friendLinkMapper.selectByPrimaryKey(Integer.valueOf(id));
	}
	@Override
	public void updateFriendlink(FriendLink fl) {
		friendLinkMapper.updateByPrimaryKeySelective(fl);
	}
	@Override
	public List<NetPurl> findNetPurl() {
		return netPurlMapper.selectAll();
	}
	@Override
	public NetPurl findNetPurlById(String id) {
		return netPurlMapper.selectByPrimaryKey(Integer.valueOf(id));
	}
	@Override
	public void updateNetPurl(NetPurl np) {
		netPurlMapper.updateByPrimaryKeySelective(np);
	}
	@Override
	public List<NavUrl> findNavUrl() {
		return navUrlMapper.selectAll();
	}
	@Override
	public NavUrl findNavUrlById(String id) {
		return navUrlMapper.selectByPrimaryKey(Integer.valueOf(id));
	}
	@Override
	public void updateNavUrl(NavUrl nv) {
		navUrlMapper.updateByPrimaryKeySelective(nv);
	}
	@Override
	public List<BBSRecommend> findBbsRecommend() {
		return bBSRecommendMapper.selectAll();
	}
	@Override
	public BBSRecommend findBbsRecommendById(String id) {
		return bBSRecommendMapper.selectByPrimaryKey(Integer.valueOf(id));
	}
	@Override
	public void updateBbsRecommend(BBSRecommend br) {
		bBSRecommendMapper.updateByPrimaryKeySelective(br);
	}
	@Override
	public List<VedioRecommend> findVedioRecommend() {
		return vedioRecommendMapper.selectAll();
	}
	@Override
	public VedioRecommend findVedioRecommendId(String id) {
		return vedioRecommendMapper.selectByPrimaryKey(Integer.valueOf(id));
	}
	@Override
	public void updateVedioRecommend(VedioRecommend vr) {
		vedioRecommendMapper.updateByPrimaryKeySelective(vr);
	}
	@Override
	public List<ToolOfficeRecommend> findToolRecommend() {
		return toolOfficeRecommendMapper.selectAll();
	}
	@Override
	public ToolOfficeRecommend findToolRecommendById(String id) {
		return toolOfficeRecommendMapper.selectByPrimaryKey(Integer.valueOf(id));
	}
	@Override
	public void updateToolRecommend(ToolOfficeRecommend tr) {
		toolOfficeRecommendMapper.updateByPrimaryKeySelective(tr);
	}
	@Override
	public List<Jnotice> findNotices() {
		return jnoticeMapper.selectAll();
	}
	@Override
	public Jnotice findNoticesById(String id) {
		return jnoticeMapper.selectByPrimaryKey(Integer.valueOf(id));
	}
	@Override
	public void updateNotices(Jnotice jt) {
		jnoticeMapper.updateByPrimaryKeySelective(jt);
	}
	@Override
	public void deleteNotices(Integer id) {
		jnoticeMapper.deleteByPrimaryKey(id);
	}
	@Override
	public void addNotices(Jnotice jt) {
		jnoticeMapper.insertSelective(jt);
	}
	@Override
	public List<Jtask> findTaks() {
		return jtaskMapper.selectAll();
	}
	@Override
	public Jtask findTasksById(String id) {
		return jtaskMapper.selectByPrimaryKey(Integer.valueOf(id));
	}
	@Override
	public void updateTasks(Jtask jt) {
		jtaskMapper.updateByPrimaryKeySelective(jt);
	}
	@Override
	public void deleteTasks(Integer id) {
		jtaskMapper.deleteByPrimaryKey(id);
	}
	@Override
	public void addTasks(Jtask jt) {
		jtaskMapper.insertSelective(jt);
	}
	@Override
	public List<ResClass> findResclass() {
		return resClassMapper.selectAll();
	}
	@Override
	public ResClass findResclassById(Integer id) {
		return resClassMapper.selectByPrimaryKey(id);
	}
	@Override
	public void updateResclass(ResClass rc) {
		resClassMapper.updateByPrimaryKeySelective(rc);
	}
	@Override
	public void addResclass(ResClass rc) {
		resClassMapper.insertSelective(rc);
	}
	@Override
	public void deleteResclass(Integer id) {
		resClassMapper.deleteByPrimaryKey(id);
	}
	@Override
	public List<Res> findRes() {
		return resMapper.selectAll();
	}
	@Override
	public Res findResById(Integer id) {
		return resMapper.selectByPrimaryKey(id);
	}
	@Override
	public void updateRes(Res r) {
		resMapper.updateByPrimaryKeySelective(r);
	}
	@Override
	public void deleteRes(Integer id) {
		resMapper.deleteByPrimaryKey(id);
	}
	@Override
	public void addRess(Res r) {
		resMapper.insertSelective(r);
	}
	@Override
	public List<JplusDesc> findJplusDes() {
		return jplusDesMapper.selectAll();
	}
	@Override
	public JplusDesc findJplusDesById(Integer id) {
		return jplusDesMapper.selectByPrimaryKey(id);
	}
	@Override
	public void updateJplusDes(JplusDesc jd) {
		jplusDesMapper.updateByPrimaryKeySelective(jd);
	}
	@Override
	public Closeweb findClodewebById(int i) {
		return closewebMapper.selectByPrimaryKey(i);
	}
	@Override
	public void updateClodeweb(Closeweb c) {
		 closewebMapper.updateByPrimaryKeySelective(c);
	}
	@Override
	public void addFriendLink(FriendLink fl) {
		friendLinkMapper.insertSelective(fl);
	}
	@Override
	public void addNavUrl(NavUrl nv) {
		navUrlMapper.insertSelective(nv);
	}
	@Override
	public void addBs(BBSRecommend bs) {
		bBSRecommendMapper.insertSelective(bs);
	}	

}
