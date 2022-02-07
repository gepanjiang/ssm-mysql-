//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
package com.daowen.controller;

import java.util.List;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import com.daowen.entity.*;
import com.daowen.service.*;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 社团控制
 *
 */
@Controller
public class ShetuanController extends SimpleController {
	@Autowired
	private ShetuanService shetuanSrv = null;
	@Autowired
	private SttypeService sttypeSrv = null;

	@Override
	@RequestMapping("/admin/shetuanmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		String[] ids = request.getParameterValues("ids");
		if (ids == null)
			return;
		String spliter = ",";
		String SQL = " where id in(" + join(spliter, ids) + ")";
		System.out.println("sql=" + SQL);
		shetuanSrv.delete(SQL);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String stname = request.getParameter("stname");
		String cjdate = request.getParameter("cjdate");
		String count = request.getParameter("count");
		String shezhang = request.getParameter("shezhang");
		String tupian = request.getParameter("tupian");
		String des = request.getParameter("des");
		String typename = request.getParameter("typename");
		SimpleDateFormat sdfshetuan = new SimpleDateFormat("yyyy-MM-dd");
		Shetuan shetuan = new Shetuan();
		shetuan.setStname(stname == null ? "" : stname);
		if (cjdate != null) {
			try {
				shetuan.setCjdate(sdfshetuan.parse(cjdate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			shetuan.setCjdate(new Date());
		}
		shetuan.setCount(count == null ? 0 : new Integer(count));
		shetuan.setShezhang(shezhang == null ? "" : shezhang);
		shetuan.setTupian(tupian == null ? "" : tupian);
		shetuan.setDes(des == null ? "" : des);
		shetuan.setTypename(typename == null ? "" : typename);
		// 产生验证
		Boolean validateresult =shetuanSrv.isExist("where stname='" + stname + "'");
		if (validateresult) {
			
				request.setAttribute("errormsg",
						"<label class='error'>已存在的社团名</label>");
				request.setAttribute("shetuan", shetuan);
				request.setAttribute("actiontype", "save");
				forward(errorurl);
			return;
		}
		shetuanSrv.save(shetuan);
		if (forwardurl == null) {
			forwardurl = "/admin/shetuanmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Shetuan shetuan = shetuanSrv.load(new Integer(id));
		if (shetuan == null)
			return;
		String stname = request.getParameter("stname");
		String cjdate = request.getParameter("cjdate");
		String count = request.getParameter("count");
		String shezhang = request.getParameter("shezhang");
		String tupian = request.getParameter("tupian");
		String des = request.getParameter("des");
		String typename = request.getParameter("typename");
		SimpleDateFormat sdfshetuan = new SimpleDateFormat("yyyy-MM-dd");
		shetuan.setStname(stname);
		if (cjdate != null) {
			try {
				shetuan.setCjdate(sdfshetuan.parse(cjdate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		shetuan.setCount(count == null ? 0 : new Integer(count));
		shetuan.setShezhang(shezhang);
		shetuan.setTupian(tupian);
		shetuan.setDes(des);
		shetuan.setTypename(typename);
		shetuanSrv.update(shetuan);
		if (forwardurl == null) {
			forwardurl = "/admin/shetuanmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String actiontype = "save";
		dispatchParams(request, response);
		if (id != null) {
			Shetuan shetuan = shetuanSrv.load("where id=" + id);
			if (shetuan != null) {
				request.setAttribute("shetuan", shetuan);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> typename_datasource = sttypeSrv.getEntity("");
		request.setAttribute("typename_datasource", typename_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/shetuanadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String stname = request.getParameter("stname");
		if (stname != null)
			filter += "  and stname like '%" + stname + "%'  ";
		//
		int pageindex = 1;
		int pagesize = 10;
		// 获取当前分页
		String currentpageindex = request.getParameter("currentpageindex");
		// 当前页面尺寸
		String currentpagesize = request.getParameter("pagesize");
		// 设置当前页
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// 设置当前页尺寸
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Shetuan> listshetuan = shetuanSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = shetuanSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listshetuan", listshetuan);
		PagerMetal pm = new PagerMetal(recordscount);
		// 设置尺寸
		pm.setPagesize(pagesize);
		// 设置当前显示页
		pm.setCurpageindex(pageindex);
		// 设置分页信息
		request.setAttribute("pagermetal", pm);
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/shetuanmanager.jsp";
		}
		forward(forwardurl);
	}
}
//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
