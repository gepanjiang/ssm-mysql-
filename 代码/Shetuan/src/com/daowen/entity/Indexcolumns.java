//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
package com.daowen.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Indexcolumns {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	private String coldes;

	public String getColdes() {
		return coldes;
	}

	public void setColdes(String coldes) {
		this.coldes = coldes;
	}

	private int colid;

	public int getColid() {
		return colid;
	}

	public void setColid(int colid) {
		this.colid = colid;
	}

	private String xtype;

	public String getXtype() {
		return xtype;
	}

	public void setXtype(String xtype) {
		this.xtype = xtype;
	}

	private String showstyle;

	public String getShowstyle() {
		return showstyle;
	}

	public void setShowstyle(String showstyle) {
		this.showstyle = showstyle;
	}

	private String layout;

	public String getLayout() {
		return layout;
	}

	public void setLayout(String layout) {
		this.layout = layout;
	}

	private String width;

	public String getWidth() {
		return width;
	}

	public void setWidth(String width) {
		this.width = width;
	}

}
//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
