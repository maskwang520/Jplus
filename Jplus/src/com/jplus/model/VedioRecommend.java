package com.jplus.model;

import java.io.Serializable;


/**
 * 此类由MySQLToModel工具自动生成 
 * 备注(数据表的comment字段)：无备注信息
 * 
 * @author Chitry
 * @title 专辑推荐信息实体
 * @since 2015-07-22 19:52:51
 */
public class VedioRecommend implements Serializable{
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_vediorecommend.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_vediorecommend.vr_name
     *
     * @mbggenerated
     */
    private String vrName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_vediorecommend.vr_title
     *
     * @mbggenerated
     */
    private String vrTitle;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_vediorecommend.vr_url
     *
     * @mbggenerated
     */
    private String vrUrl;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_vediorecommend.vr_purl
     *
     * @mbggenerated
     */
    private String vrPurl;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_vediorecommend.vr_descriptions
     *
     * @mbggenerated
     */
    private String vrDescriptions;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_vediorecommend.id
     *
     * @return the value of j_vediorecommend.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_vediorecommend.id
     *
     * @param id the value for j_vediorecommend.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_vediorecommend.vr_name
     *
     * @return the value of j_vediorecommend.vr_name
     *
     * @mbggenerated
     */
    public String getVrName() {
        return vrName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_vediorecommend.vr_name
     *
     * @param vrName the value for j_vediorecommend.vr_name
     *
     * @mbggenerated
     */
    public void setVrName(String vrName) {
        this.vrName = vrName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_vediorecommend.vr_title
     *
     * @return the value of j_vediorecommend.vr_title
     *
     * @mbggenerated
     */
    public String getVrTitle() {
        return vrTitle;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_vediorecommend.vr_title
     *
     * @param vrTitle the value for j_vediorecommend.vr_title
     *
     * @mbggenerated
     */
    public void setVrTitle(String vrTitle) {
        this.vrTitle = vrTitle;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_vediorecommend.vr_url
     *
     * @return the value of j_vediorecommend.vr_url
     *
     * @mbggenerated
     */
    public String getVrUrl() {
        return vrUrl;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_vediorecommend.vr_url
     *
     * @param vrUrl the value for j_vediorecommend.vr_url
     *
     * @mbggenerated
     */
    public void setVrUrl(String vrUrl) {
        this.vrUrl = vrUrl;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_vediorecommend.vr_purl
     *
     * @return the value of j_vediorecommend.vr_purl
     *
     * @mbggenerated
     */
    public String getVrPurl() {
        return vrPurl;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_vediorecommend.vr_purl
     *
     * @param vrPurl the value for j_vediorecommend.vr_purl
     *
     * @mbggenerated
     */
    public void setVrPurl(String vrPurl) {
        this.vrPurl = vrPurl;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_vediorecommend.vr_descriptions
     *
     * @return the value of j_vediorecommend.vr_descriptions
     *
     * @mbggenerated
     */
    public String getVrDescriptions() {
        return vrDescriptions;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_vediorecommend.vr_descriptions
     *
     * @param vrDescriptions the value for j_vediorecommend.vr_descriptions
     *
     * @mbggenerated
     */
    public void setVrDescriptions(String vrDescriptions) {
        this.vrDescriptions = vrDescriptions;
    }
}