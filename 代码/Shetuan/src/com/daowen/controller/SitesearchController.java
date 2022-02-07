//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
package com.daowen.controller;

import java.text.MessageFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.entity.Shetuan;
import com.daowen.entity.Xinxi;
import com.daowen.service.ShetuanService;
import com.daowen.service.XinxiService;
import com.daowen.ssm.simplecrud.SimpleController;
import com.daowen.webcontrol.PagerMetal;

@Controller
public class SitesearchController extends SimpleController {

	@Override
	@RequestMapping("/admin/sitesearch.do")
	public void mapping(HttpServletRequest req, HttpServletResponse resp) {
		mappingMethod(req,resp);

	}
	
	private void find() {

		String searchtype = request.getParameter("searchtype");
        String  title=request.getParameter("title");
        System.out.println("searchtype="+searchtype);
		if(searchtype!=null&&searchtype.equals("1")){
			shetuanList();
			
		}
		if(searchtype!=null&&searchtype.equals("2")){
	            List<Xinxi> xinxilist=null;
	            if(title!=null){
	            	 xinxilist=xinxiSrv.getEntity("where title like '%"+title+"%'");
	                 request.setAttribute("xinxilist", xinxilist);
	            }
			
			forward("/e/searchnews.jsp");
		}
	}
	
	public void shetuanList() {
		String filter = "where 1=1 ";
		String title = request.getParameter("title");
		
		if (title != null)
			filter += MessageFormat.format("  and stname like ''%{0}%''  ",title);
		int pageindex = 1;
		int pagesize = 10;
		// ��ȡ��ǰ��ҳ
		String currentpageindex = request.getParameter("currentpageindex");
		// ��ǰҳ��ߴ�
		String currentpagesize = request.getParameter("pagesize");
		// ���õ�ǰҳ
		if (currentpageindex != null)
			pageindex = new Integer(currentpageindex);
		// ���õ�ǰҳ�ߴ�
		if (currentpagesize != null)
			pagesize = new Integer(currentpagesize);
		List<Shetuan> listshetuan = shetuanSrv.getPageEntitys(filter,
				pageindex, pagesize);
		int recordscount = shetuanSrv.getRecordCount(filter == null ? ""
				: filter);
		request.setAttribute("listShetuan", listshetuan);
		request.setAttribute("title", title);
		PagerMetal pm = new PagerMetal(recordscount);
		// ���óߴ�
		pm.setPagesize(pagesize);
		// ���õ�ǰ��ʾҳ
		pm.setCurpageindex(pageindex);
		// ���÷�ҳ��Ϣ
		request.setAttribute("pagermetal", pm);
	   
		String forwardurl = request.getParameter("forwardurl");
		System.out.println("forwardurl=" + forwardurl);
		if (forwardurl == null) {
			forwardurl = "/e/sshetuan.jsp";
		}
		forward(forwardurl);
	}
	

	@Autowired
	private XinxiService xinxiSrv=null;
	@Autowired
	private ShetuanService  shetuanSrv=null;
	
}
//-------------------------请加下面QQ请求远程辅助运行代码  ID:3578--------------------------
//-----------------更多毕设, 联系QQ1305637939-------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加作者QQ协助运行: 1305637939-----------------------
//-------------------------请加下面QQ请求远程辅助运行代码----------------------------
