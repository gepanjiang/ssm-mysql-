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

import com.daowen.entity.Activity;
import com.daowen.service.ActivityService;
import com.daowen.service.ActtypeService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

/**************************
 * 
 * 活动控制
 *
 */
@Controller
public class ActivityController extends SimpleController {
	@Autowired
	private ActivityService activitySrv = null;
	@Autowired
	private ActtypeService acttypeSrv = null;

	@Override
	@RequestMapping("/admin/activitymanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request, response);
	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		//完整源码，请联系QQ-1305637939
	}
	public void shenpi() {
		//完整源码，请联系QQ-1305637939
	}

	
	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		String forwardurl = request.getParameter("forwardurl");
		// 验证错误url
		String errorurl = request.getParameter("errorurl");
		String title = request.getParameter("title");
		String hdbegindate = request.getParameter("hdbegindate");
		String hdenddate = request.getParameter("hdenddate");
		String fqren = request.getParameter("fqren");
		String state = request.getParameter("state");
		String dcontent = request.getParameter("dcontent");
		String fqname = request.getParameter("fqname");
		String createtime = request.getParameter("createtime");
		String tupian = request.getParameter("tupian");
		String typename = request.getParameter("typename");
		String typeid = request.getParameter("typeid");
		SimpleDateFormat sdfactivity = new SimpleDateFormat("yyyy-MM-dd");
		String maxcount=request.getParameter("maxcount");
		Activity activity = new Activity();
		activity.setTitle(title == null ? "" : title);
		if (hdbegindate != null) {
			try {
				activity.setHdbegindate(sdfactivity.parse(hdbegindate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			activity.setHdbegindate(new Date());
		}
		if (hdenddate != null) {
			try {
				activity.setHdenddate(sdfactivity.parse(hdenddate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			activity.setHdenddate(new Date());
		}
		activity.setFqren(fqren == null ? "" : fqren);
		// 活动等待审批
		if(state==null)
		  activity.setState(1);
		else 
			activity.setState(Integer.parseInt(state));
		activity.setDcontent(dcontent == null ? "" : dcontent);
		activity.setFqname(fqname == null ? "" : fqname);
		if (createtime != null) {
			try {
				activity.setCreatetime(sdfactivity.parse(createtime));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		} else {
			activity.setCreatetime(new Date());
		}
		activity.setMaxcount(maxcount==null?0:Integer.parseInt(maxcount));
		activity.setTupian(tupian == null ? "" : tupian);
		activity.setTypename(typename == null ? "" : typename);
		activity.setTypeid(typeid==null?0:Integer.parseInt(typeid));
		activitySrv.save(activity);

		if (forwardurl == null) {
			forwardurl = "/admin/activitymanager.do?actiontype=get";
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
		Activity activity = activitySrv.load(new Integer(id));
		if (activity == null)
			return;
		String title = request.getParameter("title");
		String hdbegindate = request.getParameter("hdbegindate");
		String hdenddate = request.getParameter("hdenddate");
		String maxcount = request.getParameter("maxcount");
		String dcontent = request.getParameter("dcontent");
		String tupian = request.getParameter("tupian");
		String typeid = request.getParameter("typeid");
		String typename = request.getParameter("typename");
		SimpleDateFormat sdfactivity = new SimpleDateFormat("yyyy-MM-dd");
		activity.setTitle(title);
		if (hdbegindate != null) {
			try {
				activity.setHdbegindate(sdfactivity.parse(hdbegindate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if (hdenddate != null) {
			try {
				activity.setHdenddate(sdfactivity.parse(hdenddate));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		activity.setMaxcount(maxcount==null?0:Integer.parseInt(maxcount));
		activity.setDcontent(dcontent);
		activity.setTupian(tupian);
		activity.setTypename(typename);
		activity.setTypeid(typeid==null?0:Integer.parseInt(typeid));
		activitySrv.update(activity);

		if (forwardurl == null) {
			forwardurl = "/admin/activitymanager.do?actiontype=get";
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
			Activity activity =activitySrv.load("where id="+ id);
			if (activity != null) {
				request.setAttribute("activity", activity);
			}
			actiontype = "update";
			request.setAttribute("id", id);
		}
		request.setAttribute("actiontype", actiontype);
		List<Object> typename_datasource = acttypeSrv.getEntity("");
		request.setAttribute("typename_datasource", typename_datasource);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/admin/activityadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "where 1=1 ";
		String title = request.getParameter("title");
		String fqren = request.getParameter("fqren");
		if (title != null)
			filter += "  and title like '%" + title + "%'  ";
		if (fqren != null)
			filter += " and fqren='" + fqren + "'";
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
		List<Activity> listactivity = activitySrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = activitySrv.getRecordCount(filter == null ? "" : filter);
		request.setAttribute("listactivity", listactivity);
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
			forwardurl = "/admin/activitymanager.jsp";
		}
		forward(forwardurl);
	}
	
	public void joined() {
		
		String hyaccountname = request.getParameter("hyaccountname");
		
		List<Activity> listactivity = activitySrv.query(MessageFormat.format("select a.* from activity a ,actjoin aj where aj.actid=a.id and aj.hyaccountname=''{0}'' ",hyaccountname));
		request.setAttribute("listactivity", listactivity);
		
		// 分发请求参数
		dispatchParams(request, response);
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/e/huiyuan/joinactlist.jsp";
		}
		forward(forwardurl);
	}
}
//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
