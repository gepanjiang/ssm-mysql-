//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
package com.daowen.controller;

import java.text.MessageFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Stchengyuan;
import com.daowen.service.StchengyuanService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 社团成员控制
 *
 */
@Controller
public class StchengyuanController extends SimpleController {
	@Autowired
	private StchengyuanService stchengyuanSrv = null;

	@Override
	@RequestMapping("/admin/stchengyuanmanager.do")
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
		stchengyuanSrv.delete(SQL);
	}

	public void shenpi() {
		String id = request.getParameter("id");
		String forwardurl = request.getParameter("forwardurl");
		String status = request.getParameter("state");
		String reply = request.getParameter("reply");
		String shenpiren = request.getParameter("shenpiren");
		int statuscode = 3;
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		if (id == null)
			return;
		Stchengyuan stchengyuan = stchengyuanSrv.load(" where id=" + id);
		if (stchengyuan == null)
			return;
		if (status != null)
			statuscode = Integer.parseInt(status);
		stchengyuan.setState(statuscode);
		stchengyuanSrv.update(stchengyuan);
		if (forwardurl == null) {
			forwardurl = "/admin/stchengyuanmanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String stid = request.getParameter("stid");
		String hyaccount = request.getParameter("hyaccount");
		String name = request.getParameter("name");
		String sex = request.getParameter("sex");
		String major = request.getParameter("major");
		String mobile = request.getParameter("mobile");
		String photo = request.getParameter("photo");
		String jiguan = request.getParameter("jiguan");
		String rxdate = request.getParameter("rxdate");
		String state = request.getParameter("state");
		String des = request.getParameter("des");
		SimpleDateFormat sdfstchengyuan = new SimpleDateFormat("yyyy-MM-dd");
		Stchengyuan stchengyuan = new Stchengyuan();
		stchengyuan.setStid(stid == null ? 0 : new Integer(stid));
		stchengyuan.setHyaccount(hyaccount == null ? "" : hyaccount);
		stchengyuan.setName(name == null ? "" : name);
		stchengyuan.setSex(sex == null ? "" : sex);
		stchengyuan.setMajor(major == null ? "" : major);
		stchengyuan.setMobile(mobile == null ? "" : mobile);
		stchengyuan.setPhoto(photo == null ? "" : photo);
		stchengyuan.setJiguan(jiguan == null ? "" : jiguan);
		if (rxdate != null) {
			try {
				stchengyuan.setRxdate(sdfstchengyuan.parse(rxdate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			stchengyuan.setRxdate(new Date());
		}
		stchengyuan.setState(1);
		stchengyuan.setDes(des == null ? "" : des);
		String filter=MessageFormat.format(" where stid={0} and hyaccount=''{1}'' ", stid,hyaccount);
		// 产生验证
		Boolean validateresult = stchengyuanSrv.isExist(filter);
		if (validateresult) {

			request.setAttribute("errormsg",
					"<label class='error'>你已经报名了该社团</label>");
			request.setAttribute("stchengyuan", stchengyuan);
			request.setAttribute("actiontype", "save");
			forward(errorurl);

			return;
		}
		stchengyuanSrv.save(stchengyuan);
		if (forwardurl == null) {
			forwardurl = "/admin/stchengyuanmanager.do?actiontype=get";
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
			Stchengyuan stchengyuan = stchengyuanSrv.load("where id=" + id);
			if (stchengyuan != null) {
				request.setAttribute("stchengyuan", stchengyuan);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/stchengyuanadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String stid = request.getParameter("stid");
		String name=request.getParameter("name");
		if (stid != null)
			filter += "  and stid like '%" + stid + "%'  ";
		//
		if(name!=null)
			filter+=" and name like '%"+name+"%'";
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
		List<Stchengyuan> liststchengyuan = stchengyuanSrv.getPageEntitys(
				filter, pageindex, pagesize);
		int recordscount = stchengyuanSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("liststchengyuan", liststchengyuan);
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
			forwardurl = "/admin/stchengyuanmanager.jsp";
		}
		forward(forwardurl);
	}
}
//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
