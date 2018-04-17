<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>비트닷컴 쇼핑몰</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">	
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/ejs/ejs.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<script type="text/javascript">
var deliveryCharge = 2500;
var setPaymentAmount = function(){
	var totalAmount = 0;
	var loadTotalPrice = $("font[id='amount-products']").each(function(index, o){
		totalAmount += parseInt($(o).text());
	});
	var paymentAmount = totalAmount + deliveryCharge;
	
	$("#total-amount").text(totalAmount);
	$("#payment-amount").text(paymentAmount);	
	$("#all-amount").val(paymentAmount);
}

$(function(){
	
	setPaymentAmount();
	
	$("input[type=radio][name=same-info]").change(function(event){
		event.preventDefault();
		var sameInfo = $(this).val();
		
		if(sameInfo == "yes") {
			$("#r-name").val($("#name").val());
			$("#r-address").val($("#address").val());
			$("#r-phone").val($("#phone").val());
		} else if(sameInfo == "no") {
			$("#r-name").val("");
			$("#r-address").val("");
			$("#r-phone").val("");
		}
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
			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30" align="center"><img src="${pageContext.servletContext.contextPath }/assets/images/jumun_title.gif" width="746" height="30" border="0"></td>
				</tr>
				<tr><td height="13"></td></tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0" width="710">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/order_title1.gif" width="65" height="15" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>

			<table border="0" cellpadding="5" cellspacing="1" width="710" class="cmfont" bgcolor="#CCCCCC">
				<tr bgcolor="F0F0F0" height="23" class="cmfont">
					<td width="440" align="center">상품</td>
					<td width="70"  align="center">수량</td>
					<td width="100" align="center">가격</td>
					<td width="100" align="center">합계</td>
				</tr>
					<c:forEach items='${cartInfoList }' var='cartInfo'>
						<tr id='cart-list-table-item'>
							<td height="60" align="center" bgcolor="#FFFFFF">
								<table cellpadding="0" cellspacing="0" width="100%">
									<tr>
										<td width="60">
											<a href="${pageContext.servletContext.contextPath }/product/${cartInfo.categoryNo }/${cartInfo.productNo }">
												<img src="${pageContext.servletContext.contextPath }${cartInfo.picturePath }" width="50" height="50" border="0">
											</a>
										</td>
										<td class="cmfont">
											<a href="product_detail.jsp?product_num=0000">${cartInfo.productName }</a><br>
											<font color="#0066CC">[사이즈 : ${cartInfo.size }]</font>												
										</td>
									</tr>
								</table>
							</td>
							<td align="center" bgcolor="#FFFFFF">
								<font color="#464646">${cartInfo.quantity }개</font>
							</td>
							<td align="center" bgcolor="#FFFFFF">
								<font id='price-product' color="#464646">${cartInfo.price }</font>
							</td>
							<td align="center" bgcolor="#FFFFFF">
								<font id='amount-products' color="#464646">${cartInfo.amount }</font>
								<input id='input-product-no' type="hidden" value="${cartInfo.productNo }">
								<input id='input-size-origin' type="hidden" value="${cartInfo.size }">
								<input id='input-quantity-origin' type="hidden" size="3" value="${cartInfo.quantity }">	
							</td>
						</tr>
					</c:forEach>			
				<tr>
					<td colspan="5" bgcolor="#F0F0F0">
						<table width="100%" border="0" cellpadding="0" cellspacing="0" class="cmfont">
							<tr>
								<td bgcolor="#F0F0F0"><img src="${pageContext.servletContext.contextPath }/assets/images/cart_image1.gif" border="0"></td>
								<td align="right" bgcolor="#F0F0F0">
									<font color="#0066CC">총 합계금액</font>
										 : 상품대금(<label id='total-amount'></label>) + 배송료(2,500원) = 
									<font color="#FF3333"><b id='payment-amount'></b></font>&nbsp;&nbsp									
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<br><br>

			<!-- 주문자 정보 -->
			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
			</table>

			<!-- form2 시작  -->
			<form:form 
				modelAttribute="userVo" 
				name="order" 
				method="post" 
				action="${pageContext.servletContext.contextPath }/order/pay">
				<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
					<tr>
						<td align="left" valign="top" width="150" STYLE="padding-left:45;padding-top:5">
							<input id='all-amount' type="hidden" name="amount" value="">
							<font size="2" color="#B90319"><b>주문자 정보</b></font>
						</td>
						<td align="center" width="560">
	
							<table width="560" border="0" cellpadding="0" cellspacing="0" class="cmfont">
								<tr height="25">
									<td width="150"><b>주문자 성명</b></td>
									<td width="20"><b>:</b></td>
									<td width="390">
										<form:input path="name" id='name' size="20" maxlength="10" value="${authUser.name }" class="cmfont1"/>
									</td>
								</tr>
								<tr height="25">
									<td width="150"><b>전화 번호</b></td>
									<td width="20"><b>:</b></td>
									<td width="390">
										<form:input path="phone" id='phone' size="20" maxlength="20" value="${authUser.phone }" class="cmfont1"/>
									</td>
								</tr>
								<tr height="25">
									<td width="150"><b>E-Mail</b></td>
									<td width="20"><b>:</b></td>
									<td width="390">
										<form:input path="email" id='email' size="50" maxlength="50" value="${authUser.email }" class="cmfont1"/>
									</td>
								</tr>
								<tr height="50">
									<td width="150"><b>주소</b></td>
									<td width="20"><b>:</b></td>
									<td width="390">
										<form:input path="address" id='address' size="50" maxlength="200" value="${authUser.address }" class="cmfont1" /><br>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr height="10"><td></td></tr>
				</table>
	
				<!-- 배송지 정보 -->
				<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
					<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
					<tr height="10"><td></td></tr>
				</table>
	
				<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
					<tr>
						<td align="left" valign="top" width="150" STYLE="padding-left:45;padding-top:5"><font size=2 color="#B90319"><b>배송지 정보</b></font></td>
						<td align="center" width="560">
	
							<table width="560" border="0" cellpadding="0" cellspacing="0" class="cmfont">
								<tr height="25">
									<td width="150"><b>주문자정보와 동일</b></td>
									<td width="20"><b>:</b></td>
									<td width="390">
										<input type="radio" name="same-info" value="yes">예 &nbsp;
										<input type="radio" name="same-info" value="no">아니오
									</td>
								</tr>
								<tr height="25">
									<td width="150"><b>받으실 분 성명</b></td>
									<td width="20"><b>:</b></td>
									<td width="390">
										<input type="text" id='r-name' name="recipientName" size="20" maxlength="10" value="" class="cmfont1">
									</td>
								</tr>
								<tr height="25">
									<td width="150"><b>전화번호</b></td>
									<td width="20"><b>:</b></td>
									<td width="390">
										<input type="text" id='r-phone' name="recipientPhone" size="20" maxlength="15" value="" class="cmfont1">
									</td>
								</tr>
								<tr height="50">
									<td width="150"><b>주소</b></td>
									<td width="20"><b>:</b></td>
									<td width="390">
										<input type="text" id='r-address' name="recipientAddress" size="50" maxlength="200" value="" class="cmfont1"><br>
									</td>
								</tr>
								<tr height="50">
									<td width="150"><b>배송시요구사항</b></td>
									<td width="20"><b>:</b></td>
									<td width="390">
										<textarea name="requirements" cols="50" rows="3" class="cmfont1"></textarea>
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr height="10"><td></td></tr>
				</table>
	
				<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
					<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
					<tr height="10"><td></td></tr>
				</table>
	
				<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
					<tr>
						<td align="center">
							<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/b_order3.gif">
						</td>
					</tr>
					<tr height="20"><td></td></tr>
				</table>
			
			</form:form>
		</td>
	</tr>
</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>