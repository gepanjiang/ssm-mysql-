<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
		String id=request.getParameter("id");
		ShetuanService shetuanSrv=BeansUtil.getBean("shetuanService", ShetuanService.class);
		 if(id!=null){
		     Shetuan shetuan=shetuanSrv.load("where id="+id);
		     if(shetuan!=null)
		        request.setAttribute("shetuan",shetuan);
		 }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>社团信息查看</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	 	 <div class="search-title">
<h2>
	                      查看社团
	                </h2>
	                <div class="description">
	                </div>
              </div>
				        <table cellpadding="0" cellspacing="1" class="grid" width="100%" >
											   <tr>
											   <td width="10%" align="right" >社团名称:</td>
											   <td>
												   ${requestScope.shetuan.stname}
												</td>
											   </tr>
											   <tr>
											   <td align="right">创建日期:</td>
											   <td>
												    <fmt:formatDate  value="${requestScope.shetuan.cjdate}" pattern="yyyy-MM-dd" />
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >成员:</td>
											   <td>
												   ${requestScope.shetuan.count}
												</td>
											   </tr>
											   <tr>
											   <td width="10%" align="right" >社长:</td>
											   <td>
												   ${requestScope.shetuan.shezhang}
												</td>
											   </tr>
											   <tr>
											    <td align="right">海报:</td>
											   <td>
												   <img id="imgTupian" width="200px" height="200px" src="${requestScope.shetuan.tupian}"/>
												</td>
											   </tr>
											   <tr>
											    <td align="right" >社团分类:</td>
											   <td>
												   ${requestScope.shetuan.typename}
												</td>
											   </tr>
											 <tr>
											   <td align="right">社团介绍:</td>
											   <td colspan="3">
												${requestScope.shetuan.des}
											   </td>
											 </tr>
				        </table>
</body>
</html>
