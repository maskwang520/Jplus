package com.jplus.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

/**
 * 此类由MySQLToModel工具自动生成 
 * 备注(数据表的comment字段)：无备注信息
 * 
 * @author Chitry
 * @title 实验室成员信息实体
 * @since 2015-07-22 19:52:51
 */
public class Member implements Serializable{
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.purl
     *
     * @mbggenerated
     */
    @Autowired
    private User user;
    @Autowired
    private Identify identify;
    private String purl;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.descriptions
     *
     * @mbggenerated
     */
    private String descriptions;
    
    
    private String mp3; 


	public String getMp3() {
		return mp3;
	}

	public void setMp3(String mp3) {
		this.mp3 = mp3;
	}

	/**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.cotents
     *
     * @mbggenerated
     */
    private String cotents;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.nowaddress
     *
     * @mbggenerated
     */
    private String nowaddress;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.nowwork
     *
     * @mbggenerated
     */
    private String nowwork;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.myplan
     *
     * @mbggenerated
     */
    private String myplan;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.knowsphere
     *
     * @mbggenerated
     */
    private String knowsphere;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.skills
     *
     * @mbggenerated
     */
    private String skills;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.educations
     *
     * @mbggenerated
     */
    private String educations;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.workbk
     *
     * @mbggenerated
     */
    private String workbk;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.suggestions
     *
     * @mbggenerated
     */
    private String suggestions;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.qq
     *
     * @mbggenerated
     */
    private String qq;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.telephone
     *
     * @mbggenerated
     */
    private String telephone;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.email
     *
     * @mbggenerated
     */
    private String email;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.weixinnum
     *
     * @mbggenerated
     */
    private String weixinnum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.blogs
     *
     * @mbggenerated
     */
    private String blogs;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.viewtype
     *
     * @mbggenerated
     */
    private Integer viewtype;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.pwurl
     *
     * @mbggenerated
     */
    private String pwurl;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.indentifytime
     *
     * @mbggenerated
     */
    private Date indentifytime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.user_id
     *
     * @mbggenerated
     */
    private Integer userId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_member.identify_id
     *
     * @mbggenerated
     */
    private Integer identifyId;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.id
     *
     * @return the value of j_member.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.id
     *
     * @param id the value for j_member.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.purl
     *
     * @return the value of j_member.purl
     *
     * @mbggenerated
     */
    
    
   
    public String getPurl() {
        return purl;
    }

    public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Identify getIdentify() {
		return identify;
	}

	public void setIdentify(Identify identify) {
		this.identify = identify;
	}

