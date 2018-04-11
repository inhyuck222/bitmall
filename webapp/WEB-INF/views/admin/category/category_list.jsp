<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>쇼핑몰 관리자 홈페이지</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="${pageContext.servletContext.contextPath }/assets/css/font.css"	rel="stylesheet" type="text/css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/ejs/ejs.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<script>
var ejsFaQListItem = new EJS({
	url : "${pageContext.request.contextPath }/assets/js/ejs/template/categoryListItem.ejs",
});

$(function(){
	
	var deleteDialog = $("#dialog-delete-category").dialog({
		autoOpen: false, 
		height: 300, 
		width: 350, 
		model: true,
		buttons: {
			"확인": function(){
				
				var no = deleteDialog.categoryNo;
				var tr = deleteDialog.parentTr;
				
				$.ajax({
					url: "/bitmall/api/admin/category/delete", 
					type: "get", 
					dataType: "json", 
					data: "no=" + no, 
					success: function(response){
						
						
						
						if(response.result == "fail"){
							console.log(response.message)
							$(".validateTips.error").show();
							return;
						}

						$(tr).remove();
						
						var length = $("#category-list-table tr").length;
						
						$("#category-list-table #category-num").each(function(index){
							$(this).text(length - index - 1);
						});
						
						deleteDialog.dialog("close");						
					}
				});
			}, 
			"취소": function(){
				
				deleteDialog.dialog("close");
			}
		}, 
		close: function(){
			
			$("#dialog-delete-category p").html();
			$(".validateTips.error").hide();
		}
	});
	
	$(document).on("click", "#delete-category", function(event){
		
		event.preventDefault();
		
		var no = $(this).data("no");
		var trElement = $(this).closest("#category-list-table-item");
		var message = $(this).data("name");
		message = "\"" + message + "\"";
		message += "<br/><br/>삭제 하시겠습니까?"
				
		$("#dialog-delete-category p").html(message);
		
		deleteDialog.categoryNo = no;
		deleteDialog.parentTr = trElement;
		deleteDialog.dialog("open");
	});
	
	var updateDialog = $("#dialog-update-category").dialog({
		autoOpen: false, 
		height: 400, 
		width: 600, 
		modal: true, 
		buttons: {
			"수정": function(){
				
				var data = {};
				$.each($("#dialog-update-category-form").serializeArray(), function(index, values){
					
					data[values.name] = values.value;
				});
				data.no = $("#update-hidden-no").val();
				
				$.ajax({
					url: "/bitmall/api/admin/category/update", 
					type: "post",
					dataType: "json", 
					data: JSON.stringify(data), 
					contentType: "application/json", 
					success: function(response) {
						
						if(response.result == "fail") {
							console.log(response.message)
							$(".validateTips.error").show();
							return;
						}

						var trElement = updateDialog.parentSelected;						
						$(trElement).find("#category-name").text(response.data.name);
						$(trElement).find("#update-category").data("name", response.data.name);
						$(trElement).find("#delete-category").data("name", response.data.name);
						
						updateDialog.dialog("close");
					}
				});
			}
		}, 
		close: function() {
			
			console.log("update closed called");
			$(".validateTips.error").hide();
		}
	});

	$(document).on("click", "#update-category", function(event){
		
		event.preventDefault();
		
		var no = $(this).data("no");
		var name = $(this).data("name");
		$("#update-hidden-no").val(no);
		$("#update-category-name").val(name);		
		
		updateDialog.parentSelected = $(this).closest("tr");		
		updateDialog.dialog("open");
	});
	
	var addDialog = $( "#dialog-add-category" ).dialog({
		autoOpen: false, 
		height: 200, 
		width: 250, 
		modal: true, 
		buttons: {
			"등록": function(){
				
				var data = {};				
				
				$.each($("#dialog-add-category-form").serializeArray(), function(index, values){
					data[values.name] = values.value;
				});
				//console.log(data);
				
				//ajax 통신
				$.ajax({
					url: "/bitmall/api/admin/category/add", 
					type: "post",
					dataType: "json", 
					contentType: "application/json", 
					data: JSON.stringify(data), 
					success: function(response) {
						
						if(response.result == "fail") {
							console.log(response.message);
							return;
						}
						
						if(response.data == -1) {
							$(".validateTips.error").show();
							$("#add-category-name").val("");
							return;
						}

						var length = $("#category-list-table tr").length;
						response.data.index = length;
						//console.log(response.data);
						
						var html = ejsFaQListItem.render(response.data);
						
						$(html).insertAfter("#category-list-table-header");						
						$("#category-list-table #category-num").each(function(index){
							$(this).text(length - index);
						});
						
						addDialog.dialog("close");
					}
				});
			},
			"취소": function() {
				
				addDialog.dialog( "close" );
			}
		},
		close: function() {
			
			console.log("closed called")
			$("#add-category-name").val("");
			$(".validateTips.error").hide();
		}
	});
	
	$("#add-btn").click( function(event) {
		
		event.preventDefault();	
		addDialog.dialog("open");
	});
	
});
</script>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<c:set var="count" value="${fn:length(categoryList) }"/>
	
	<br>
	<jsp:include page="/WEB-INF/views/admin/include/admin-menu.jsp" />
	<hr width='900' size='3'>
	<table width="600" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td align="left" height="50" valign="bottom">&nbsp 카테고리수 : <font color="#FF0000">${count }</font></td>
			<td align="right" height="50" valign="bottom">
				<a href="#"><input id='add-btn' type="button" value="신규입력"></a>&nbsp
			</td>
		</tr>
		<tr>
			<td height="5" colspan="2"></td>
		</tr>
	</table>

	<table id='category-list-table' width="600" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
		<tr id='category-list-table-header' bgcolor="#CCCCCC" height="20">
			<td width="50" align="center"><font color="#142712">번호</font></td>
			<td width="450" align="center"><font color="#142712">카테고리명</font></td>
			<td width="100" align="center"><font color="#142712">수정</font></td>
			<td width="100" align="center"><font color="#142712">삭제</font></td>
		</tr>

		<c:forEach items='${categoryList }' var='category' varStatus='status'>
			<tr id='category-list-table-item' bgcolor="#F2F2F2" height="20">
				<td id='category-num' width="50" align="center">${count - status.index }</td>
				<td id='category-name' width="450" align="left">${category.name }</td>
				<td width="100" align="center"><a id='update-category' href='#' data-no='${category.no }' data-name='${category.name }'>수정</a></td>
				<td width="100" align="center"><a id='delete-category' href='#' data-no='${category.no }' data-name='${category.name }'>삭제</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	
	<div id='dialog-add-category' title='신규 카테고리 입력' style='display:none'>		
		<form id='dialog-add-category-form'>
			<input type='text' id='add-category-name' name='name' value=''>
		</form>
		<p class='validateTips error' style='display:none'>입력 실패 입니다. 다시 입력해주세요.</p>
	</div>
	
	<div id='dialog-update-category' title='카테고리 수정' style='display:none'>		
		<form id='dialog-update-category-form'>
			<input id='update-hidden-no' type='hidden' value='' > 
			<input type='text' id='update-category-name' name='name' value=''>
		</form>
		<p class='validateTips error' style='display:none'>입력 실패 입니다. 다시 입력해주세요.</p>
	</div>
	
	<div id="dialog-delete-category" title="삭제 확인" style="display:none">
		<p></p>
	</div>
	
</body>
</html>
