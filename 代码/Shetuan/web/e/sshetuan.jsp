
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.daowen.webcontrol.*" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>社团</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; <a href="${pageContext.request.contextPath}/e/shetuanlist.jsp">社团</a>
		</div>
	
			
			<%
			 
			   List<Shetuan> listshetuan = (List<Shetuan>)request.getAttribute("listShetuan");
			
			// 分发请求参数
			%>
			
			 <div class="common-picture-list">
			  
			    <ul>
			      <%
			      
			       SimpleDateFormat  sdf=new SimpleDateFormat("yyyy-MM-dd");
			       if(listshetuan!=null){ 
			        
			    	  for(Shetuan temshetuan : listshetuan)
			    	  {
			      
			      %>
			      
			    
			       <li class="clearfix">
			            <h3>
					        <a href="${pageContext.request.contextPath }/e/shetuaninfo.jsp?id=<%=temshetuan.getId()%>"><%=temshetuan.getStname() %></a> 
					     </h3>
					     <div class="picture-area">
					        <a href="${pageContext.request.contextPath}/e/shetuaninfo.jsp?id=<%=temshetuan.getId()%>" target="_blank" ><img src="<%=temshetuan.getTupian() %>" width="150" height="95"></a>
					     </div>
					     <div class="text-area">
					           <p>
					               <%=temshetuan.getDes() %>[<a href="${pageContext.request.contextPath}/e/shetuaninfo.jsp?id=<%=temshetuan.getId()%>">详细</a>]
					           </p>
					           <p>
					                                        社团分类:<%=temshetuan.getTypename() %>   成立时间:<%=sdf.format(temshetuan.getCjdate()) %> 社长:<%=temshetuan.getShezhang() %>
					           </p>
					     </div>
					  
			       </li>
			       
			       <%}}%>
			       
			    </ul>
			    
			 
			 </div>
			 
			 	<div class="clear"></div>
				<form id="shetuansearchForm" method="post" action="${pageContext.request.contextPath}/admin/sitesearch.do">
		                <input type="hidden" name="actiontype" value="get" />
		                <input type="hidden"  name="title" value="${title}"/>
                      <input type="hidden" name="forwardurl" value="/e/sshetuan.jsp" />
                 </form>
		<daowen:pager id="pager1"  attcheform="shetuansearchForm" />
				
				
				
		</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
