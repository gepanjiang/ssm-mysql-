<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    StchengyuanService stchengyuanSrv=BeansUtil.getBean("stchengyuanService", StchengyuanService.class);
    if( id!=null)
    {
         Stchengyuan temobjstchengyuan=stchengyuanSrv.load(" where id="+ id);
          request.setAttribute("stchengyuan",temobjstchengyuan);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>社团成员审批</title>
  <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
    	   <div class="search-title">
			<h2>社团成员审批</h2>
			<div class="description">
			</div>
		</div>
	<form name="stchengyuanform" method="post"
		action="${pageContext.request.contextPath}/admin/stchengyuanmanager.do"
		id="stchengyuanForm">
		<input type="hidden" name="id" value="<%=id%>" /> <input
			type="hidden" name="actiontype" value="shenpi" /> <input
			type="hidden" name="errorurl" value="/admin/stchengyuanadd.jsp" /> <input
			type="hidden" name="forwardurl"
			value="/admin/stchengyuanmanager.do?actiontype=get&forwardurl=/admin/stchengyuansp.jsp" />
		<table cellpadding="0" cellspacing="1" class="grid" width="100%">
			
			
			<tr>
				<td width="10%" align="right">姓名:</td>
				<td>${requestScope.stchengyuan.name}</td>
				 <td colspan="2" rowspan="6">
												   <img id="imgPhoto" width="200px" height="200px" src="${requestScope.stchengyuan.photo}"/>
												</td>
			</tr>
			<tr>
				<td width="10%" align="right">性别:</td>
				<td>${requestScope.stchengyuan.sex}</td>
			</tr>
			<tr>
				<td width="10%" align="right">专业:</td>
				<td>${requestScope.stchengyuan.major}</td>
			</tr>
			<tr>
				<td width="10%" align="right">联系电话:</td>
				<td>${requestScope.stchengyuan.mobile}</td>
			</tr>
			
			<tr>
				<td width="10%" align="right">籍贯:</td>
				<td>${requestScope.stchengyuan.jiguan}</td>
			</tr>
			<tr>
				<td align="right">入校时间:</td>
				<td><fmt:formatDate value="${requestScope.stchengyuan.rxdate}" pattern="yyyy-MM-dd"/></td>
			</tr>
			<tr>
				<td align="right">处理结果</td>
				<td><input type="radio" value="2" name="state"
					checked="checked" />审批通过 <input type="radio" value="3" name="state" />拒绝
				</td>
			</tr>
			<tr>
				<td align="right">介绍:</td>
				<td colspan="3">${requestScope.stchengyuan.des}</td>
			</tr>
			<tr>
				<td align="right">处理说明:</td>
				<td colspan="3"><textarea name="reply" id="txtReply"
						style="width: 48%; height: 80px;"></textarea></td>
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
