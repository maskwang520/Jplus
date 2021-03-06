package com.jplus.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 此类由MySQLToModel工具自动生成 
 * 备注(数据表的comment字段)：无备注信息
 * 
 * @author Chitry
 * @title 用户实体
 * @since 2015-07-22 19:52:51
 */
public class User implements Serializable{
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.username
     *
     * @mbggenerated
     */
    private String username;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.password
     *
     * @mbggenerated
     */
    private String password;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.realname
     *
     * @mbggenerated
     */
    private String realname;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.certsnum
     *
     * @mbggenerated
     */
    private String certsnum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.age
     *
     * @mbggenerated
     */
    private Integer age;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.sex
     *
     * @mbggenerated
     */
    private Integer sex;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.regtime
     *
     * @mbggenerated
     */
    private Date regtime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.qq
     *
     * @mbggenerated
     */
    private String qq;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.telephone
     *
     * @mbggenerated
     */
    private String telephone;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.birthday
     *
     * @mbggenerated
     */
    private String birthday;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.hobby
     *
     * @mbggenerated
     */
    private String hobby;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.address
     *
     * @mbggenerated
     */
    private String address;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.email
     *
     * @mbggenerated
     */
    private String email;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.limits
     *
     * @mbggenerated
     */
    private Integer limits;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.identifys
     *
     * @mbggenerated
     */
    private Integer identifys;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.userlevel_id
     *
     * @mbggenerated
     */
    private UserLevel userLever;
    
    private Integer userlevelId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_user.scores
     *
     * @mbggenerated
     */
    private Integer scores;
    
    

