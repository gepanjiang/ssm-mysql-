<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script  type="text/javascript">
     
   $(function(){

      $("#side-menu .menu-group li").removeClass("current");
     
      var seedid='<%=request.getParameter("seedid")%>';
      
      if(seedid!="null")
         $("#"+seedid).addClass("current");
      else
        $("#m1").addClass("current");
      
   })

</script>
<div id="side-menu">

	<div class="menu-group">
		<h2>与我相关 </h2>
		<ul>
		
		
		
		  <li id="206" >
				<a  href="${pageContext.request.contextPath}/admin/activitymanager.do?actiontype=joined&hyaccountname=${huiyuan.accountname}&forwardurl=/e/huiyuan/joinactlist.jsp?seedid=206">我参与的活动</a>
			</li>
			
			<li id="202" >
				<a  href="${pageContext.request.contextPath}/e/huiyuan/shetuanlist.jsp?seedid=202">我参与的社团</a>
			</li>
		
		   <li id="201" >
				<a  href="${pageContext.request.contextPath}/admin/shoucangmanager.do?actiontype=get&scren=${huiyuan.accountname}&seedid=201&forwardurl=/e/huiyuan/shoucangmanager.jsp">我的收藏夹</a>
			</li>
			
			
		    
		    
		    
			
		</ul>
	</div>
	

	

	<div class="menu-group">
		<h2>
			<i class="fa fa-info"></i>账户信息
		</h2>
		<ul>
			<li id="101" class="current">
				<a  href="${pageContext.request.contextPath }/e/huiyuan/accountinfo.jsp?seedid=101">账户信息</a>
			</li>
			<li id="301" class="current">
				<a href="${pageContext.request.contextPath }/e/huiyuan/modifypw.jsp?seedid=301" target="_self">密码修改</a>
			</li>
			
			
			<li id="103">
				<a href="${pageContext.request.contextPath }/e/huiyuan/modifyinfo.jsp?seedid=103" target="_self">信息修改</a>
			</li>
         
		</ul>
	</div>




</div>