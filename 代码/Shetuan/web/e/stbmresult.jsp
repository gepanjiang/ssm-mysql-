<%@ include file="import.jsp" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>社团报名</title>
<link rel="stylesheet" href="css/index.css" type="text/css"></link>

<link rel="stylesheet" href="css/box.all.css" type="text/css"></link>

<link rel="stylesheet" href="css/register.css" type="text/css"></link>

<script
	src="${pageContext.request.contextPath}/webui/jquery/jquery-1.5.2.min.js"
	type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/e/js/jquery.iFadeSldie.js"
	type="text/javascript"></script>



</head>
<body>

	<jsp:include page="head.jsp"></jsp:include>

	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="index.jsp">首页</a> &gt;&gt; <a href="register.jsp">社团报名结果</a>
		</div>
	
		
        <div class="whitebox" style="min-height:600px;">
            <h1>
                社团报名<strong></strong></h1>
            <div class="reg-box">
                <div class="reg-title">
                  
                </div>
                <div class="msg-tip">
                    <div class="ico warning">
                    </div>
                    <div class="text">
                        <strong>你已成功报名请等待审批！</strong>
                        <a href="${pageContext.request.contextPath}/admin/stbaomingmanager.do?actiontype=get&forwardurl=/e/huiyuan/stbaomingmanager.jsp">查看报名</a>
                    </div>
                </div>
                <div class="clear">
                </div>
            </div>
        </div>
	</div>

	<div class="fn-clear"></div>


	<jsp:include page="bottom.jsp"></jsp:include>



</body>
</html>