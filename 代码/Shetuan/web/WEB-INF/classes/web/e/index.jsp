<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="import.jsp" %>
<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>系统首页</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link href="${pageContext.request.contextPath}/e/css/box.all.css"  rel="stylesheet" type="text/css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/e/css/carousel.css" />
<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
<script type='text/javascript' src='${pageContext.request.contextPath}/e/js/carousel.js'></script>
    <script type="text/javascript">
        $(function () {


          

        });
    </script>

</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>
	 <div class="fn-clear"></div>
	
	
    
	 <div class="wrap round-block">
	     <div class="forum-cate">
	        <div class="sidebar fn-left"
			style="height:316px; width:252px; padding-right: 0px; background: #fff;">
			<h3>系统公告</h3>
			<%=new NoticeBuilder().build() %>

		</div>
	     </div>
	     <div class="focus-right">
	          <%=new FocusgraphicBuilder().buildFullScreen()%>
	     </div>
	 </div>
   <div class="fn-clear"></div>
	
	
    
    <div class="wrap round-block">
    
       <%
				    ActivityUibuilder activityuibuilder=new ActivityUibuilder("box");
			    %>
				<!-- 活动 -->
				<%=activityuibuilder.buildImageLanmu("", 5, "社团活动") %>
    </div>
	

	<div class="fn-clear"></div>
	
	<div class="wrap round-block ">
     
	   
         <%=new IndexcolumnsBuilder().buildColumns() %>

		
	 
	</div>
	
	
	<div class="wrap round-block ">
     
	   
         <%=new IndexcolumnsBuilder().buildImageColumns(10) %>

		
	 
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>