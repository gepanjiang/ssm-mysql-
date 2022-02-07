<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="import.jsp" %> 

<%
           String id=request.getParameter("id");
           StchengyuanService  stchengyuanSrv=BeansUtil.getBean("stchengyuanService", StchengyuanService.class);
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
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/web2table.css" type="text/css"></link>
<script type="text/javascript">
      $(function(){
    	  
    	  $(".require-login").click(function(){
   	    	  var temaccountname= $("#scren").val(); 
   	    	  var forwardurl=$("#commentresurl").val();
   	    	  if(temaccountname==""){
                     window.location.href="${pageContext.request.contextPath}/e/login.jsp?forwardurl="+forwardurl;
                     return false;
                }
   	    	   return true;
   	      });
    	  
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
                     <form method="post" style="display:inline" action="${pageContext.request.contextPath}/admin/shoucangmanager.do">
                                         <input type="hidden" name="bookid" value="<%=id%>"/>
                                          <input type="hidden" name="bookname" value="${shetuan.stname}"/>
                                          <input type="hidden" name="tupian" value="${shetuan.tupian}"/>
                                         <input type="hidden" name="actiontype" value="save"/>
                                         <input type="hidden" id="scren" name="scren" value="${huiyuan.accountname}"/>
                                         <input type="hidden" name="forwardurl" value="/e/shetuaninfo.jsp?id=<%=id%>"/>
                                          <input type="hidden" name="errorurl" value="/e/shetuaninfo.jsp?id=<%=id%>"/>
                                           <input type="hidden" name="href" value="/e/shetuaninfo.jsp?id=${shetuan.id }"/>
                                         <input type="hidden" name="xtype" value="shetuan"/>
		                     <button  id="btnShoucang" class="btn btn-default require-login"><i class="fa fa-plus"></i>收藏</button>
		                     ${sctip}
                       </form>
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
						<li>
						                
		                     <a href="${pageContext.request.contextPath}/e/stbaoming.jsp?id=${shetuan.id}"  class="btn btn-default require-login"><i class="fa fa-plus"></i>我要报名</a>
		                     
                       
						</li>
					</ul>
				</div>
				<div></div>
			</div>
		</div>
		<!--end text-box-->
	</div>
	
	<div  class="wrap round-block">
	           <div class="brief-title">社团成员</div>
		       <div class="brief-content">
		              <table id="stchengyuan" width="100%" border="0" cellspacing="0"
		cellpadding="0" class="ui-record-table">
		<thead>
			<tr>
	            <th><b>会员账号</b></th>
				<th><b>姓名</b></th>
				<th><b>性别</b></th>
				<th><b>专业</b></th>
				<th><b>联系电话</b></th>
				<th><b>籍贯</b></th>
				<th><b>入校时间</b></th>
				<th><b>状态</b></th>
			</tr>
		</thead>
		<tbody>
			
			<%	
									 
			                         
									 List<Stchengyuan> liststchengyuan=stchengyuanSrv.getEntity("where state=2 and stid="+id);
			                         request.setAttribute("liststchengyuan", liststchengyuan);
								     for(Stchengyuan  temstchengyuan  :  liststchengyuan)
								      {
							%>
			<tr>
				
				<td><%=temstchengyuan.getHyaccount()%></td>
				<td><%=temstchengyuan.getName()%></td>
				<td><%=temstchengyuan.getSex()%></td>
				<td><%=temstchengyuan.getMajor()%></td>
				<td><%=temstchengyuan.getMobile()%></td>
				<td><%=temstchengyuan.getJiguan()%></td>
				<td><%=new SimpleDateFormat("yyyy-MM-dd").format(temstchengyuan.getRxdate())%></td>
				<td>
					<%if(temstchengyuan.getState()==1){%> 等待审批 <%}%> <%if(temstchengyuan.getState()==2){%>
					同意 <%}%> <%if(temstchengyuan.getState()==3){%> 拒绝 <%}%>
				</td>
				
			</tr>
			<%}%>
			
			<c:if test="${liststchengyuan== null || fn:length(liststchengyuan) == 0}">
				<tr>
					<td colspan="20">没有相关社团成员信息</td>
				</tr>
			</c:if>
		</tbody>
	</table>
		      </div>
		      
		     
	
	
	</div>
	
	 <div  class="wrap round-block">
	           <div class="brief-title">介绍</div>
		       <div class="brief-content">
		              ${shetuan.des}
		      </div>
		      
		     
	
	
	</div>
	<div class="fn-clear"></div>
	<div class="wrap round-block">
	     <jsp:include page="comment.jsp">
		                   <jsp:param value="shetuan" name="commenttype"/>
		      </jsp:include>
	</div>
		

	
		
	
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
