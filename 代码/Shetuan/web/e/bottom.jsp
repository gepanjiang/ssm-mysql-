
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="import.jsp"%>
 <div class="fn-clear"></div>

		<div class="frendlink wrap">
			<strong>友情链接：</strong>
			<%=new FriendlinkBuilder().build() %>
			 
		</div>


	
	<div class="fn-clear"></div>
	<div>
		<div id="footer_bg">
			<div id="footer">社团</div>
		</div>
	</div>

<script src="${pageContext.request.contextPath}/webui/bootstrap/js/bootstrap.js" type="text/javascript"></script>
