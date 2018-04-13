<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>비트닷컴 쇼핑몰</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/ejs/ejs.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>
<script type="text/javascript">

$(function(){
	
	$("#submit-cart").click(function(event){
		event.preventDefault();
		var page = "${pageContext.servletContext.contextPath }/cart/add";
		$("#form-product").attr("action", page);
		$("#form-product").submit();
	});
	
});

</script>

<body style="margin:0">
<jsp:include page="/WEB-INF/views/include/head.jsp"/>
<jsp:include page="/WEB-INF/views/include/search.jsp"/>
<table width="959" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr><td height="10" colspan="2"></td></tr>
	<tr>
		<td height="100%" valign="top">
			<jsp:include page="/WEB-INF/views/include/navigation.jsp"/>
		</td>
		<td width="10"></td>
		<td valign="top">

<!-------------------------------------------------------------------------------------------->	
<!-- 시작 : 다른 웹페이지 삽입할 부분                                                       -->
<!-------------------------------------------------------------------------------------------->	

			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30"><img src="${pageContext.servletContext.contextPath }/assets/images/product_title3.gif" width="746" height="30" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>

			<!-- form2 시작  -->
			<form id='form-product' method="post" action="${pageContext.servletContext.contextPath }/cart/add">
			
				<table border="0" cellpadding="0" cellspacing="0" width="745">
					<tr>
						<td>
							<input type='hidden' name='productNo' value='${product.no }'>
						</td>
					</tr>
					<tr>
						<td width="335" align="center" valign="top">
							<!-- 상품이미지 -->
							<table border="0" cellpadding="0" cellspacing="1" width="315" height="315" bgcolor="D4D0C8">
								<tr>
									<td bgcolor="white" align="center">
										<img src="${pageContext.servletContext.contextPath }${product.picturePath}" height="315" border="0" align="absmiddle" ONCLICK="Zoomimage('0000')" STYLE="cursor:hand">
									</td>
								</tr>
							</table>
						</td>
						<td width="410 " align="center" valign="top">
							<!-- 상품명 -->
							<table border="0" cellpadding="0" cellspacing="0" width="370" class="cmfont">
								<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
								<tr>
									<td width="80" height="45" style="padding-left:10px">
										<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
										<font color="666666"><b>제품명</b></font>
									</td>
									<td width="1" bgcolor="E8E7EA"></td>
									<td style="padding-left:10px">
										<font color="282828">${product.name }</font><br>																		 
									</td>
								</tr>
								<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>							
								<!-- 판매가 -->
								<tr>
									<td width="80" height="35" style="padding-left:10px">
										<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
										<font color="666666"><b>가격</b></font>
									</td>
									<td width="1" bgcolor="E8E7EA"></td>
									<td style="padding-left:10px">
										<font color="0288DD"><b>${product.price } 원</b></font>									
									</td>
								</tr> 
								<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
								<!-- 옵션 -->
								<tr>
									<td width="80" height="35" style="padding-left:10px">
										<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
										<font color="666666"><b>사이즈</b></font>
									</td>
									<td width="1" bgcolor="E8E7EA"></td>
									<td style="padding-left:10px">									
										<select name="stockNo" class="cmfont1">
											<option value="">선택하세요</option>
											<c:forEach items='${stockList }' var='stock'>
												<option value="${stock.no }">${stock.size } (${stock.quantity })개</option>
											</c:forEach>
										</select>
									</td>
								</tr>
								<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
								<!-- 수량 -->
								<tr>
									<td width="80" height="35" style="padding-left:10px">
										<img src="${pageContext.servletContext.contextPath }/assets/images/i_dot1.gif" width="3" height="3" border="0" align="absmiddle">
										<font color="666666"><b>수량</b></font>
									</td>
									<td width="1" bgcolor="E8E7EA"></td>
									<td style="padding-left:10px">
										<input type="text" name="productQuantity" value="1" size="3" maxlength="5" class="cmfont1"> <font color="666666">개</font>
									</td>
								</tr>
								<tr><td colspan="3" bgcolor="E8E7EA"></td></tr>
							</table>
							<table border="0" cellpadding="0" cellspacing="0" width="370" class="cmfont">
								<tr>
									<td height="70" align="center">
										<!--a href="#"><img src="${pageContext.servletContext.contextPath }/assets/images/b_order.gif" border="0" align="absmiddle"></a-->
										<input id='submit-order' type='submit' value='바로 구매'>
										&nbsp;&nbsp;&nbsp;
										<input id='submit-cart' type='submit' value='장바구니'>
										<!--a href="${pageContext.servletContext.contextPath }/cart/add"><img src="${pageContext.servletContext.contextPath }/assets/images/b_cart.gif"  border="0" align="absmiddle"></a-->
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</form>
			<!-- form2 끝  -->

			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="22"></td></tr>
			</table>

			<!-- 상세설명 -->
			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746">
				<tr>
					<td height="30" align="center">
						<img src="${pageContext.servletContext.contextPath }/assets/images/product_title.gif" width="746" height="30" border="0">
					</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="746" style="font-size:9pt">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="200" valign=top style="line-height:14pt">
						본제품의 상세설명은 다음과 같습니다.
						<br>
						<br>
						<img src="${pageContext.servletContext.contextPath }${product.picturePath}">
						
					</td>
				</tr>
			</table>

		</td>
	</tr>
</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>