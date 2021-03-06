package com.jplus.model;

import java.io.Serializable;

/**
 * 此类由MySQLToModel工具自动生成 
 * 备注(数据表的comment字段)：无备注信息
 * 
 * @author Chitry
 * @title 积分等级信息实体
 * @since 2015-07-22 19:52:51
 */
public class UserLevel implements Serializable{
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_userlevel.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_userlevel.levels
     *
     * @mbggenerated
     */
    private Integer levels;
    
    private String levelpurl;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_userlevel.minscores
     *
     * @mbggenerated
     */
    private Integer minscores;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_userlevel.maxscores
     *
     * @mbggenerated
     */
    private Integer maxscores;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column j_userlevel.descriptions
     *
     * @mbggenerated
     */
    private String descriptions;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_userlevel.id
     *
     * @return the value of j_userlevel.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_userlevel.id
     *
     * @param id the value for j_userlevel.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_userlevel.levels
     *
     * @return the value of j_userlevel.levels
     *
     * @mbggenerated
     */
    public Integer getLevels() {
        return levels;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_userlevel.levels
     *
     * @param levels the value for j_userlevel.levels
     *
     * @mbggenerated
     */
    public void setLevels(Integer levels) {
        this.levels = levels;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_userlevel.minscores
     *
     * @return the value of j_userlevel.minscores
     *
     * @mbggenerated
     */
    public Integer getMinscores() {
        return minscores;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_userlevel.minscores
     *
     * @param minscores the value for j_userlevel.minscores
     *
     * @mbggenerated
     */
    public void setMinscores(Integer minscores) {
        this.minscores = minscores;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_userlevel.maxscores
     *
     * @return the value of j_userlevel.maxscores
     *
     * @mbggenerated
     */
    public Integer getMaxscores() {
        return maxscores;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_userlevel.maxscores
     *
     * @param maxscores the value for j_userlevel.maxscores
     *
     * @mbggenerated
     */
    public void setMaxscores(Integer maxscores) {
        this.maxscores = maxscores;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column j_userlevel.descriptions
     *
     * @return the value of j_userlevel.descriptions
     *
     * @mbggenerated
     */
    public String getDescriptions() {
        return descriptions;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column j_userlevel.descriptions
     *
     * @param descriptions the value for j_userlevel.descriptions
     *
     * @mbggenerated
     */
    public void setDescriptions(String descriptions) {
        this.descriptions = descriptions;
    }

	public String getLevelpurl() {
		return levelpurl;
	}

	public void setLevelpurl(String levelpurl) {
		this.levelpurl = levelpurl;
	}
    
    
}