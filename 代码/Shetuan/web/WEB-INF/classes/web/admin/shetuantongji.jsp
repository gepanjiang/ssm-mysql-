<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="org.jfree.chart.JFreeChart"%>
<%@ page import="org.jfree.chart.servlet.ServletUtilities"%>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>社团统计</title>
    <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/admin/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/admin/css/menu.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.9.0.js"></script>
     <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
        <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
	<script type="text/javascript">
	      $(function(){
	    	  $("#txtBegintime").datepicker({
                  dateFormat:'yy-mm-dd'
               });
				if($("#txtBegintime").val()==""){
					$("#txtBegintime").datepicker("setDate",new Date());
				}
				$("#txtEndtime").datepicker({
		dateFormat:'yy-mm-dd'
               });
				if($("#txtEndtime").val()==""){
					$("#txtEndtime").datepicker("setDate",new Date());
				}
	      })
	 </script>
	</head>
	 <body >
	 
	   <div class="search-title">
		<h2>社团成员统计</h2>
		<div class="description">
		   <a href="chengyuantongji.jsp">表格统计</a>
		</div>
	</div>
			 <div style="height:5px;"></div>
				<%
				        SimpleStatistics  simpleStatistics=new SimpleStatistics();
					JFreeChart chart = simpleStatistics.buildPieChart("select st.stname,count(*) from shetuan st,stchengyuan cy where st.id=cy.stid  group by st.id,st.stname ","社团成员人数统计");
					String filename = ServletUtilities.saveChartAsPNG(chart, 1000, 500,
							session);
					String url = request.getContextPath();
					String imageurl = url + "/servlet/DisplayChart?filename="
							+ filename;
				%>
				<img src="<%=imageurl%>" />
	</body>
</html>
