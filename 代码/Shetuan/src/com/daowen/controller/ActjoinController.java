//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
package com.daowen.controller;

import java.text.MessageFormat;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Actjoin;
import com.daowen.service.ActjoinService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 报名控制
 *
 */
@Controller
public class ActjoinController extends SimpleController {
	@Autowired
	private ActjoinService actjoinSrv = null;

	@Override
	@RequestMapping("/admin/actjoinmanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		//完整源码，请联系QQ-1305637939
	}

	public void save() {
		//完整源码，请联系QQ-1305637939
	}

	
	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String forwardurl = request.getParameter("forwardurl");
		String id = request.getParameter("id");
		if (id == null)
			return;
		Actjoin actjoin = actjoinSrv.load(new Integer(id));
		if (actjoin == null)
			return;
		String actid = request.getParameter("actid");
		String actname = request.getParameter("actname");
		String hyaccountname = request.getParameter("hyaccountname");
		SimpleDateFormat sdfactjoin = new SimpleDateFormat("yyyy-MM-dd");
		actjoin.setActid(actid == null ? 0 : new Integer(actid));
		actjoin.setActname(actname);
		actjoin.setHyaccountname(hyaccountname);
		actjoinSrv.update(actjoin);
		if (forwardurl == null) {
			forwardurl = "/admin/actjoinmanager.do?actiontype=get";
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
			Actjoin actjoin = actjoinSrv.load("where id="
					+ id);
			if (actjoin != null) {
				request.setAttribute("actjoin", actjoin);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/actjoinadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String actid = request.getParameter("actid");
		if (actid != null)
			filter += "  and actid like '%" + actid + "%'  ";
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
		List<Actjoin> listactjoin = actjoinSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = actjoinSrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listactjoin", listactjoin);
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
			forwardurl = "/admin/actjoinmanager.jsp";
		}
		forward(forwardurl);
	}
}
//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