	/**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.id
     *
     * @return the value of j_user.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.id
     *
     * @param id the value for j_user.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.username
     *
     * @return the value of j_user.username
     *
     * @mbggenerated
     */
    public String getUsername() {
        return username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.username
     *
     * @param username the value for j_user.username
     *
     * @mbggenerated
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.password
     *
     * @return the value of j_user.password
     *
     * @mbggenerated
     */
    public String getPassword() {
        return password;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.password
     *
     * @param password the value for j_user.password
     *
     * @mbggenerated
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.realname
     *
     * @return the value of j_user.realname
     *
     * @mbggenerated
     */
    public String getRealname() {
        return realname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.realname
     *
     * @param realname the value for j_user.realname
     *
     * @mbggenerated
     */
    public void setRealname(String realname) {
        this.realname = realname;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.certsnum
     *
     * @return the value of j_user.certsnum
     *
     * @mbggenerated
     */
    public String getCertsnum() {
        return certsnum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.certsnum
     *
     * @param certsnum the value for j_user.certsnum
     *
     * @mbggenerated
     */
    public void setCertsnum(String certsnum) {
        this.certsnum = certsnum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.age
     *
     * @return the value of j_user.age
     *
     * @mbggenerated
     */
    public Integer getAge() {
        return age;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.age
     *
     * @param age the value for j_user.age
     *
     * @mbggenerated
     */
    public void setAge(Integer age) {
        this.age = age;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.sex
     *
     * @return the value of j_user.sex
     *
     * @mbggenerated
     */
    public Integer getSex() {
        return sex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.sex
     *
     * @param sex the value for j_user.sex
     *
     * @mbggenerated
     */
    public void setSex(Integer sex) {
        this.sex = sex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.regtime
     *
     * @return the value of j_user.regtime
     *
     * @mbggenerated
     */
    public Date getRegtime() {
        return regtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.regtime
     *
     * @param regtime the value for j_user.regtime
     *
     * @mbggenerated
     */
    public void setRegtime(Date regtime) {
        this.regtime = regtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.qq
     *
     * @return the value of j_user.qq
     *
     * @mbggenerated
     */
    public String getQq() {
        return qq;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.qq
     *
     * @param qq the value for j_user.qq
     *
     * @mbggenerated
     */
    public void setQq(String qq) {
        this.qq = qq;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.telephone
     *
     * @return the value of j_user.telephone
     *
     * @mbggenerated
     */
    public String getTelephone() {
        return telephone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.telephone
     *
     * @param telephone the value for j_user.telephone
     *
     * @mbggenerated
     */
    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.birthday
     *
     * @return the value of j_user.birthday
     *
     * @mbggenerated
     */
    public String getBirthday() {
        return birthday;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.birthday
     *
     * @param birthday the value for j_user.birthday
     *
     * @mbggenerated
     */
    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.hobby
     *
     * @return the value of j_user.hobby
     *
     * @mbggenerated
     */
    public String getHobby() {
        return hobby;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.hobby
     *
     * @param hobby the value for j_user.hobby
     *
     * @mbggenerated
     */
    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.address
     *
     * @return the value of j_user.address
     *
     * @mbggenerated
     */
    public String getAddress() {
        return address;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.address
     *
     * @param address the value for j_user.address
     *
     * @mbggenerated
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.email
     *
     * @return the value of j_user.email
     *
     * @mbggenerated
     */
    public String getEmail() {
        return email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.email
     *
     * @param email the value for j_user.email
     *
     * @mbggenerated
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.limits
     *
     * @return the value of j_user.limits
     *
     * @mbggenerated
     */
    public Integer getLimits() {
        return limits;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.limits
     *
     * @param limits the value for j_user.limits
     *
     * @mbggenerated
     */
    public void setLimits(Integer limits) {
        this.limits = limits;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.identifys
     *
     * @return the value of j_user.identifys
     *
     * @mbggenerated
     */
    public Integer getIdentifys() {
        return identifys;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.identifys
     *
     * @param identifys the value for j_user.identifys
     *
     * @mbggenerated
     */
    public void setIdentifys(Integer identifys) {
        this.identifys = identifys;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.userlevel_id
     *
     * @return the value of j_user.userlevel_id
     *
     * @mbggenerated
     */
    public Integer getUserlevelId() {
        return userlevelId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.userlevel_id
     *
     * @param userlevelId the value for j_user.userlevel_id
     *
     * @mbggenerated
     */
    public void setUserlevelId(Integer userlevelId) {
        this.userlevelId = userlevelId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_user.scores
     *
     * @return the value of j_user.scores
     *
     * @mbggenerated
     */
    public Integer getScores() {
        return scores;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_user.scores
     *
     * @param scores the value for j_user.scores
     *
     * @mbggenerated
     */
    public void setScores(Integer scores) {
        this.scores = scores;
    }

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password="
				+ password + ", realname=" + realname + ", certsnum="
				+ certsnum + ", age=" + age + ", sex=" + sex + ", regtime="
				+ regtime + ", qq=" + qq + ", telephone=" + telephone
				+ ", birthday=" + birthday + ", hobby=" + hobby + ", address="
				+ address + ", email=" + email + ", limits=" + limits
				+ ", identifys=" + identifys + ", userLever=" + userLever
				+ ", userlevelId=" + userlevelId + ", scores=" + scores
				+ ", limitsString=" + limitsString + ", identifysString="
				+ identifysString + ", userlevelsString=" + userlevelsString
				+ "]";
	}
	
	
	 private String regtimeString;
    private String limitsString;
    private String identifysString;
    private String userlevelsString;

    
	public String getRegtimeString() {
		return regtimeString;
	}

	public void setRegtimeString(String regtimeString) {
		this.regtimeString = regtimeString;
	}

	public String getLimitsString() {
		return limitsString;
	}

	public void setLimitsString(String limitsString) {
		this.limitsString = limitsString;
	}

	public String getIdentifysString() {
		return identifysString;
	}

	public void setIdentifysString(String identifysString) {
		this.identifysString = identifysString;
	}

	public String getUserlevelsString() {
		return userlevelsString;
	}

	public void setUserlevelsString(String userlevelsString) {
		this.userlevelsString = userlevelsString;
	}
	
    
}