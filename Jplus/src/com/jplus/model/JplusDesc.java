package com.jplus.model;

import java.io.Serializable;
import java.util.Date;

/**
 * 此类由MySQLToModel工具自动生成 
 * 备注(数据表的comment字段)：无备注信息
 * 
 * @author Chitry
 * @title Jplus简介信息实体
 * @since 2015-07-22 19:52:51
 */
public class JplusDesc implements Serializable{
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_jplusdesc.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_jplusdesc.jd_title
     *
     * @mbggenerated
     */
    private String jdTitle;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_jplusdesc.jd_reltime
     *
     * @mbggenerated
     */
    private Date jdReltime;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_jplusdesc.jd_author
     *
     * @mbggenerated
     */
    private String jdAuthor;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_jplusdesc.jd_content
     *
     * @mbggenerated
     */
    private String jdContent;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_jplusdesc.id
     *
     * @return the value of j_jplusdesc.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_jplusdesc.id
     *
     * @param id the value for j_jplusdesc.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_jplusdesc.jd_title
     *
     * @return the value of j_jplusdesc.jd_title
     *
     * @mbggenerated
     */
    public String getJdTitle() {
        return jdTitle;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_jplusdesc.jd_title
     *
     * @param jdTitle the value for j_jplusdesc.jd_title
     *
     * @mbggenerated
     */
    public void setJdTitle(String jdTitle) {
        this.jdTitle = jdTitle;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_jplusdesc.jd_reltime
     *
     * @return the value of j_jplusdesc.jd_reltime
     *
     * @mbggenerated
     */
    public Date getJdReltime() {
        return jdReltime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_jplusdesc.jd_reltime
     *
     * @param jdReltime the value for j_jplusdesc.jd_reltime
     *
     * @mbggenerated
     */
    public void setJdReltime(Date jdReltime) {
        this.jdReltime = jdReltime;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_jplusdesc.jd_author
     *
     * @return the value of j_jplusdesc.jd_author
     *
     * @mbggenerated
     */
    public String getJdAuthor() {
        return jdAuthor;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_jplusdesc.jd_author
     *
     * @param jdAuthor the value for j_jplusdesc.jd_author
     *
     * @mbggenerated
     */
    public void setJdAuthor(String jdAuthor) {
        this.jdAuthor = jdAuthor;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_jplusdesc.jd_content
     *
     * @return the value of j_jplusdesc.jd_content
     *
     * @mbggenerated
     */
    public String getJdContent() {
        return jdContent;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_jplusdesc.jd_content
     *
     * @param jdContent the value for j_jplusdesc.jd_content
     *
     * @mbggenerated
     */
    public void setJdContent(String jdContent) {
        this.jdContent = jdContent;
    }
}