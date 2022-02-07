<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.beans.Beans" %>
<%@ include file="law.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
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
				                 url: "${pageContext.request.contextPath}/admin/stchengyuanmanager.do?actiontype=delete",
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
		<h2>社团成员管理</h2>
		<div class="description"></div>
	</div>
	<!-- 搜索控件开始 -->
	<div class="search-options">
		<form id="searchForm"
			action="${pageContext.request.contextPath}/admin/stchengyuanmanager.do"
			method="post">
			<table cellspacing="0" width="100%">
				<tbody>
					<tr>
						<td>成员姓名 <input name="name" value="${name}" class="input-txt"
							type="text"/> <input type="hidden" name="actiontype"
							value="search" /> <input type="hidden" name="seedid"
							value="${seedid}" /> <input type="hidden" name="forwardurl"
							value="/admin/stchengyuansp.jsp" />
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
		<span class="orange-href" id="btnCheckAll">选择</span> <span
			id="btnDelete" class="orange-href"> 删除 </span>
	</div>
	<table id="stchengyuan" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
				<th>选择</th>
				<th><b>会员账号</b></th>
				<th><b>姓名</b></th>
				<th><b>社团</b></th>
				<th><b>性别</b></th>
				<th><b>专业</b></th>
				<th><b>联系电话</b></th>
				<th><b>籍贯</b></th>
				<th><b>入校时间</b></th>
				<th><b>状态</b></th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
			<c:if
				test="${liststchengyuan== null || fn:length(liststchengyuan) == 0}">
				<tr>
					<td colspan="20">没有相关社团成员信息</td>
				</tr>
			</c:if>
			<%

				   ShetuanService  shetuanSrv= BeansUtil.getBean("shetuanService",ShetuanService.class);
									if(request.getAttribute("liststchengyuan")!=null)
								      {
									  List<Stchengyuan> liststchengyuan=( List<Stchengyuan>)request.getAttribute("liststchengyuan");
								     for(Stchengyuan  temstchengyuan  :  liststchengyuan)
								      {

								          Shetuan shetuan=shetuanSrv.load(temstchengyuan.getStid());

							%>
			<tr>
				<td>&nbsp <input id="chk<%=temstchengyuan.getId()%>"
					class="check" name="ids" type="checkbox"
					value='<%=temstchengyuan.getId()%>'></td>
				<td><%=temstchengyuan.getHyaccount()%></td>
				<td><%=temstchengyuan.getName()%></td>
				<td>
					<%if(shetuan!=null){%>
				    	<%=shetuan.getStname()%>

					<%}else{%>
					   社团信息异常
					<%}%>
				</td>
				<td><%=temstchengyuan.getSex()%></td>
				<td><%=temstchengyuan.getMajor()%></td>
				<td><%=temstchengyuan.getMobile()%></td>
				<td><%=temstchengyuan.getJiguan()%></td>
				<td><%=new SimpleDateFormat("yyyy-MM-dd").format(temstchengyuan.getRxdate())%></td>
				<td>
					<%if(temstchengyuan.getState()==1){%> 等待审批 <%}%> <%if(temstchengyuan.getState()==2){%>
					同意 <%}%> <%if(temstchengyuan.getState()==3){%> 拒绝 <%}%>
				</td>
				<td>
					<%if(temstchengyuan.getState()==1){%> <a class="orange-href"
					href="${pageContext.request.contextPath}/admin/stchengyuanspnext.jsp?id=<%=temstchengyuan.getId()%>">审批</a>
					<%}%> <a class="orange-href"
					href="${pageContext.request.contextPath}/admin/stchengyuandetails.jsp?id=<%=temstchengyuan.getId()%>">查看</a>
				</td>
			</tr>
			<%}}%>
		</tbody>
	</table>
	<div class="clear"></div>
	<daowen:pager id="pager1" attcheform="searchForm" />
</body>
</html>
