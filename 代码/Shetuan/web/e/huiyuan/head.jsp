
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@ include file="law.jsp" %>
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

            <li class="active" role="presentation"><a href="${pageContext.request.contextPath}/e/register.jsp">注册</a></li>
            <li role="presentation"> <a href="${pageContext.request.contextPath}/admin/login.jsp">系统后台</a></li>
        </ul>

    </div>
</div>

        <div class="wrap white-paper">
            <div style="font-size:22px; color:#188eee; font-weight: bold; width:400px; line-height:30px; font-family:tahoma, arial, Microsoft YaHei, Hiragino Sans GB; padding: 15px 10px;" >
                高校社团管理系统

            </div>

        </div>




  