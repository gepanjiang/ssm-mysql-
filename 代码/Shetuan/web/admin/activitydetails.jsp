<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ page  contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.daowen.jdbc.simplecrud.*" %>
<%@ include file="law.jsp"%>
<%
    String  id=request.getParameter("id");
    Activity temobjactivity=null;
    ActivityService activitySrv=BeansUtil.getBean("activityService", ActivityService.class);
    if( id!=null)
    {
      temobjactivity=activitySrv.load(" where id="+ id);
      request.setAttribute("activity",temobjactivity);
    }
	SimpleJdbc jdbc=BeansUtil.getSimpleJdbcBean();
	//String sql=MessageFormat.format("select h.* from huiyuan h ,actjoin aj where h.accountname=aj.hyaccountname and aj.actid={0} ",id);
	//DataTable dt = jdbc.query(sql,null);
	//int totalCount=dt.getRows().size();
	List<HashMap<String,Object>>  listJoined=activitySrv.getJoined(new Integer(id));
    int  totalCount=0;
    if(listJoined!=null)
        totalCount=listJoined.size();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>活动信息查看</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
</head>
<body >
	<div class="search-title">
		<h2>查看活动信息</h2>
		<div class="description"></div>
	</div>
	<table cellpadding="0" cellspacing="1" class="grid" width="100%">
		<tr>
			<td width="10%" align="right">标题:</td>
			<td>${requestScope.activity.title}</td>
			<td colspan="2" rowspan="6"><img id="imgTupian" width="200px" height="200px"
				src="${requestScope.activity.tupian}" /></td>
		</tr>
		<tr>
			<td align="right">活动开始时间:</td>
			<td><fmt:formatDate value="${requestScope.activity.hdbegindate}"
					pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<td align="right">活动结束日期:</td>
			<td><fmt:formatDate value="${requestScope.activity.hdenddate}"
					pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<td width="10%" align="right">发起人:</td>
			<td>${requestScope.activity.fqren}</td>
		</tr>
		<tr>
			<td width="10%" align="right">状态:</td>
			<td>
			     <%if(temobjactivity.getState()==1){ %>
			                      待审批
			     <%} %>
			     <%if(temobjactivity.getState()==2){ %>
			                      审批通过
			     <%} %>
			     <%if(temobjactivity.getState()==3){ %>
			                      审批拒绝
			     <%} %>
			</td>
		</tr>
		<tr>
			<td width="10%" align="right">发起人姓名:</td>
			<td>${requestScope.activity.fqname}</td>
		</tr>
		<tr>
			<td width="10%" align="right">发起时间:</td>
			<td>${requestScope.activity.createtime}</td>
		</tr>
		
		<tr>
			<td align="right">类型名:</td>
			<td>${requestScope.activity.typename}</td>
		</tr>

	</table>

	<div class="brief-title">
		共<%=totalCount %>人 已参加
	</div>
	<div class="brief-content">


		<table id="activity" width="100%" border="0" cellspacing="0"
			   cellpadding="0" class="ui-record-table">
			<thead>
			<tr>

				<th><b>参与人</b></th>
				<th><b>相片</b></th>

				<th><b>联系方式</b></th>


			</tr>
			</thead>
			<tbody>



			<%



				for(HashMap  map: listJoined){
			%>
			<tr>

				<td><%=map.get("accountname").toString() %>-<%=map.get("name") %></td>
				<td><img width="80" height="70" src="<%=map.get("touxiang")%>"/></td>
				<td><%=map.get("mobile")%></td>

			</tr>
			<%}

			%>

			<%if(totalCount==0){ %>
			<tr><td colspan="3">暂无相关人员参加</td></tr>
			<%} %>
			</tbody>
		</table>
</body>
</html>
