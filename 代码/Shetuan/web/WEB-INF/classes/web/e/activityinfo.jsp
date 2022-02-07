
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<%@ page import="com.daowen.jdbc.simplecrud.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html> 
<head> 
<title>活动</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/admin/css/web2table.css" type="text/css"></link>
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
	<link href="${pageContext.request.contextPath}/webui/jquery-confirm/jquery-confirm.css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/webui/jquery-confirm/jquery-confirm.min.js"></script>
	<link href="${pageContext.request.contextPath}/webui/jquery-toast/jquery.toast.css" rel="stylesheet" />
	<script src="${pageContext.request.contextPath}/webui/jquery-toast/jquery.toast.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/leaveword.css" type="text/css"></link>

<script type="text/javascript">
       $(function(){

           $("#btnJoin").click(function(){

               var temaccountname= $("#hidCurrenthy").val();
               var gotourl=$("#gotourl").val();
               if(temaccountname==""){

                   window.location.href="${pageContext.request.contextPath}/e/login.jsp?forwardurl="+gotourl;
                   return false;

               }
               $.confirm({
                   title: '比赛报名',
                   icon: 'fa fa-warning',
                   content: '你确定要报名吗?',
                   confirmButton: '确定',
                   confirmButtonClass: 'btn-primary',
                   cancelButton: '取消',
                   cancelButtonClass: 'btn-default btn',
                   closeIcon: true,
                   confirm: function () {
                       $("#actjoinForm").submit();

                   },
                   cancel: function () {

                   }
               });//confirm

               return false;
           });
    	   
    	   
       });
</script>



<%
           String id=request.getParameter("id");
           long nMinutes=0;
            ActivityService activitySrv=BeansUtil.getBean("activityService", ActivityService.class);
            Activity activity=null;
            if(id!=null){
                 activity=activitySrv.load("where id="+id);
                if(activity!=null){
                   request.setAttribute("activity",activity);
                   nMinutes= activitySrv.getDiffMintues(activity.getId());
                   request.setAttribute("diffMinutes", nMinutes);
                   
               }
            }
           
   
            SimpleJdbc jdbc=BeansUtil.getSimpleJdbcBean();
		       String sql=MessageFormat.format("select h.* from huiyuan h ,actjoin aj where h.accountname=aj.hyaccountname and aj.actid={0} ",id);
		       DataTable dt = jdbc.query(sql,null);
		      
		       int totalCount=dt.getRows().size();
   %>
</head>
<body>
		<input type="hidden" id="commentresurl" value="/e/activityinfo.jsp?id=<%=id%>"/>
	<input type="hidden" id="gotourl" value="/e/activityinfo.jsp?id=<%=id%>"/>
	<jsp:include page="head.jsp"></jsp:include>
	
	<div class="fn-clear"></div>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt;活动信息
		</div>
	
	     <div class="show-details">
	         <div class="picture-box">
		       <img id="imgTupian"
						src="${requestScope.activity.tupian}" />
			   <div class="operation">
			     
			     <div class="ticket-price">
			         ${requestScope.activity.title}
			     </div>
			    
			      
			   </div>
		   </div>
		   <div class="text-box">
		       <div class="title" >
		            ${requestScope.activity.title}
		       </div>
		       <div class="sub-title">
		          ${donatepro.tag}
		       </div>
		       
		       <div>
		           <ul>
		           
		              <li><strong>招募开始:</strong>
		                  <fmt:formatDate value="${requestScope.activity.hdbegindate}" pattern="yyyy-MM-dd"/>
		               </li>
		               <li><strong>结束时间:</strong>
		                  <fmt:formatDate value="${requestScope.activity.hdenddate}" pattern="yyyy-MM-dd"/>
		               </li>
		                
		               <li><strong>发布人:</strong>
		                  ${requestScope.activity.fqren}-${requestScope.activity.fqname}
		               </li>
		               
		               <li><strong>发起时间:</strong>
		                  <fmt:formatDate value="${requestScope.activity.createtime}" pattern="yyyy-MM-dd"/>
		               </li>
		               
		                <li><strong>招募人数:</strong>
		                    ${activity.maxcount}人
		               </li>
		             <c:if test="${diffMinutes>0}"> 
		              <%if(activity.getMaxcount()>totalCount){ %>
		                <li>
		                
		                   <form name="actjoinform" method="post"
							action="${pageContext.request.contextPath}/admin/actjoinmanager.do"
							id="actjoinForm">

						  <input type="hidden" name="actid" value="<%=id %>" />
						  <input type="hidden" name="actname" value="${activity.title}" />
						   <input type="hidden" name="actiontype" value="save" /> 
						   <input type="hidden" id="hidCurrenthy" name="hyaccountname" value="${huiyuan.accountname}"/>
						   <input
								type="hidden" name="errorurl" value="/e/activityinfo.jsp?id=<%=id%>" />
							<input type="hidden" name="forwardurl"
								value="/admin/actjoinmanager.do?actiontype=get&forwardurl=/e/activityinfo.jsp?id=<%=id%>" />
							<button id="btnJoin" class="btn btn-default">
								<i class="fa fa-plus"></i>报名参加
							</button>
							<div style="font-size:26px;color:red;font-weight:400;">
						           ${jointip}
			                </div>
						</form>
						<%}else{ %>
						    人员已满
						<%} %>
						
		                </li>
		                </c:if>
		                <c:if test="${diffMinutes<=0}"> 
		                    <div style="font-size:22px;padding-left:80px;padding-top:30px;"> <i class="fa fa-exclamation"></i>活动已过期</div>
		                </c:if>
		           </ul>
		           
		           
		       </div>
		      
		       
		   </div>
		
		</div>
		
		   
		     <div style="wrap">
		          
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
								   
						           
		                
								   for(DataRow dr : dt.getRows()){
							%>
						<tr>
							
							<td><%=dr.getString("accountname") %>-<%=dr.getString("name") %></td>
							<td><img width="80" height="70" src="<%=dr.getString("touxiang")%>"/></td>
							<td><%=dr.getString("mobile")%></td>
							
						</tr>
						<%}
						
						%>
						
						<%if(totalCount==0){ %>
						  <tr><td colspan="3">暂无相关人员参加</td></tr>
						<%} %>
					</tbody>
				</table>
		              
		          </div>
		           <div class="brief-title">活动介绍</div>
		           <div class="brief-content">
		              ${requestScope.activity.dcontent}
		           </div>
		     </div>
		     <div class="fn-clear"></div>
		      
		      <jsp:include page="comment.jsp">
		            <jsp:param value="activity" name="commenttype"/>
		      </jsp:include>
				
		      
		      
	     </div>
						
			
			
			
		</div>
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
</body>
</html>
