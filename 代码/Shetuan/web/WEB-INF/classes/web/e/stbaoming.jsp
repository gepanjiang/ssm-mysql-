<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="huiyuan/law.jsp" %> 


<%
           String id=request.getParameter("id");
           ShetuanService shetuanSrv=BeansUtil.getBean("shetuanService", ShetuanService.class);
            if(id!=null){
                Shetuan shetuan=shetuanSrv.load("where id="+id);
                if(shetuan!=null)
                   request.setAttribute("shetuan",shetuan);
            }
   %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>社团</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>
 <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script> 
 <script type="text/javascript">
        
        $(function (){
        	$("#txtRxdate").datepicker({
                dateFormat:'yy-mm-dd'
             }).datepicker("setDate",new Date());
            $.metadata.setType("attr","validate");
            $("#stchengyuanForm").validate();
        });  
    </script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<input type="hidden" id="commentresurl" value="/e/shetuaninfo.jsp?id=<%=id%>"/>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; <a href="${pageContext.request.contextPath}/e/shetuanlist.jsp">社团</a>
		</div>
		
		<div class="show-details">
			<div class="picture-box">
				<img id="imgTupian" src="${requestScope.shetuan.tupian}" />
				<div class="operation">
					<div class="ticket-price">    
                    
                   </div>
				</div>
			</div>
			<div class="text-box">
				<div class="title">${requestScope.shetuan.stname}</div>
				<div class="sub-title"></div>
				<div>
					<ul>
						<li><strong>标题:</strong> ${requestScope.shetuan.stname}</li>
						<li><strong>成立时间:</strong> <fmt:formatDate value="${requestScope.shetuan.cjdate}" pattern="yyyy-MM-dd"/></li>
						<li><strong>成员:</strong> ${requestScope.shetuan.count}人
						</li>
						<li><strong>社长:</strong> ${requestScope.shetuan.shezhang}</li>
						
					</ul>
				</div>
				<div></div>
			</div>
		</div>
		<!--end text-box-->
	</div>
	 <div  class="wrap round-block">
	           <div class="brief-title">在线报名</div>
		       <div class="brief-content">
			<form name="stchengyuanform" method="post"
				action="${pageContext.request.contextPath}/admin/stchengyuanmanager.do"
				id="stchengyuanForm">
				<table class="grid" cellspacing="1" width="100%">
					<input type="hidden" name="id" value="${id}" />
					<input type="hidden" name="photo" value="${huiyuan.touxiang}" />
					<input name="hyaccount" placeholder="会员账号"
						validate="{required:true,messages:{required:'请输入会员账号'}}"
						value="${huiyuan.accountname}" class="input-txt"
						type="hidden" />
					<input name="stid" placeholder="社团编号"
						validate="{required:true,messages:{required:'请输入社团编号'}}"
						value="${shetuan.id}" class="input-txt" type="hidden" />
					<input type="hidden" name="actiontype" value="save" />
					<input type="hidden" name="seedid" value="${seedid}" />
					<input type="hidden" name="errorurl"
						value="/e/stbaoming.jsp?id=${shetuan.id}" />
					<input type="hidden" name="forwardurl"
						value="/e/shetuaninfo.jsp?id=${shetuan.id}" />
					<tr>
						<td colspan="4">${errormsg}</td>
					</tr>


					<tr>
						<td align="right">姓名:</td>
						<td><input name="name" placeholder="姓名"
							validate="{required:true,messages:{required:'请输入姓名'}}"
							value="${huiyuan.name}" class="input-txt" type="text"
							id="txtName" /></td>
						
					</tr>
					<tr>
						<td align="right">性别:</td>
						<td><input name="sex" placeholder="性别"
							validate="{required:true,messages:{required:'请输入性别'}}"
							value="${huiyuan.sex}"  type="radio"  checked="checked" />男
							<input name="sex" placeholder="性别"
							validate="{required:true,messages:{required:'请输入性别'}}"
							value="${huiyuan.sex}"  type="radio" />女
							
					    </td>
					</tr>
					<tr>
						<td align="right">专业:</td>
						<td><input name="major" placeholder="专业"
							validate="{required:true,messages:{required:'请输入专业'}}"
							value="${requestScope.stchengyuan.major}" class="input-txt"
							type="text" id="txtMajor" /></td>
					</tr>
					<tr>
						<td align="right">联系电话:</td>
						<td><input name="mobile" placeholder="联系电话"
							validate="{required:true,messages:{required:'请输入联系电话'}}"
							value="${huiyuan.mobile}" class="input-txt" type="text"
							id="txtMobile" /></td>
					</tr>

					<tr>
						<td align="right">籍贯:</td>
						<td><input name="jiguan" placeholder="籍贯"
							validate="{required:true,messages:{required:'请输入籍贯'}}" value="北京"
							class="input-txt" type="text" id="txtJiguan" /></td>
					</tr>
					<tr>
						<td align="right">入校时间:</td>
						<td><input name="rxdate"
							value="${requestScope.stchengyuan.rxdate}" type="text"
							id="txtRxdate" class="input-txt" validate="{required:true}" /></td>
					</tr>

					<tr>
						<td align="right">介绍:</td>
						<td colspan="3"><textarea name="des" rows="4" id="txtDes"
								style="width: 98%; height: 100px;" validate="{required:true}">${requestScope.stchengyuan.des}</textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<button class="btn btn-default">
								<i class="fa fa-check"></i>报名
							</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<div class="fn-clear"></div>
	

	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
