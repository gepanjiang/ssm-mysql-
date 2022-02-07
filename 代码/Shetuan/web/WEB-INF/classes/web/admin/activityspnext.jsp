<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.daowen.jdbc.simplecrud.*" %>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    ActivityService activitySrv=BeansUtil.getBean("activityService", ActivityService.class);
    if( id!=null)
    {
         Activity temobjactivity=activitySrv.load(" where id="+ id);
          request.setAttribute("activity",temobjactivity);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>活动审批</title>
  <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>活动审批</h2>
		<div class="description"></div>
	</div>
	<form name="activityform" method="post"
		action="${pageContext.request.contextPath}/admin/activitymanager.do"
		id="activityForm">
		<input type="hidden" name="id" value="<%=id%>" /> <input
			type="hidden" name="actiontype" value="shenpi" /> <input
			type="hidden" name="errorurl" value="/admin/activityadd.jsp" /> <input
			type="hidden" name="forwardurl"
			value="/admin/activitymanager.do?actiontype=get&forwardurl=/admin/activitymanager.jsp" />
		<table cellpadding="0" cellspacing="1" class="grid" width="100%">
			<tr>
				<td width="10%" align="right">标题:</td>
				<td>${requestScope.activity.title}</td>
				<td colspan="2" rowspan="6"><img id="imgTupian" width="200px" height="200px"
					src="${requestScope.activity.tupian}" /></td>
			</tr>
			<tr>
				<td align="right">活动开始时间:</td>
				<td><fmt:formatDate
						value="${requestScope.activity.hdbegindate}" pattern="yyyy-MM-dd" />
				</td>
			</tr>
			<tr>
				<td align="right">活动结束日期:</td>
				<td><fmt:formatDate value="${requestScope.activity.hdenddate}"
						pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td width="10%" align="right">发起人:</td>
				<td>${requestScope.activity.fqname}-${requestScope.activity.fqren}</td>
			</tr>
			
			
			<tr>
				<td width="10%" align="right">发起时间:</td>
				<td>${requestScope.activity.createtime}</td>
			</tr>
			
			<tr>
				<td align="right">类型名:</td>
				<td>${requestScope.activity.typename}</td>
			</tr>
			
			<tr>
				<td align="right">活动内容:</td>
				<td colspan="3">${requestScope.activity.dcontent}</td>
			</tr>
			<tr>
				<td align="right">审批结果</td>
				<td><input type="radio" value="2" name="state"
					checked="checked" />审批通过 <input type="radio" value="3" name="state" />拒绝
				</td>
			</tr>
			<tr>
				<td align="right">处理说明:</td>
				<td colspan="3"><textarea name="reply" id="txtReply"
						style="width:48%;height:80px;"></textarea></td>
			</tr>
			<tr>
				<td colspan="4">
					<button class="orange-button">提交审批</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
