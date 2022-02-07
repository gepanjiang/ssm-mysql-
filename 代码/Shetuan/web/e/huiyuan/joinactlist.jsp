<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
   <title>活动信息</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
 <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
		<script type="text/javascript">
			$(function() {
			    
			});
       </script>
	</head>
	 <body >
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; 参加的活动
		</div>
	
		<div class="main">
			<jsp:include page="menu.jsp"></jsp:include>
			<div class="main-content">
				<!-- 搜索控件开始 -->
				<div class="search-options">
					<form id="searchForm"
						action="${pageContext.request.contextPath}/admin/activitymanager.do"
						method="post">
						<table cellspacing="0" width="100%">
							<tbody>
								<tr>
									<td>标题 <input name="title" value="${title}"
										class="input-txt" type="text" id="title" /> 
										<input type="hidden" name="fqren" value="${huiyuan.accountname}" /> 
										<input type="hidden" name="actiontype" value="search" /> 
										<input
										type="hidden" name="seedid" value="${seedid}" /> <input
										type="hidden" name="forwardurl"
										value="/e/huiyuan/joinactlist.jsp" />
										<div class="ui-button">
											<input type="submit" value="搜索" id="btnSearch"
												class="orange-button" />
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<!-- 搜索控件结束 -->
				<div class="clear"></div>
				
				<table id="activity" width="100%" border="0" cellspacing="0"
					cellpadding="0" class="ui-record-table">
					<thead>
						<tr>
							<th><b>标题</b></th>
							<th><b>活动开始时间</b></th>
							<th><b>活动结束日期</b></th>
							<th><b>发起人</b></th>
							<th><b>状态</b></th>
							
							<th><b>发起时间</b></th>
							
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:if
							test="${listactivity== null || fn:length(listactivity) == 0}">
							<tr>
								<td colspan="20">没有相关活动信息</td>
							</tr>
						</c:if>
						<%	
								   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
									if(request.getAttribute("listactivity")!=null)
								      {
									  List<Activity> listactivity=( List<Activity>)request.getAttribute("listactivity");
								     for(Activity  temactivity  :  listactivity)
								      {
							%>
						<tr>
							
							<td><%=temactivity.getTitle()%></td>
							<td><%=sdf.format(temactivity.getHdbegindate())%></td>
							<td><%=sdf.format(temactivity.getHdenddate())%></td>
							<td><%=temactivity.getFqren()%>-<%=temactivity.getFqname()%></td>
							<td>
							     <%if(temactivity.getState()==1){%>
							                     待审批
							     <%} %>
							     <%if(temactivity.getState()==2){%>
							                     审批通过
							     <%} %>
							     <%if(temactivity.getState()==3){%>
							                     不通过
							     <%} %>
							</td>
							
							<td><%=sdf.format(temactivity.getCreatetime())%></td>
							
							<td><a class="orange-href"
								href="${pageContext.request.contextPath}/e/activityinfo.jsp?id=<%=temactivity.getId()%>"><i
									class="icon-zoom-in icon-white"></i>查看</a></td>
						</tr>
						<%}}%>
					</tbody>
				</table>
				<div class="clear"></div>
			
			</div>
		</div>
	</div>
</body>
</html>
