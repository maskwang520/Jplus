package com.jplus.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 此类由MySQLToModel工具自动生成 
 * 备注(数据表的comment字段)：无备注信息
 * 
 * @author Chitry
 * @title 众筹赛场信息实体
 * @since 2015-07-22 19:52:51
 */
public class CrowdFunding implements Serializable{
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_type
     *
     * @mbggenerated
     */
    private Integer cdType;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_name
     *
     * @mbggenerated
     */
    private String cdName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_championprize
     *
     * @mbggenerated
     */
    private String cdChampionprize;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_secondprize
     *
     * @mbggenerated
     */
    private String cdSecondprize;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_thirdprize
     *
     * @mbggenerated
     */
    private String cdThirdprize;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_sponsor_id
     *
     * @mbggenerated
     */
    private Integer cdSponsorId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_dotime
     *
     * @mbggenerated
     */
    private Date cdDotime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_starttime
     *
     * @mbggenerated
     */
    private Date cdStarttime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_endtime
     *
     * @mbggenerated
     */
    private Date cdEndtime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_champion_id
     *
     * @mbggenerated
     */
    private Integer cdChampionId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_second_id
     *
     * @mbggenerated
     */
    private Integer cdSecondId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_third_id
     *
     * @mbggenerated
     */
    private Integer cdThirdId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_state
     *
     * @mbggenerated
     */
    private Integer cdState;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_redonum
     *
     * @mbggenerated
     */
    private Integer cdRedonum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_discuss
     *
     * @mbggenerated
     */
    private Integer cdDiscuss;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_description
     *
     * @mbggenerated
     */
    private String cdDescription;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_content
     *
     * @mbggenerated
     */
    private String cdContent;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_crowdfunding.cd_enddescr
     *
     * @mbggenerated
     */
    private String cdEnddescr;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.id
     *
     * @return the value of j_crowdfunding.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.id
     *
     * @param id the value for j_crowdfunding.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_type
     *
     * @return the value of j_crowdfunding.cd_type
     *
     * @mbggenerated
     */
    public Integer getCdType() {
        return cdType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_type
     *
     * @param cdType the value for j_crowdfunding.cd_type
     *
     * @mbggenerated
     */
    public void setCdType(Integer cdType) {
        this.cdType = cdType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_name
     *
     * @return the value of j_crowdfunding.cd_name
     *
     * @mbggenerated
     */
    public String getCdName() {
        return cdName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_name
     *
     * @param cdName the value for j_crowdfunding.cd_name
     *
     * @mbggenerated
     */
    public void setCdName(String cdName) {
        this.cdName = cdName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_championprize
     *
     * @return the value of j_crowdfunding.cd_championprize
     *
     * @mbggenerated
     */
    public String getCdChampionprize() {
        return cdChampionprize;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_championprize
     *
     * @param cdChampionprize the value for j_crowdfunding.cd_championprize
     *
     * @mbggenerated
     */
    public void setCdChampionprize(String cdChampionprize) {
        this.cdChampionprize = cdChampionprize;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_secondprize
     *
     * @return the value of j_crowdfunding.cd_secondprize
     *
     * @mbggenerated
     */
    public String getCdSecondprize() {
        return cdSecondprize;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_secondprize
     *
     * @param cdSecondprize the value for j_crowdfunding.cd_secondprize
     *
     * @mbggenerated
     */
    public void setCdSecondprize(String cdSecondprize) {
        this.cdSecondprize = cdSecondprize;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_thirdprize
     *
     * @return the value of j_crowdfunding.cd_thirdprize
     *
     * @mbggenerated
     */
    public String getCdThirdprize() {
        return cdThirdprize;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_thirdprize
     *
     * @param cdThirdprize the value for j_crowdfunding.cd_thirdprize
     *
     * @mbggenerated
     */
    public void setCdThirdprize(String cdThirdprize) {
        this.cdThirdprize = cdThirdprize;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_sponsor_id
     *
     * @return the value of j_crowdfunding.cd_sponsor_id
     *
     * @mbggenerated
     */
    public Integer getCdSponsorId() {
        return cdSponsorId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_sponsor_id
     *
     * @param cdSponsorId the value for j_crowdfunding.cd_sponsor_id
     *
     * @mbggenerated
     */
    public void setCdSponsorId(Integer cdSponsorId) {
        this.cdSponsorId = cdSponsorId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_dotime
     *
     * @return the value of j_crowdfunding.cd_dotime
     *
     * @mbggenerated
     */
    public Date getCdDotime() {
        return cdDotime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_dotime
     *
     * @param cdDotime the value for j_crowdfunding.cd_dotime
     *
     * @mbggenerated
     */
    public void setCdDotime(Date cdDotime) {
        this.cdDotime = cdDotime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_starttime
     *
     * @return the value of j_crowdfunding.cd_starttime
     *
     * @mbggenerated
     */
    public Date getCdStarttime() {
        return cdStarttime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_starttime
     *
     * @param cdStarttime the value for j_crowdfunding.cd_starttime
     *
     * @mbggenerated
     */
    public void setCdStarttime(Date cdStarttime) {
        this.cdStarttime = cdStarttime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_endtime
     *
     * @return the value of j_crowdfunding.cd_endtime
     *
     * @mbggenerated
     */
    public Date getCdEndtime() {
        return cdEndtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_endtime
     *
     * @param cdEndtime the value for j_crowdfunding.cd_endtime
     *
     * @mbggenerated
     */
    public void setCdEndtime(Date cdEndtime) {
        this.cdEndtime = cdEndtime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_champion_id
     *
     * @return the value of j_crowdfunding.cd_champion_id
     *
     * @mbggenerated
     */
    public Integer getCdChampionId() {
        return cdChampionId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_champion_id
     *
     * @param cdChampionId the value for j_crowdfunding.cd_champion_id
     *
     * @mbggenerated
     */
    public void setCdChampionId(Integer cdChampionId) {
        this.cdChampionId = cdChampionId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_second_id
     *
     * @return the value of j_crowdfunding.cd_second_id
     *
     * @mbggenerated
     */
    public Integer getCdSecondId() {
        return cdSecondId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_second_id
     *
     * @param cdSecondId the value for j_crowdfunding.cd_second_id
     *
     * @mbggenerated
     */
    public void setCdSecondId(Integer cdSecondId) {
        this.cdSecondId = cdSecondId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_third_id
     *
     * @return the value of j_crowdfunding.cd_third_id
     *
     * @mbggenerated
     */
    public Integer getCdThirdId() {
        return cdThirdId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_third_id
     *
     * @param cdThirdId the value for j_crowdfunding.cd_third_id
     *
     * @mbggenerated
     */
    public void setCdThirdId(Integer cdThirdId) {
        this.cdThirdId = cdThirdId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_state
     *
     * @return the value of j_crowdfunding.cd_state
     *
     * @mbggenerated
     */
    public Integer getCdState() {
        return cdState;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_state
     *
     * @param cdState the value for j_crowdfunding.cd_state
     *
     * @mbggenerated
     */
    public void setCdState(Integer cdState) {
        this.cdState = cdState;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_redonum
     *
     * @return the value of j_crowdfunding.cd_redonum
     *
     * @mbggenerated
     */
    public Integer getCdRedonum() {
        return cdRedonum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_redonum
     *
     * @param cdRedonum the value for j_crowdfunding.cd_redonum
     *
     * @mbggenerated
     */
    public void setCdRedonum(Integer cdRedonum) {
        this.cdRedonum = cdRedonum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_discuss
     *
     * @return the value of j_crowdfunding.cd_discuss
     *
     * @mbggenerated
     */
    public Integer getCdDiscuss() {
        return cdDiscuss;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_discuss
     *
     * @param cdDiscuss the value for j_crowdfunding.cd_discuss
     *
     * @mbggenerated
     */
    public void setCdDiscuss(Integer cdDiscuss) {
        this.cdDiscuss = cdDiscuss;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_description
     *
     * @return the value of j_crowdfunding.cd_description
     *
     * @mbggenerated
     */
    public String getCdDescription() {
        return cdDescription;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_description
     *
     * @param cdDescription the value for j_crowdfunding.cd_description
     *
     * @mbggenerated
     */
    public void setCdDescription(String cdDescription) {
        this.cdDescription = cdDescription;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_content
     *
     * @return the value of j_crowdfunding.cd_content
     *
     * @mbggenerated
     */
    public String getCdContent() {
        return cdContent;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_content
     *
     * @param cdContent the value for j_crowdfunding.cd_content
     *
     * @mbggenerated
     */
    public void setCdContent(String cdContent) {
        this.cdContent = cdContent;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_crowdfunding.cd_enddescr
     *
     * @return the value of j_crowdfunding.cd_enddescr
     *
     * @mbggenerated
     */
    public String getCdEnddescr() {
        return cdEnddescr;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_crowdfunding.cd_enddescr
     *
     * @param cdEnddescr the value for j_crowdfunding.cd_enddescr
     *
     * @mbggenerated
     */
    public void setCdEnddescr(String cdEnddescr) {
        this.cdEnddescr = cdEnddescr;
    }
}