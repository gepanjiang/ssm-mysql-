<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>活动</title>

    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery-1.12.4.min.js"></script>
     <link href="${pageContext.request.contextPath}/webui/artDialog/skins/default.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/artDialog/jquery.artDialog.source.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/webui/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/webui/jquery/jquery.validate.min.js"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.validateex.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/jquery.metadata.js" ></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery/messages_cn.js" ></script>
   <link href="${pageContext.request.contextPath}/webui/easydropdown/themes/easydropdown.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/webui/easydropdown/jquery.easydropdown.js" type="text/javascript"></script>    
    <link href="${pageContext.request.contextPath}/uploadifyv3.1/uploadify.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/uploadifyv3.1/jquery.uploadify-3.1.js" type="text/javascript"></script>
    <script type="text/javascript"  src="${pageContext.request.contextPath}/webui/jquery-form/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
        function initControl(){
	                  $("#txtHdbegindate").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
                      $("#txtHdenddate").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
			            editor = KindEditor.create('textarea[name="dcontent"]', {
			            uploadJson : '../plusin/upload_json.jsp',
				        fileManagerJson : '../plusin/file_manager_json.jsp',
			            resizeType: 1,
				        allowFileManager: true
				       });
			           $('#btnulTupian').uploadify({  
			                'formData': { 'folder': '${pageContext.request.contextPath}/Upload' },  
			                'buttonText': '活动海报',  
			                'buttonClass': 'browser',  
			                'removeCompleted': true,  
			                'swf': '${pageContext.request.contextPath}/uploadifyv3.1/uploadify.swf', 
			                'fileTypeExts':"*.jpg;*.gif;*.png;",
			                'auto':true, 
			                'removeTimeout':0,
			                'debug': false,  
			                'height': 15,  
			                'width':90,  
			                'uploader': '${pageContext.request.contextPath}/admin/uploadmanager.do',
			                 'fileSizelimit':'2048KB',
			                 'queueSizelimit':'5',
			                 'onUploadSuccess':function(file, data, response){
			                     $("#filelist").show();
			                     $("#imgTupian").attr("src","${pageContext.request.contextPath}/upload/temp/"+file.name);
                                 $("#hidTupian").val("${pageContext.request.contextPath}/upload/temp/"+file.name);
			                  }
			             }); 
			          var imgtupiansrc="${requestScope.activity.tupian}";
				       if(imgtupiansrc==""){
				         var url="${pageContext.request.contextPath}/upload/nopic.jpg";
				         $("#imgTupian").attr("src",url);
				         $("#hidTupian").val(url);
				       }else
				       {
				          $("#imgTupian").attr("src",imgtupiansrc);
				          $("#hidTupian").val(imgtupiansrc); 
				       }
        }
        $(function ()
        {
        	$("#typeid").change(function(){
      	       $("[name=typename]").val($("#typeid option:selected").text());
             });
        	$("[name=typename]").val($("#typeid option:selected").text());
            initControl();
            $.metadata.setType("attr","validate");
            $("#activityForm").validate();
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>发布活动</h2>
		<div class="description"></div>
	</div>
	<form name="activityform" method="post"
		action="${pageContext.request.contextPath}/admin/activitymanager.do"
		id="activityForm">
		<table class="grid" cellspacing="1" width="100%">
			<input name="fqname"
				validate="{required:true,messages:{required:'请完善账户信息再进行发布活动'}}"
				value="${users.nickname}" class="input-txt" type="hidden"
				id="txtFqname" />

			<input name="fqren" placeholder="发起人"
				validate="{required:true,messages:{required:'请输入发起人'}}"
				value="${users.username}" class="input-txt" type="hidden"
				id="txtFqren" />
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="state" value="2" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl"
				value="/e/huiyuan/activityadd.jsp" />
			<input type="hidden" name="forwardurl"
				value="/admin/activitymanager.do?actiontype=get&forwardurl=/admin/activitymanager.jsp" />
			<tr>
				<td colspan="4">${errormsg}</td>
			</tr>
			<tr>
				<td align="right">标题:</td>
				<td><input name="title" placeholder="标题"
					validate="{required:true,messages:{required:'请输入标题'}}"
					value="${requestScope.activity.title}" class="input-txt"
					type="text" id="txtTitle" /></td>
				<td colspan="2" rowspan="4"><img id="imgTupian" width="200px"
					height="200px" src="${requestScope.activity.tupian}" />
					<div>
						<input type="file" name="upload" id="btnulTupian" />
					</div> <input type="hidden" id="hidTupian" name="tupian"
					value="${requestScope.activity.tupian}" /></td>
			</tr>
			<tr>
				<td align="right">活动分类:</td>
				<td><web:dropdownlist name="typeid" cssclass="dropdown"
						id="typeid" value="${requestScope.activity.typeid}"
						datasource="${typename_datasource}" textfieldname="name"
						valuefieldname="id">
					</web:dropdownlist>
					<input type="hidden" name="typename" value="${activity.typename }" />
				</td>
			</tr>
			<tr>
				<td align="right">人数:</td>
				<td><input name="maxcount"
					value="${requestScope.activity.maxcount}" type="text"
					 class="input-txt" validate="{required:true,digits:true,messages:{required:'请输入人数',digits:'请输入正确的人数'}}" />
				</td>
			</tr>
			<tr>
				<td align="right">活动开始时间:</td>
				<td><input name="hdbegindate"
					value="${requestScope.activity.hdbegindate}" type="text"
					id="txtHdbegindate" class="input-txt" validate="{required:true}" />
				</td>
			</tr>
			<tr>
				<td align="right">活动结束日期:</td>
				<td><input name="hdenddate"
					value="${requestScope.activity.hdenddate}" type="text"
					id="txtHdenddate" class="input-txt" validate="{required:true}" />
				</td>
			</tr>



			<tr>
				<td align="right">活动内容:</td>
				<td colspan="3"><textarea name="dcontent" id="txtDcontent"
						style="width:98%;height:400px;">${requestScope.activity.dcontent}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					
						<button class="orange-button">
							<i class="fa fa-check"></i>提交
						</button>
					
				</td>
			</tr>
		</table>
	</form>

</body>
</html>
