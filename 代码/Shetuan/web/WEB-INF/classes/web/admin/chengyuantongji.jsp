<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="law.jsp"%>
<%@ page import="com.daowen.jdbc.simplecrud.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<%
     SimpleJdbc jdbc=BeansUtil.getSimpleJdbcBean();
     String sql="select st.stname,cy.sex ,count(*) as count from stchengyuan cy ,shetuan st where cy.stid=st.id group by st.stname,cy.sex ";
     DataTable dt=jdbc.query(sql, null);
     
     
   
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>社团成员信息</title>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/combo/combo.js"
			type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
		<script type="text/javascript">
			$(function() {
			    
			});
       </script>
	</head>
	 <body >
	<div class="search-title">
		<h2>社团成员统计</h2>
		<div class="description">
		   <a href="shetuantongji.jsp">图表统计</a>
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
	
	<table id="stchengyuan" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th><b>社团名称</b></th>
				<th><b>性别</b></th>
				<th><b>人数</b></th>
				
				
			</tr>
		</thead>
		<tbody>
			
		   <%for(DataRow dr :dt.getRows()){ %>
			<tr>
				
				<td><%=dr.getString("stname") %></td>
				<td><%=dr.getString("sex") %></td>
			    <td><%=dr.getNumber("count") %>人</td>
			</tr>
			<%} %>
			
		</tbody>
	</table>
	<div class="clear"></div>
</body>
</html>
