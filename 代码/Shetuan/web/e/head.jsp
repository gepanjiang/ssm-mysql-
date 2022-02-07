
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="import.jsp" %>
 <script type="text/javascript">
  
    $(function(){
      
      $(".exit").click(function(){
          
            var pageurl_pagescope= $("#pageurl_pagescope").val();
            
            $.ajax({
		                     
		              url:encodeURI('${pageContext.request.contextPath}/admin/huiyuanmanager.do?actiontype=exit'),
					   method:'get',
					   success:function(){
					      window.location.reload();
					  },
					  error:function(xmhttprequest,status,excetpion){
					     $.alert("系统错误，错误编码"+status);
					  }
		     })

      });
      
      $("#searchForm").submit(function(){
    		 var temtitle= $("#title").val();
    		  if(temtitle==""){
    			  
    			  alert("请输入搜索信息");
    			  return false;
    		  }
    		  
    		  
    	  });
      
      $(".main-nav .menus li a").removeClass("current");
	      var headid='<%=request.getParameter("headid")%>';
	      if (headid != '') {
	           
	     	 $("#"+headid).addClass("current");
	 	 }
    
      
      
    })

</script>
 
<%
      Huiyuan temhy=(Huiyuan)request.getSession().getAttribute("huiyuan");
      if(temhy!=null)
         request.setAttribute("huiyuan", temhy);
      
      String title=request.getParameter("title");
      if(title!=null)
    	  request.setAttribute("title", title);
      
     
   
     

 %>

 

  <div class="white-paper clearfix" style="border-bottom:#00a7d0 1px solid">
    <div class="fn-right">

        <ul class="nav nav-pills">
            <c:if test="${huiyuan!=null}">

             <li role="presentation" class="dropdown active">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                            ${huiyuan.accountname} <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li><a href="${pageContext.request.contextPath}/e/huiyuan/accountinfo.jsp">我的账户</a></li>
                        <li><a class="exit" href="#">退出</a></li>
                    </ul>
                </li>
            </c:if>
            <c:if test="${huiyuan.accountname==null}">
               <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/e/login.jsp">用户登录</a></li>
            </c:if>
            <li role="presentation"><a href="${pageContext.request.contextPath}/e/register.jsp">注册</a></li>
            <li role="presentation"> <a href="${pageContext.request.contextPath}/admin/login.jsp">系统后台</a></li>
        </ul>

    </div>
  </div>

  <div class="wrap">
        <div class="row-flow white-paper">
            <div class="wrap">
                <div style="font-size:22px; color:#188eee; font-weight: bold; width:400px; line-height:30px; font-family:tahoma, arial, Microsoft YaHei, Hiragino Sans GB; padding: 15px 10px;" class="fn-left">
                    高校社团管理系统

                </div>
                <form id="searchForm"  action="${pageContext.request.contextPath}/admin/sitesearch.do" method="post" >
                    <input   type="hidden" name="actiontype" value="find" />

                    <div class="search-box">
                        <div class="search-text">
                            <select name="searchtype" style="height:35px;width:120px;font-size:20px; ">
                                <option value="1">校园社团</option>
                                <option value="2">新闻资讯</option>

                            </select>
                        </div>
                        <div class="keyword">
                            <input type="text" placeholder="请输入标题" value="${title}" id="title" name="title">
                        </div>
                        <div class="so">
                            <input type="submit" class="sobtn" id="btnSearch" value="搜索" name="btnSearch">
                        </div>
                        <div class="error-container">

                        </div>
                    </div>

                </form>
            </div>


        </div>

    </div>

 
 
 <%=new SitenavBuilder(request).build() %>
  
     
  