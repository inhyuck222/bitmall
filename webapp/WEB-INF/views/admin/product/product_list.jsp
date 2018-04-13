<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/ejs/ejs.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<script type="text/javascript">
$(function(){
	var deleteDialog = $("#dialog-delete-product").dialog({
		autoOpen: false, 
		height: 300, 
		width: 350, 
		model: true,
		buttons: {
			"확인": function(){
				
				var no = deleteDialog.productNo;
				var tr = deleteDialog.parentTr;
				
				$.ajax({
					url: "/bitmall/api/admin/product/delete", 
					type: "get", 
					dataType: "json", 
					data: "no=" + no, 
					success: function(response){
						
						if(response.result == "fail"){
							console.log(response.message);							
							$(".validateTips.error").show();
							deleteDialog.dialog("close");
							return;
						}

						$(tr).remove();
						
						/*
						var length = $("#faq-list-table tr").length;
						
						$("#faq-list-table #faq-num").each(function(index){
							$(this).text(length - index - 1);
						});
						*/
						
						deleteDialog.dialog("close");						
					}
				});
			}, 
			"취소": function(){
				
				deleteDialog.dialog("close");
			}
		}, 
		close: function(){
			
			$("#dialog-delete-faq p").html();
			$(".validateTips.error").hide();
		}
	});
	
	$(document).on("click", "#delete-product-btn", function(event){
		event.preventDefault();
		
		var no = $(this).data("no");
		var name = $(this).data("name");
		var trElement = $(this).closest("#product-list-item");
		var message = "\"" + name + "\"" + "<br/><br/>삭제 하시겠습니까?";
		
		$("#dialog-delete-product p").html(message);
		
		deleteDialog.productNo = no;
		deleteDialog.parentTr = trElement;		
		deleteDialog.dialog("open");
	});
	
});

	
</script>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<br>
	<jsp:include page="/WEB-INF/views/admin/include/admin-menu.jsp"/>
	<hr width='900' size='3'>
	<form name="form1" method="get" action="">
	<table width="800" border="0" cellspacing="0" cellpadding="0">
		<tr height="40">
			<td align="left"  width="150" valign="bottom">&nbsp 제품수 : <font color="#FF0000">20</font></td>
			<td align="right" width="550" valign="bottom">
				<select name="sel1">
					<option value="0" >상품상태</option>
					<option value="1" >판매중</option>
					<option value="2" >판매중지</option>
					<option value="3" >품절</option>
				</select> &nbsp 
				<select name="sel2">
					<option value="0" >아이콘선택</option>
					<option value="1" >New</option>
					<option value="2" >Hit</option>
					<option value="3" >Sale</option>
				</select> &nbsp 
				<select name="sel3">
					<option value="0" >분류선택</option>
					<option value="1" >바지</option>
					<option value="2" >코트</option>
					<option value="3" >브라우스</option>
				</select> &nbsp 
				<select name="sel4">
					<option value="1" selected>제품이름</option>
					<option value="2" >제품번호</option>
				</select>
				<input type="text" name="text1" size="10" value="">&nbsp
			</td>
			<td align="left" width="120" valign="bottom">
				<input type="submit" value="검색">
				&nbsp;
				<a href="${pageContext.servletContext.contextPath }/admin/product/add"><input type="button" value="상품 등록"></a>
			</td>
		</tr>
		<tr><td height="5"></td></tr>
	</table>
	</form>
	
	<table width="800" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
		<tr bgcolor="#CCCCCC" height="23"> 
			<td width="100" align="center">제품분류</td>
			<td width="280" align="center">제품명</td>
			<td width="70"  align="center">판매가</td>		
			<td width="80"  align="center">수정/삭제</td>
		</tr>
	
		<c:forEach items='${productMapList }' var='product'>
			<tr id='product-list-item' bgcolor="#F2F2F2" height="23">
				<td width="100">${product.categoryName }</td>
				<td width="280">${product.name }</td>
				<td width="70"  align="right">${product.price }</td>	
				<td width="80"  align="center">
					<a href="${pageContext.servletContext.contextPath }/admin/product/edit">수정</a>/
					<a id='delete-product-btn' href="#" data-no='${product.no }' data-name='${product.name }'>삭제</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<br>
	<table width="800" border="0" cellpadding="0" cellspacing="0">
		<tr>
			<td height="30" class="cmfont" align="center">
				<img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_prev.gif" align="absmiddle" border="0"> 
				<font color="#FC0504"><b>1</b></font>&nbsp;
				<a href="product.jsp?page=2&sel1=&sel2=&sel3=&sel4=&text1="><font color="#7C7A77">[2]</font></a>&nbsp;
				<a href="product.jsp?page=3&sel1=&sel2=&sel3=&sel4=&text1="><font color="#7C7A77">[3]</font></a>&nbsp;
				<img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_next.gif" align="absmiddle" border="0">
			</td>
		</tr>
	</table>

	<div id="dialog-delete-product" title="삭제 확인" style="display:none">
		<p></p>
		<p class='validateTips error' style='display:none'>삭제 실패 입니다. 다시 입력해주세요.</p>
	</div>
</body>
</html>