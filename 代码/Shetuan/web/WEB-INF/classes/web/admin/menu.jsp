<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- sidebar menu: : style can be found in sidebar.less -->
<ul class="sidebar-menu" data-widget="tree">
    <li class="header">系统菜单</li>

   <c:if test="${users.rolename=='社团管理员'}">
    <li class="treeview">
        <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>社团事务</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
        </a>
        <ul class="treeview-menu">


            <li>
                <a target="main" href="${pageContext.request.contextPath}/admin/shetuanmanager.do?actiontype=get">
                    <i class="fa fa-navicon"></i>
                    社团管理</a>
            </li>

            <li>
                <a target="main" href="${pageContext.request.contextPath}/admin/chengyuantongji.jsp">
                    <i class="fa fa-navicon"></i>
                    社团人数统计</a>
            </li>


            <li>
                <a target="main"
                   href="${pageContext.request.contextPath}/admin/stchengyuanmanager.do?actiontype=get&forwardurl=/admin/stchengyuansp.jsp">
                    <i class="fa fa-navicon"></i>
                    社团报名审批</a>
            </li>


            <li>
                <a target="main" href="${pageContext.request.contextPath}/admin/activitymanager.do?actiontype=get">
                    <i class="fa fa-plus"></i>
                    社团活动管理</a>
            </li>

            <li>
                <a target="main" href="${pageContext.request.contextPath}/admin/activitymanager.do?actiontype=load">
                    <i class="fa fa-plus"></i>
                    发布活动</a>
            </li>

            <li>
                <a target="main" href="${pageContext.request.contextPath}/admin/acttypemanager.do?actiontype=get">
                    <i class="fa fa-plus"></i>
                    活动分类管理</a>
            </li>


        </ul>
    </li>


    <li class="treeview">
        <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>新闻资讯</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
        </a>
        <ul class="treeview-menu">


            <li><a target="main"
                   href="${pageContext.request.contextPath}/admin/xinximanager.do?actiontype=get">
                <i class="fa fa-navicon"></i> 新闻资讯管理
            </a></li>
            <li><a target="main"
                   href="${pageContext.request.contextPath}/admin/xinximanager.do?actiontype=load">

                <i class="fa fa-plus"></i>发布新闻资讯
            </a></li>
            <li><a target="main"
                   href="${pageContext.request.contextPath}/admin/noticemanager.do?actiontype=get">
                <i class="fa fa-list"></i> 系统公告管理
            </a></li>
            <li><a target="main"
                   href="${pageContext.request.contextPath}/admin/lanmumanager.do?actiontype=get">
                <i class="fa fa-navicon"></i>新闻栏目管理
            </a></li>

            <li><a target="main"
                   href="${pageContext.request.contextPath}/admin/lanmumanager.do?actiontype=load&parentid=0">
                <i class="fa fa-plus"></i>添加新闻栏目
            </a></li>


        </ul>
    </li>
   </c:if>
    <c:if test="${users.rolename=='系统管理员'}">

    <li class="treeview">
        <a href="#">
            <i class="fa fa-cog"></i>
            <span>网站设置</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
        </a>
        <ul class="treeview-menu">

            <li>
                <a target="main" href="${pageContext.request.contextPath}/admin/sitenavmanager.do?actiontype=get">
                    <i class="fa fa-navicon"></i>网站导航管理</a>
            </li>
            <li>
                <a target="main" href="${pageContext.request.contextPath}/admin/indexcolumnsmanager.do?actiontype=get">
                    <i class="fa fa-navicon"></i>首页栏目管理</a>
            </li>

            <li>
                <a target="main" href="${pageContext.request.contextPath}/admin/jiaodiantumanager.do?actiontype=get">
                    <i class="fa fa-bullhorn"></i>
                    首页轮播图管理</a>
            </li>

            <li>
                <a target="main" href="${pageContext.request.contextPath}/admin/friendlinkmanager.do?actiontype=get">
                    <i class="fa fa-navicon"></i>友情链接管理</a>
            </li>


            <li>
                <a target="main" href="${pageContext.request.contextPath}/admin/commentmanager.do?actiontype=get">
                    <i class="fa fa-navicon"></i>会员评论管理</a>
            </li>
            <li>
                <a target="main" href="${pageContext.request.contextPath}/admin/sysconfigmanager.do?actiontype=get">
                    <i class="fa fa-navicon"></i>网站介绍</a>
            </li>

        </ul>
    </li>
    <li class="treeview">
        <a href="#">
            <i class="fa fa-laptop"></i>
            <span>用户管理</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
        </a>
        <ul class="treeview-menu">

            <li>
                <a target="main" href="${pageContext.request.contextPath}/admin/huiyuanmanager.do?actiontype=get"><i
                        class="fa fa-male"></i>会员管理</a>
            </li>

            <li>
                <a target="main" href="${pageContext.request.contextPath}/admin/usersmanager.do?actiontype=get"><i
                        class="fa fa-user"></i>后台用户管理</a>
            </li>
            <li>
                <a target="main" href="${pageContext.request.contextPath}/admin/usersmanager.do?actiontype=load"><i
                        class="fa fa-plus"></i>新增后台用户</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/modifypw.jsp"
                   target="main"><i class="fa fa-lock"></i>修改密码</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/accountinfo.jsp"
                   target="main"><i class="fa fa-info"></i>我的账户信息</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/admin/modifyinfo.jsp"
                   target="main"><i class="fa fa-share-alt-square"></i>修改账户信息</a>
            </li>
        </ul>
    </li>
    </c:if>
</ul>
