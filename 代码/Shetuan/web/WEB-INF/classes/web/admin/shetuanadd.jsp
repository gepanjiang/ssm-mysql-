<%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="web" uri="/WEB-INF/webcontrol.tld"%>
<%@ include file="law.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
 <head>
  <title>社团</title>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/editor/lang/zh_CN.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/webui/jqueryui/themes/base/jquery.ui.all.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/webui/jqueryui/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script src="${pageContext.request.contextPath}/webui/jqueryui/ui/jquery-ui-timepicker-addon.js" type="text/javascript"></script>
     <link href="${pageContext.request.contextPath}/admin/css/web2table.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript">
        function initControl(){
	$("#txtCjdate").datepicker({
                         dateFormat:'yy-mm-dd'
                      }).datepicker("setDate",new Date());
			           $('#btnulTupian').uploadify({  
			                'formData': { 'folder': '${pageContext.request.contextPath}/Upload' },  
			                'buttonText': '选择图片',  
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
			          var imgtupiansrc="${requestScope.shetuan.tupian}";
				       if(imgtupiansrc==""){
				         var url="${pageContext.request.contextPath}/upload/nopic.jpg";
				         $("#imgTupian").attr("src",url);
				         $("#hidTupian").val(url);
				       }else
				       {
				          $("#imgTupian").attr("src",imgtupiansrc);
				          $("#hidTupian").val(imgtupiansrc); 
				       }
			            editor = KindEditor.create('textarea[name="des"]', {
			            uploadJson : '../plusin/upload_json.jsp',
				        fileManagerJson : '../plusin/file_manager_json.jsp',
			            resizeType: 1,
				        allowFileManager: true
				       });
                   //开始绑定
		/* $("#typename").change(function(){
			        	      $("[name=name]").val($("#typename option:selected").text());
			               })*/
                    //结束绑定
        }
        $(function ()
        {
            initControl();
            $.metadata.setType("attr","validate");
            $("#shetuanForm").validate();
        });  
    </script>
</head>
<body>
	<div class="search-title">
		<h2>新建社团</h2>
		<div class="description"></div>
	</div>
	<form name="shetuanform" method="post"
		action="${pageContext.request.contextPath}/admin/shetuanmanager.do"
		id="shetuanForm">
		<table class="grid" cellspacing="1" width="100%">
			<input type="hidden" name="id" value="${id}" />
			<input type="hidden" name="actiontype" value="${actiontype}" />
			<input type="hidden" name="seedid" value="${seedid}" />
			<input type="hidden" name="errorurl" value="/admin/shetuanadd.jsp" />
			<input type="hidden" name="forwardurl"
				value="/admin/shetuanmanager.do?actiontype=get&forwardurl=/admin/shetuanmanager.jsp" />
			<tr>
				<td colspan="4">${errormsg}</td>
			</tr>
			<tr>
				<td align="right">社团名称:</td>
				<td><input name="stname" placeholder="社团名称"
					validate="{required:true,messages:{required:'请输入社团名称'}}"
					value="${requestScope.shetuan.stname}" class="input-txt"
					type="text" id="txtStname" /></td>
			</tr>
			<tr>
				<td align="right">创建日期:</td>
				<td><input name="cjdate" value="${requestScope.shetuan.cjdate}"
					type="text" id="txtCjdate" class="input-txt"
					validate="{required:true}" /></td>
			</tr>
			<tr>
				<td align="right">成员:</td>
				<td><input name="count" placeholder="成员"
					validate="{required:true,messages:{required:'请输入成员'}}"
					value="${requestScope.shetuan.count}" class="input-txt" type="text"
					id="txtCount" /></td>
			</tr>
			<tr>
				<td align="right">社长:</td>
				<td><input name="shezhang" placeholder="社长"
					validate="{required:true,messages:{required:'请输入社长'}}"
					value="${requestScope.shetuan.shezhang}" class="input-txt"
					type="text" id="txtShezhang" /></td>
			</tr>
			<tr>
				<td align="right">海报:</td>
				<td><img id="imgTupian" width="200px" height="200px"
					src="${requestScope.shetuan.tupian}" />
					<div>
						<input type="file" name="upload" id="btnulTupian" />
					</div> <input type="hidden" id="hidTupian" name="tupian"
					value="${requestScope.shetuan.tupian}" /></td>
			</tr>
			<tr>
				<td align="right">社团分类:</td>
				<td>
				
				<input name="typename" placeholder="社团分类"
					validate="{required:true,messages:{required:'请输入社团分类'}}"
					value="${requestScope.shetuan.typename}" class="input-txt"
					type="text" />
				</td>
			</tr>
			<tr>
				<td align="right">社团介绍:</td>
				<td colspan="3"><textarea name="des" id="txtDes"
						style="width: 98%; height: 200px;">${requestScope.shetuan.des}</textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4">
					<div class="ui-button">
						<button class="ui-button-text">
							<i class="icon-ok icon-white"></i>提交
						</button>
					</div>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
