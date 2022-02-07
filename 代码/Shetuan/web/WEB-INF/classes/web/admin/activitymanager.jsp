<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<title>活动信息</title>
    <script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/combo/combo.js" type="text/javascript"></script>
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/webui/treetable/skin/jquery.treetable.theme.default.css" rel="stylesheet"
        type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/treetable/js/jquery.treetable.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			$(function() {
				 $("#btnDelete").click(function(){
				    	var ids = $(".check[type=checkbox]:checked").serialize();
						 if($(".check:checked").length<1)
					        {
					           $.dialog.alert("请选择需要删除条目");
					           return;
					        } 
							if(!confirm("你确定要删除吗")){
								return;
							}
							$.ajax({
					                 url: "${pageContext.request.contextPath}/admin/activitymanager.do?actiontype=delete",
					                     method: 'post',
					                     data: ids,
					                     success: function (data) {
					                          window.location.reload();
					                     },
					                     error: function (XMLHttpRequest, textStatus, errorThrown) {
					                         alert(XMLHttpRequest.status + errorThrown);
					                     }
					                 });
						});
			    $("#btnCheckAll").click(function(){
			           var ischeck=false;
			           $(".check").each(function(){
			               if($(this).is(":checked"))
			               {
			                  $(this).prop("checked","");
			                  ischeck=false;
			                }
			               else
			               {
			                  $(this).prop("checked","true");
			                  ischeck=true;
			                }
			           });
			           if($(this).text()=="选择记录")
			              $(this).text("取消选择");
			           else
			              $(this).text("选择记录");
			    })
			});
       </script>
	</head>
	 <body >
	<div class="search-title">
		<h2>活动管理</h2>
		<div class="description">
			
		</div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/activitymanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>标题 <input name="title" value="${title}" class="input-txt"
							type="text" id="title" /> <input type="hidden"
							name="actiontype" value="search" /> <input type="hidden"
							name="seedid" value="${seedid}" /> <input type="hidden"
							name="forwardurl" value="/admin/activitymanager.jsp" />
							<div class="ui-button">
								<button class="ui-button-text">搜索</button>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<!-- 搜索控件结束 -->
	<div class="clear"></div>
	<div class="action-details">
		<span id="btnCheckAll" class="orange-href">选择 </span> <span
			id="btnDelete" class="orange-href">删除 </span>
	</div>
	<table id="activity" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>标题</b></th>
				<th><b>活动开始时间</b></th>
				<th><b>活动结束日期</b></th>
				<th><b>发起人</b></th>
				<th><b>状态</b></th>
				<th><b>发起人姓名</b></th>
				<th><b>发起时间</b></th>
				<th><b>类型名</b></th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if test="${listactivity== null || fn:length(listactivity) == 0}">
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
				<td>&nbsp<input id="chk<%=temactivity.getId()%>" class="check"
					name="ids" type="checkbox"
					value='<%=temactivity.getId()%>'/></td>
				<td><%=temactivity.getTitle()%></td>
				<td><%=sdf.format(temactivity.getHdbegindate())%></td>
				<td><%=sdf.format(temactivity.getHdenddate())%></td>
				<td><%=temactivity.getFqren()%></td>
				<td>
				     <%if(temactivity.getState()==1){%>
				                  待审批
				     <%} %>
				      <%if(temactivity.getState()==2){%>
				                     审批通过
				     <%} %>
				      <%if(temactivity.getState()==3){%>
				                     审批不通过
				     <%} %>
				     
				</td>
				<td><%=temactivity.getFqname()%></td>
				<td><%=sdf.format(temactivity.getCreatetime())%></td>
				<td><%=temactivity.getTypename()%></td>
				<td>
				
				    <%if(temactivity.getState()==1){ %>
				    
				    <a class="orange-href"
					  href="${pageContext.request.contextPath}/admin/activityspnext.jsp?id=<%=temactivity.getId()%>">
					    <i class="fa fa-edit"></i>活动审批
					</a>
				    
				    <%} %>
				     <%if(temactivity.getState()==2){ %>
				    
				    <a class="orange-href"
					  href="${pageContext.request.contextPath}/admin/activitymanager.do?actiontype=load&id=<%=temactivity.getId()%>&forwardurl=/admin/activityadd.jsp">
					    <i class="fa fa-edit"></i>编辑
					</a>
				    
				    <%} %>
					<a class="orange-href"
					href="${pageContext.request.contextPath}/admin/activitydetails.jsp?id=<%=temactivity.getId()%>"><i
						class="icon-zoom-in icon-white"></i>查看</a>
				</td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
