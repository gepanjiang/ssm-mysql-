//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
package com.daowen.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Lanmu;
import com.daowen.service.LanmuService;
import com.daowen.service.LanmuTree;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.util.BeansUtil;

@Controller
public class LanmuController extends SimpleController {

	@Autowired
	private LanmuService lanmuSrv=null;
	@Autowired
	private LanmuTree   lanmuTree=null;
	@Override
	@RequestMapping("/admin/lanmumanager.do")
	public void mapping(HttpServletRequest request, HttpServletResponse response) {
		mappingMethod(request,response);

	}

	/********************************************************
	 ****************** 信息注销监听支持*****************************
	 *********************************************************/
	public void delete() {
		//完整源码，请联系QQ-1305637939
	}

	/*************************************************************
	 **************** 保存动作监听支持******************************
	 **************************************************************/
	public void save() {
		//完整源码，请联系QQ-1305637939
		
	}

	
	/******************************************************
	 *********************** 更新内部支持*********************
	 *******************************************************/
	public void update() {
		String id = request.getParameter("id");
		if (id == null)
			return;
		Lanmu lanmu = (Lanmu) lanmuSrv.load(new Integer(id));
		if (lanmu == null)
			return;
		String title = request.getParameter("title");
		String creator = request.getParameter("creator");
		String des = request.getParameter("des");
		SimpleDateFormat sdflanmu = new SimpleDateFormat("yyyy-MM-dd");
		lanmu.setTitle(title);
		lanmu.setCreator(creator);
		lanmu.setDes(des);
		lanmuSrv.update(lanmu);
		String forwardurl = request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/lanmumanager.do?actiontype=get";
		}
		redirect(forwardurl);
	}

	/******************************************************
	 *********************** 加载内部支持*********************
	 *******************************************************/
	public void load() {
		//
		String id = request.getParameter("id");
		String parentid = request.getParameter("parentid");
		if (parentid != null) {
			LanmuTree lms = BeansUtil.getBean("lanmuTree", LanmuTree.class);
			int tempid = new Integer(parentid);
            String showtext=lms.getShowText(tempid);
            System.out.print("showtext="+showtext);
			request.setAttribute("parenttext", showtext);
			request.setAttribute("parentid", parentid);

		} else {
			request.setAttribute("parentid", 0);
			request.setAttribute("parenttext", "系统总栏目");
		}
		String actiontype = "save";
		if (id != null) {
			Lanmu lanmu = (Lanmu) lanmuSrv.load( "where id=" + id);
			if (lanmu != null) {
				request.setAttribute("lanmu", lanmu);
			}
			actiontype = "update";
		}
		request.setAttribute("id", id);
		request.setAttribute("actiontype", actiontype);
		String forwardurl=request.getParameter("forwardurl");
		if (forwardurl == null) {
			forwardurl = "/admin/lanmuadd.jsp";
		}
		forward(forwardurl);
	}

	/******************************************************
	 *********************** 数据绑定内部支持*********************
	 *******************************************************/
	public void get() {
		String filter = "";
		//
		String forwardurl = request.getParameter("forwardurl");
		List listlanmu = lanmuTree.getTree(0);
		request.setAttribute("listlanmu", listlanmu);
		// 分发请求参数
		dispatchParams(request, response);
		if (forwardurl == null) {
			forwardurl = "/admin/lanmumanager.jsp";
		}
		forward(forwardurl);
	}
	

}//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
