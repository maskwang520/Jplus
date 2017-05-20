package com.jplus.model;

import java.io.Serializable;

/**
 * 此类由MySQLToModel工具自动生成 
 * 备注(数据表的comment字段)：无备注信息
 * 
 * @author Chitry
 * @title 友情链接实体
 * @since 2015-07-22 19:52:51
 */
public class FriendLink implements Serializable{
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_friendlink.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_friendlink.fl_name
     *
     * @mbggenerated
     */
    private String flName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_friendlink.fl_url
     *
     * @mbggenerated
     */
    private String flUrl;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_friendlink.fl_descriptions
     *
     * @mbggenerated
     */
    private String flDescriptions;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_friendlink.id
     *
     * @return the value of j_friendlink.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_friendlink.id
     *
     * @param id the value for j_friendlink.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_friendlink.fl_name
     *
     * @return the value of j_friendlink.fl_name
     *
     * @mbggenerated
     */
    public String getFlName() {
        return flName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_friendlink.fl_name
     *
     * @param flName the value for j_friendlink.fl_name
     *
     * @mbggenerated
     */
    public void setFlName(String flName) {
        this.flName = flName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_friendlink.fl_url
     *
     * @return the value of j_friendlink.fl_url
     *
     * @mbggenerated
     */
    public String getFlUrl() {
        return flUrl;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_friendlink.fl_url
     *
     * @param flUrl the value for j_friendlink.fl_url
     *
     * @mbggenerated
     */
    public void setFlUrl(String flUrl) {
        this.flUrl = flUrl;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_friendlink.fl_descriptions
     *
     * @return the value of j_friendlink.fl_descriptions
     *
     * @mbggenerated
     */
    public String getFlDescriptions() {
        return flDescriptions;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_friendlink.fl_descriptions
     *
     * @param flDescriptions the value for j_friendlink.fl_descriptions
     *
     * @mbggenerated
     */
    public void setFlDescriptions(String flDescriptions) {
        this.flDescriptions = flDescriptions;
    }
}