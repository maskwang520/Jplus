package com.jplus.model;

import java.io.Serializable;

/**
 * 此类由MySQLToModel工具自动生成 
 * 备注(数据表的comment字段)：无备注信息
 * 
 * @author Chitry
 * @title 网站导航实体
 * @since 2015-07-22 19:52:51
 */
public class NavUrl implements Serializable{

	

	private Integer id;

    private String nName;

    private String nTitle;

    private String nUrl;
    
    private String npic;

    private String nDescriptions;

    
    public String getNpic() {
		return npic;
	}

	public void setNpic(String npic) {
		this.npic = npic;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getnName() {
        return nName;
    }

    public void setnName(String nName) {
        this.nName = nName;
    }

    public String getnTitle() {
        return nTitle;
    }

    public void setnTitle(String nTitle) {
        this.nTitle = nTitle;
    }

    public String getnUrl() {
        return nUrl;
    }

    public void setnUrl(String nUrl) {
        this.nUrl = nUrl;
    }

    public String getnDescriptions() {
        return nDescriptions;
    }

    public void setnDescriptions(String nDescriptions) {
        this.nDescriptions = nDescriptions;
    }
    @Override
	public String toString() {
		return "NavUrl [id=" + id + ", nName=" + nName + ", nTitle=" + nTitle
				+ ", nUrl=" + nUrl + ", nDescriptions=" + nDescriptions + "]";
	}
}