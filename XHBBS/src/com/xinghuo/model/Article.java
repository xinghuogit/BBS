/*************************************************************************************************
 * @版权所有 (C)2015,  星火工作室
 * 
 * @文件名称：Article.java
 * @内容摘要：升级服务
 * @当前版本： TODO
 * @作        者： 李加蒙
 * @完成日期：2015年8月31日 下午5:40:35
 * @修改记录：
 * @修改日期：2015年8月31日 下午5:40:35
 * @版   本  号：
 * @修   改  人：
 * @修改内容：
 ************************************************************************************************/

package com.xinghuo.model;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

/**
 * @文件名称：Article.java 文章的bean类
 */
public class Article implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	private String pid;
	private String rootid;
	private String title;
	private String cont;
	private Date pdate;
	private boolean isleaf;
	private int grade;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getRootid() {
		return rootid;
	}

	public void setRootid(String rootid) {
		this.rootid = rootid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCont() {
		return cont;
	}

	public void setCont(String cont) {
		this.cont = cont;
	}

	public Date getPdate() {
		return pdate;
	}

	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}

	public boolean isIsleaf() {
		return isleaf;
	}

	public void setIsleaf(boolean isleaf) {
		this.isleaf = isleaf;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public void parseData(ResultSet resultSet) {
		try {
			if (resultSet != null) {
				setId(resultSet.getString("id"));
				setPid(resultSet.getString("pid"));
				setRootid(resultSet.getString("rootid"));
				setTitle(resultSet.getString("title"));
				setIsleaf(resultSet.getString("isleaf").equals("0") ? true
						: false);
				setPdate(resultSet.getTimestamp("pdate"));
				setCont(resultSet.getString("cont"));
				setGrade(0);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
