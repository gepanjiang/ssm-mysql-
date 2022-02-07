<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="com.daowen.webcontrol.*" %>
<%@ taglib prefix="daowen" uri="/daowenpager"%>
 
<%@ include file="import.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <%
    String filter = "where state=2 ";
	//
	String typeid=request.getParameter("typeid");
	if(typeid!=null)
		filter+=" and typeid="+typeid;
	int pageindex = 1;
	int pagesize = 10;
	// 获取当前分页
	String currentpageindex = request.getParameter("currentpageindex");
	// 当前页面尺寸
	String currentpagesize = request.getParameter("pagesize");
	// 设置当前页
	if (currentpageindex != null)
		pageindex = new Integer(currentpageindex);
	// 设置当前页尺寸
	if (currentpagesize != null)
		pagesize = new Integer(currentpagesize);
	ActivityService activitySrv=BeansUtil.getBean("activityService", ActivityService.class);
	ActtypeService  acttypeSrv=BeansUtil.getBean("acttypeService", ActtypeService.class);
	List<Acttype>  listActtype =acttypeSrv.getEntity();
	if(listActtype!=null)
		request.setAttribute("listActtype", listActtype);
	List<Activity> activitylist =activitySrv.getPageEntitys(filter+" order by id desc ",pageindex, pagesize);
	int recordscount = activitySrv.getRecordCount(filter == null ? "" : filter);
	request.setAttribute("listactivity", activitylist);
	PagerMetal pm = new PagerMetal(recordscount);
	// 设置尺寸
	pm.setPagesize(pagesize);
	// 设置当前显示页
	pm.setCurpageindex(pageindex);
	// 设置分页信息
	request.setAttribute("pagermetal", pm);
    
  %>
<head>
<title>社团活动</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/index.css" type="text/css"></link>
<link rel="stylesheet" href="${pageContext.request.contextPath}/e/css/box.all.css" type="text/css"></link>

<script src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js" type="text/javascript"></script>
</head>
<body>
	<jsp:include page="head.jsp"></jsp:include>
	<div class="wrap round-block">
		<div class="line-title">
			当前位置：<a href="${pageContext.request.contextPath}/e/index.jsp">首页</a>
			&gt;&gt; 社团活动
		</div>
	
	          <div class="filter-box">
             <div class="item">
                 <div class="label">活动分类:</div>
                 <div class="content-list">
                    <ul>
                       <c:forEach var="acttype" items="${listActtype}">
                          <li>
                             <a href="${pageContext.request.contextPath}/e/activitylist.jsp?typeid=${acttype.id}">${acttype.name}</a>
                          </li>
                       </c:forEach>
                    </ul>
                 </div>
             </div>
             </div>
			  <div   class="common-picture-list">
			  
			     <ul style="min-height:600px;">
                  <% 
                    SimpleDateFormat  sdf=new SimpleDateFormat("yyyy-MM-dd");
                     if(activitylist!=null){
     	              for(Iterator it=activitylist.iterator();it.hasNext();){ 
     	                  Activity temactivity=(Activity)it.next();
     	            %>
                
                           
                         <li  class="clearfix">
                            <h3>
                                <a href="${pageContext.request.contextPath}/e/activityinfo.jsp?id=<%=temactivity.getId()%>"><%=temactivity.getTitle() %></a> 
                            </h3>
                            
                            <div class="picture-area">
                                <img src="<%=temactivity.getTupian()%>"  width="150" height="95"/>
                            </div>
                            <div class="text-area">
                                
                                 <div class="list-show-item">
									<em> <i class="fa fa-list-alt"></i>开始时间:</em> <span><%=sdf.format(temactivity.getHdbegindate()) %></span>
								 </div>
								 <div class="list-show-item">
									<em> <i class="fa fa-list-alt"></i>结束时间:</em> <span><%=sdf.format(temactivity.getHdenddate()) %></span>
								 </div>
								 <div class="list-show-item">
									<em> <i class="fa fa-list-alt"></i>要求人数:</em> <span><%=temactivity.getMaxcount() %></span>
								 </div>
                                <div class="abstract">
                                   <%=HTMLUtil.subStringInFilter(temactivity.getDcontent(), 0, 200) %>
                                   
                                   [<a href="${pageContext.request.contextPath}/e/activityinfo.jsp?id=<%=temactivity.getId()%>">详细</a>]
                                </div>
                                
                                                                                                                                                             
                            </div>
                            
                             
                    </li>
                 <%}} %>
                 
                  <c:if test="${ empty  listactivity|| fn:length(listactivity) == 0}">
				       <div style="font-size:26px;padding-left:200px;padding-top:150px;color:red;font-weight:600;">
				                           没有找到相关活动信息
				       </div>
				       
				    </c:if>
                 
                 </ul>
                
                 <form id="activityForm" method="post" action="${pageContext.request.contextPath }/e/activitylist.jsp">
                      <input type="hidden" name="actiontype" value="get" />
                      <input type="hidden" name="forwardurl" value="/e/activitylist.jsp" />
                 </form>
     	            <daowen:pager id="pager1" attcheform="activityForm" />
     	        </div>
     	       
		
	</div>
	<div class="fn-clear"></div>
	<jsp:include page="bottom.jsp"></jsp:include>
 </body>
</html>
