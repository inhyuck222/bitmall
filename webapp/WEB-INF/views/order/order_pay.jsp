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

			<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
				<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
			</table>
			<br><br>
			<br><br>
			
			<!-- form2 시작  -->
			<form name="form2" method="post" action="${pageContext.servletContext.contextPath }/order/success">

				<input id='all-amount' type="hidden" name="amount" value="">

				<input type="hidden" name="name"   value="${orderUser.name }">
				<input type="hidden" name="phone"    value="${orderUser.phone }">
				<input type="hidden" name="address"  value="${orderUser.address }">
				<input type="hidden" name="email"  value="${orderUser.email }">
	
				<input type="hidden" name="recipientName"   value="${orderVo.recipientName }">
				<input type="hidden" name="recipientPhone"    value="${orderVo.recipientPhone }">
				<input type="hidden" name="recipientAddress"  value="${orderVo.recipientAddress }">
				<input type="hidden" name="requirements"  value="${orderVo.requirements }">			
	
				<!-- 결재방법 선택 및 입력 -->
				<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
					<tr height="3" bgcolor="#CCCCCC"><td></td></tr>
					<tr height="10"><td></td></tr>
				</table>

				<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
					<tr>
						<td align="left" valign="top" width="150" STYLE="padding-left:45;padding-top:5"><font size=2 color="#B90319"><b>결재방법</b></font></td>
						<td align="center" width="560">
	
							<table width="560" border="0" cellpadding="0" cellspacing="0" class="cmfont">
								<tr height="25">
									<td width="150"><b>결재방법 선택</b></td>
									<td width="20"><b>:</b></td>
									<td width="390">
										<input type="radio" name="payment" value="card">카드 &nbsp;
										<input type="radio" name="payment" value="bankBook">무통장
									</td>
								</tr>
							</table>
	
						</td>
					</tr>
					<tr height="10"><td></td></tr>
				</table>
	
				<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
					<tr height="1" bgcolor="#CCCCCC"><td></td></tr>
					<tr height="10"><td></td></tr>
				</table>
				<!-- 카드 -->
				<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
					<tr>
						<td align="left" valign="top" width="150" STYLE="padding-left:45;padding-top:5"><font size=2 color="#B90319"><b>카드</b></font></td>
						<td align="center" width="560">
							<table width="560" border="0" cellpadding="0" cellspacing="0" class="cmfont">
								<tr height="25">
									<td width="150"><b>카드종류</b></td>
									<td width="20"><b>:</b></td>
									<td width="390">
										<select name="card_kind" class="cmfont1">
											<option value="">카드종류를 선택하세요.</option>
											<option value="1">국민카드</option>
											<option value="2">신한카드</option>
											<option value="3">우리카드</option>
											<option value="4">하나카드</option>
										</select>
									</td>
								</tr>
								<tr height="25">
									<td width="150"><b>카드번호</b></td>
									<td width="20"><b>:</b></td>
									<td width="390">
										<input type="text" name="card_no1" size="4" maxlength="4" value="" class="cmfont1"> -
										<input type="text" name="card_no2" size="4" maxlength="4" value="" class="cmfont1"> -
										<input type="text" name="card_no3" size="4" maxlength="4" value="" class="cmfont1"> -
										<input type="text" name="card_no4" size="4" maxlength="4" value="" class="cmfont1">
									</td>
								</tr>
								<tr height="25">
									<td width="150"><b>카드기간</b></td>
									<td width="20"><b>:</b></td>
									<td width="390">
										<input type="text" name="card_month" size="2" maxlength="2" value="" class="cmfont1"> 월 / 
										<input type="text" name="card_year"  size="2" maxlength="2" value="" class="cmfont1"> 년
									</td>
								</tr>
								<tr height="25">
									<td width="150"><b>카드비밀번호(뒷2자리)</b></td>
									<td width="20"><b>:</b></td>
									<td width="390">
										**<input type="password" name="card_pw" size="2" maxlength="2" value="" class="cmfont1">
									</td>
								</tr>
								<tr height="25">
									<td width="150"><b>할부</b></td>
									<td width="20"><b>:</b></td>
									<td width="390">
										<select name="card_halbu" class="cmfont1">
											<option value="0">일시불</option>
											<option value="3">3 개월</option>
											<option value="6">6 개월</option>
											<option value="9">9 개월</option>
											<option value="12">12 개월</option>
										</select>
									</td>
								</tr>
							</table>
	
						</td>
					</tr>
					<tr height="10"><td></td></tr>
				</table>
	
				<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
					<tr height="1" bgcolor="#CCCCCC"><td></td></tr>
					<tr height="10"><td></td></tr>
				</table>
				<!-- 무통장 -->
				<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
					<tr>
						<td align="left" valign="top" width="150" style="padding-left:45;padding-top:5"><font size=2 color="#B90319"><b>무통장 입금</b></font></td>
						<td align="center" width="560">
							<table width="560" border="0" cellpadding="0" cellspacing="0" class="cmfont">
								<tr height="25">
									<td width="150"><b>은행선택</b></td>
									<td width="20"><b>:</b></td>
									<td width="390">
										<select name="bank_kind"  class="cmfont1" disabled>
											<option value="">입금할 은행을 선택하세요.</option>
											<option value="1">국민은행 000-00000-0000</option>
											<option value="2">신한은행 000-00000-0000</option>
										</select>
									</td>
								</tr>
								<tr height="25">
									<td width="150"><b>입금자 이름</b></td>
									<td width="20"><b>:</b></td>
									<td width="390">
										<input type="text" name="bank_sender" size="15" maxlength="20" value="" class="cmfont1" disabled>
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
							<input type='image' src="${pageContext.servletContext.contextPath }/assets/images/b_order3.gif">
						</td>
					</tr>
					<tr height="20"><td></td></tr>
				</table>

			</form>
		</td>
	</tr>
</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>