	/**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.purl
     *
     * @param purl the value for j_member.purl
     *
     * @mbggenerated
     */
    public void setPurl(String purl) {
        this.purl = purl;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.descriptions
     *
     * @return the value of j_member.descriptions
     *
     * @mbggenerated
     */
    public String getDescriptions() {
        return descriptions;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.descriptions
     *
     * @param descriptions the value for j_member.descriptions
     *
     * @mbggenerated
     */
    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.cotents
     *
     * @return the value of j_member.cotents
     *
     * @mbggenerated
     */
    public String getCotents() {
        return cotents;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.cotents
     *
     * @param cotents the value for j_member.cotents
     *
     * @mbggenerated
     */
    public void setCotents(String cotents) {
        this.cotents = cotents;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.nowaddress
     *
     * @return the value of j_member.nowaddress
     *
     * @mbggenerated
     */
    public String getNowaddress() {
        return nowaddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.nowaddress
     *
     * @param nowaddress the value for j_member.nowaddress
     *
     * @mbggenerated
     */
    public void setNowaddress(String nowaddress) {
        this.nowaddress = nowaddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.nowwork
     *
     * @return the value of j_member.nowwork
     *
     * @mbggenerated
     */
    public String getNowwork() {
        return nowwork;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.nowwork
     *
     * @param nowwork the value for j_member.nowwork
     *
     * @mbggenerated
     */
    public void setNowwork(String nowwork) {
        this.nowwork = nowwork;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.myplan
     *
     * @return the value of j_member.myplan
     *
     * @mbggenerated
     */
    public String getMyplan() {
        return myplan;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.myplan
     *
     * @param myplan the value for j_member.myplan
     *
     * @mbggenerated
     */
    public void setMyplan(String myplan) {
        this.myplan = myplan;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.knowsphere
     *
     * @return the value of j_member.knowsphere
     *
     * @mbggenerated
     */
    public String getKnowsphere() {
        return knowsphere;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.knowsphere
     *
     * @param knowsphere the value for j_member.knowsphere
     *
     * @mbggenerated
     */
    public void setKnowsphere(String knowsphere) {
        this.knowsphere = knowsphere;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.skills
     *
     * @return the value of j_member.skills
     *
     * @mbggenerated
     */
    public String getSkills() {
        return skills;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.skills
     *
     * @param skills the value for j_member.skills
     *
     * @mbggenerated
     */
    public void setSkills(String skills) {
        this.skills = skills;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.educations
     *
     * @return the value of j_member.educations
     *
     * @mbggenerated
     */
    public String getEducations() {
        return educations;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.educations
     *
     * @param educations the value for j_member.educations
     *
     * @mbggenerated
     */
    public void setEducations(String educations) {
        this.educations = educations;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.workbk
     *
     * @return the value of j_member.workbk
     *
     * @mbggenerated
     */
    public String getWorkbk() {
        return workbk;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.workbk
     *
     * @param workbk the value for j_member.workbk
     *
     * @mbggenerated
     */
    public void setWorkbk(String workbk) {
        this.workbk = workbk;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.suggestions
     *
     * @return the value of j_member.suggestions
     *
     * @mbggenerated
     */
    public String getSuggestions() {
        return suggestions;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.suggestions
     *
     * @param suggestions the value for j_member.suggestions
     *
     * @mbggenerated
     */
    public void setSuggestions(String suggestions) {
        this.suggestions = suggestions;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.qq
     *
     * @return the value of j_member.qq
     *
     * @mbggenerated
     */
    public String getQq() {
        return qq;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.qq
     *
     * @param qq the value for j_member.qq
     *
     * @mbggenerated
     */
    public void setQq(String qq) {
        this.qq = qq;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.telephone
     *
     * @return the value of j_member.telephone
     *
     * @mbggenerated
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.telephone
     *
     * @param telephone the value for j_member.telephone
     *
     * @mbggenerated
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.email
     *
     * @return the value of j_member.email
     *
     * @mbggenerated
     */
    public String getEmail() {
        return email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.email
     *
     * @param email the value for j_member.email
     *
     * @mbggenerated
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.weixinnum
     *
     * @return the value of j_member.weixinnum
     *
     * @mbggenerated
     */
    public String getWeixinnum() {
        return weixinnum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.weixinnum
     *
     * @param weixinnum the value for j_member.weixinnum
     *
     * @mbggenerated
     */
    public void setWeixinnum(String weixinnum) {
        this.weixinnum = weixinnum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.blogs
     *
     * @return the value of j_member.blogs
     *
     * @mbggenerated
     */
    public String getBlogs() {
        return blogs;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.blogs
     *
     * @param blogs the value for j_member.blogs
     *
     * @mbggenerated
     */
    public void setBlogs(String blogs) {
        this.blogs = blogs;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.viewtype
     *
     * @return the value of j_member.viewtype
     *
     * @mbggenerated
     */
    public Integer getViewtype() {
        return viewtype;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.viewtype
     *
     * @param viewtype the value for j_member.viewtype
     *
     * @mbggenerated
     */
    public void setViewtype(Integer viewtype) {
        this.viewtype = viewtype;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.pwurl
     *
     * @return the value of j_member.pwurl
     *
     * @mbggenerated
     */
    public String getPwurl() {
        return pwurl;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.pwurl
     *
     * @param pwurl the value for j_member.pwurl
     *
     * @mbggenerated
     */
    public void setPwurl(String pwurl) {
        this.pwurl = pwurl;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.indentifytime
     *
     * @return the value of j_member.indentifytime
     *
     * @mbggenerated
     */
    public Date getIndentifytime() {
        return indentifytime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.indentifytime
     *
     * @param indentifytime the value for j_member.indentifytime
     *
     * @mbggenerated
     */
    public void setIndentifytime(Date indentifytime) {
        this.indentifytime = indentifytime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.user_id
     *
     * @return the value of j_member.user_id
     *
     * @mbggenerated
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.user_id
     *
     * @param userId the value for j_member.user_id
     *
     * @mbggenerated
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_member.identify_id
     *
     * @return the value of j_member.identify_id
     *
     * @mbggenerated
     */
    public Integer getIdentifyId() {
        return identifyId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_member.identify_id
     *
     * @param identifyId the value for j_member.identify_id
     *
     * @mbggenerated
     */
    public void setIdentifyId(Integer identifyId) {
        this.identifyId = identifyId;
    }

	@Override
	public String toString() {
		return "Member [id=" + id + ", user=" + user + ", identify=" + identify
				+ ", purl=" + purl + ", descriptions=" + descriptions
				+ ", mp3=" + mp3 + ", cotents="
				+ cotents + ", nowaddress=" + nowaddress + ", nowwork="
				+ nowwork + ", myplan=" + myplan + ", knowsphere=" + knowsphere
				+ ", skills=" + skills + ", educations=" + educations
				+ ", workbk=" + workbk + ", suggestions=" + suggestions
				+ ", qq=" + qq + ", telephone=" + telephone + ", email="
				+ email + ", weixinnum=" + weixinnum + ", blogs=" + blogs
				+ ", viewtype=" + viewtype + ", pwurl=" + pwurl
				+ ", indentifytime=" + indentifytime + ", userId=" + userId
				+ ", identifyId=" + identifyId + "]";
	}
	
	
	 //添加部分
    private String membername;
    private String identifyname;
    private String viewtypename;
    private String indentifytimeString;
    
	public String getIndentifytimeString() {
		return indentifytimeString;
	}

	public void setIndentifytimeString(String indentifytimeString) {
		this.indentifytimeString = indentifytimeString;
	}

	public String getMembername() {
		return membername;
	}

	public void setMembername(String membername) {
		this.membername = membername;
	}

	public String getIdentifyname() {
		return identifyname;
	}

	public void setIdentifyname(String identifyname) {
		this.identifyname = identifyname;
	}

	public String getViewtypename() {
		return viewtypename;
	}

	public void setViewtypename(String viewtypename) {
		this.viewtypename = viewtypename;
	}
    
    
}