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
</head>

<script type="text/javascript">
var ejsSizeOptionTag = new EJS({
	url : "${pageContext.request.contextPath }/assets/js/ejs/template/sizeOptionTag.ejs",
});

var ejsNoneFreeSizeOptionTag = new EJS({
	url : "${pageContext.request.contextPath }/assets/js/ejs/template/noneFreeSizeOptionTag.ejs",
});

var ejsFreeSizeOptionTag = new EJS({
	url : "${pageContext.request.contextPath }/assets/js/ejs/template/freeSizeOptionTag.ejs",
});

var recentSizeOptionHTML;

$(function(){
	
	$("input[type=radio][name=size-option-radio]").change(function(){
		
		var html;
		
		if ($(this).val() == "none-free-Size") {
			html = ejsNoneFreeSizeOptionTag.render();			
		}else if ($(this).val() == "free-Size") {
			html = ejsFreeSizeOptionTag.render();
		}else {
			return;
		}
		$("#option-size").remove();
		$(html).insertAfter("#size-option-select");
	});
	
	$(document).on("click", "#btn-delete-size", function(event){
		event.preventDefault();
		$(this).closest("#option-none-free-size").remove();
	});
	
	$(document).on("click", "#btn-add-size", function(event){
		event.preventDefault();
		var html = ejsSizeOptionTag.render();
		$(this).closest("#option-none-free-size").append(html);
	});
});

</script>

<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/admin/include/admin-menu.jsp"/>
<hr width='900' size='3'>
<form id='form-product-regist' action='${pageContext.servletContext.contextPath }/admin/product/add' method='post' enctype="multipart/form-data">
	
	<table width="800" border="1" cellspacing="0" cellpadding="3" bordercolordark="white" bordercolorlight="black">
		<tr height="23"> 
			<td width="100" bgcolor="#CCCCCC" align="center">상품분류</td>
	    <td width="700" bgcolor="#F2F2F2">
				<select name="categoryNo">
					<c:forEach items='${categoryList }' var='category' varStatus='status'>
						<option value='${category.no }' >${category.name }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr> 
			<td width="100" bgcolor="#CCCCCC" align="center">상품명</td>
			<td width="700" bgcolor="#F2F2F2">
				<input type="text" name="name" value="" size="60" maxlength="60">
			</td>
		</tr>
		<tr> 
			<td width="100" bgcolor="#CCCCCC" align="center">판매가</td>
			<td width="700" bgcolor="#F2F2F2">
				<input type="text" name="price" value="" size="12" maxlength="12"> 원
			</td>
		</tr>
		<tr id='size-option-select'> 
			<td width="100" bgcolor="#CCCCCC" align="center">사이즈</td>
		    <td width="700" bgcolor="#F2F2F2">
				<div>
					<input type='radio' name='size-option-radio' value='none-free-Size'><label>None Free Size</label>
					<input type='radio' name='size-option-radio' value='free-Size'><label>Free Size</label>
				</div>
			</td>
		</tr>		
		<tr id='option-size'> 
			<td width="100" bgcolor="#CCCCCC" align="center">재고</td>
			<td width="700" bgcolor="#F2F2F2">
				<div id='option-none-free-size'>
					<select name="size">
						<option value='XS' >XS</option>
						<option value='S' >S</option>
						<option value='M' >M</option>
						<option value='L' >L</option>
						<option value='XL' >XL</option>
						<option value='XXL' >XXL</option>
					</select>
					<input type='number' name='quantity'><label>개</label>
					<button id='btn-add-size'>+</button>
					<button id='btn-delete-size'>-</button><br/>
				</div>			
			</td>
		</tr>		
		<tr>
			<td width="100" bgcolor="#CCCCCC" align="center">이미지</td>
			<td width="700" bgcolor="#F2F2F2">
				<b>이미지1</b>: <input type="file" name="picture" size="30" value="찾아보기"><br>
			</td>
		</tr>
	</table>
	<br>
	<table width="800" border="0" cellspacing="0" cellpadding="7">
		<tr> 
			<td align="center">
				<input id='submit-product' type="submit" value="등록하기"> &nbsp;&nbsp
				<a href="${pageContext.servletContext.contextPath }/admin/product"><input type="button" value="이전화면"></a>
			</td>
		</tr>
	</table>
</form>

</body>
</html>
