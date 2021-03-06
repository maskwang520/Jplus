package com.jplus.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 此类由MySQLToModel工具自动生成 
 * 备注(数据表的comment字段)：无备注信息
 * 
 * @author Chitry
 * @title 访问量实体
 * @since 2015-07-22 19:52:51
 */
public class AccessSum implements Serializable{

    private Integer id;

    private String asName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_accesssum.as_sum
     *
     * @mbggenerated
     */
    private Integer asSum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_accesssum.as_max
     *
     * @mbggenerated
     */
    private Integer asMax;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_accesssum.as_maxdate
     *
     * @mbggenerated
     */
    private Date asMaxdate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_accesssum.as_description
     *
     * @mbggenerated
     */
    private String asDescription;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_accesssum.id
     *
     * @return the value of j_accesssum.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_accesssum.id
     *
     * @param id the value for j_accesssum.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_accesssum.as_name
     *
     * @return the value of j_accesssum.as_name
     *
     * @mbggenerated
     */
    public String getAsName() {
        return asName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_accesssum.as_name
     *
     * @param asName the value for j_accesssum.as_name
     *
     * @mbggenerated
     */
    public void setAsName(String asName) {
        this.asName = asName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_accesssum.as_sum
     *
     * @return the value of j_accesssum.as_sum
     *
     * @mbggenerated
     */
    public Integer getAsSum() {
        return asSum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_accesssum.as_sum
     *
     * @param asSum the value for j_accesssum.as_sum
     *
     * @mbggenerated
     */
    public void setAsSum(Integer asSum) {
        this.asSum = asSum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_accesssum.as_max
     *
     * @return the value of j_accesssum.as_max
     *
     * @mbggenerated
     */
    public Integer getAsMax() {
        return asMax;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_accesssum.as_max
     *
     * @param asMax the value for j_accesssum.as_max
     *
     * @mbggenerated
     */
    public void setAsMax(Integer asMax) {
        this.asMax = asMax;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_accesssum.as_maxdate
     *
     * @return the value of j_accesssum.as_maxdate
     *
     * @mbggenerated
     */
    public Date getAsMaxdate() {
        return asMaxdate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_accesssum.as_maxdate
     *
     * @param asMaxdate the value for j_accesssum.as_maxdate
     *
     * @mbggenerated
     */
    public void setAsMaxdate(Date asMaxdate) {
        this.asMaxdate = asMaxdate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_accesssum.as_description
     *
     * @return the value of j_accesssum.as_description
     *
     * @mbggenerated
     */
    public String getAsDescription() {
        return asDescription;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_accesssum.as_description
     *
     * @param asDescription the value for j_accesssum.as_description
     *
     * @mbggenerated
     */
    public void setAsDescription(String asDescription) {
        this.asDescription = asDescription;
    }
}