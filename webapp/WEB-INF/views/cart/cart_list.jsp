<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>비트닷컴 쇼핑몰</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/ejs/ejs.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery/jquery-1.9.0.js"></script>
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
}

$(function(){
	
	setPaymentAmount();
	
	var deleteDialog = $("#dialog-delete-cart").dialog({
		autoOpen: false, 
		height: 300, 
		width: 350, 
		model: true,
		buttons: {
			"확인": function(){
				
				var no = deleteDialog.cartNo;
				var quantity = deleteDialog.quantity;
				var size = deleteDialog.size;
				var productNo = deleteDialog.productNo;
				var tr = deleteDialog.parentTr;	
				var data = {
					no : no, 
					quantity : quantity, 
					size : size, 
					productNo : productNo
				};
				
				console.log(JSON.stringify(data));
				
				$.ajax({
					url: "/bitmall/api/cart/delete", 
					type: "post", 
					dataType: "json", 
					data: JSON.stringify(data), 
					contentType: "application/json", 
					success: function(response){
						
						if(response.result == "fail"){
							console.log(response.message)
							deleteDialog.dialog("close");
							return;
						}

						$(tr).remove();
						
						setPaymentAmount();
						
						deleteDialog.dialog("close");						
					}
				});
			}, 
			"취소": function(){
				
				deleteDialog.dialog("close");
			}
		}, 
		close: function(){
			
			$(".validateTips.error").hide();
		}
	});
	
	$(document).on("click", "#delete-cart", function(event){
		event.preventDefault();
				
		var trElement = $(this).closest("#cart-list-table-item");
		
		var no = $(this).data("no");
		var quantity = $(trElement).find("#input-quantity-origin").val();
		var productNo = $(trElement).find("#input-product-no").val();
		
		var productName = $(this).data("name");
		var size = $(trElement).find("#input-size-origin").val();
		var message = "\"" + productName + "[size : " + size + "]\""
		message += "<br/><br/>삭제 하시겠습니까?"
		
		$("#dialog-delete-cart p").html(message);
		
		deleteDialog.cartNo = no;
		deleteDialog.productNo = productNo;
		deleteDialog.quantity = quantity;
		deleteDialog.size = size;
		deleteDialog.parentTr = trElement;
		deleteDialog.dialog("open");
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
				</table>
				<table border="0" cellpadding="0" cellspacing="0" width="746">
					<tr>
						<td height="30" align="left"><img src="${pageContext.servletContext.contextPath }/assets/images/cart_title.gif" width="746" height="30" border="0"></td>
					</tr>
				</table>
				<table border="0" cellpadding="0" cellspacing="0" width="747">
					<tr><td height="13"></td></tr>
				</table>
	
				<table border="0" cellpadding="0" cellspacing="0" width="710" class="cmfont">
					<tr>
						<td><img src="${pageContext.servletContext.contextPath }/assets/images/cart_title1.gif" border="0"></td>
					</tr>
				</table>
	
				<table border="0" cellpadding="0" cellspacing="0" width="710">
					<tr><td height="10"></td></tr>
				</table>
	
				<table border="0" cellpadding="5" cellspacing="1" width="710" class="cmfont" bgcolor="#CCCCCC">
					<tr bgcolor="F0F0F0" height="23" class="cmfont">
						<td width="420" align="center">상품</td>
						<td width="70"  align="center">수량</td>
						<td width="80"  align="center">가격</td>
						<td width="90"  align="center">합계</td>
						<td width="50"  align="center">삭제</td>
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
									<input id='input-quantity' type="text" name="quantity" size="3" value="${cartInfo.quantity }" class="cmfont1">&nbsp									
									<font color="#464646">개</font>
								</td>
								<td align="center" bgcolor="#FFFFFF">
									<font id='price-product' color="#464646">${cartInfo.price }</font>
								</td>
								<td align="center" bgcolor="#FFFFFF">
									<font id='amount-products' color="#464646">${cartInfo.amount }</font>
								</td>
								<td align="center" bgcolor="#FFFFFF">
									<input id='input-product-no' type="hidden" value="${cartInfo.productNo }">
									<input id='input-size-origin' type="hidden" value="${cartInfo.size }">
									<input id='input-quantity-origin' type="hidden" size="3" value="${cartInfo.quantity }">
									<input type="submit" value='수정'>
									<button id='delete-cart' data-no='${cartInfo.cartNo }' data-name='${cartInfo.productName }' data-size='${cartInfo.size }'>삭제</button>									
									<!--a id='delete-cart' href="#" data-no='${cartInfo.cartNo }' data-name='${cartInfo.productName }' data-size='${cartInfo.size }'><img src="${pageContext.servletContext.contextPath }/assets/images/b_delete1.gif" border="0"></a>&nbsp -->
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
										<font color="#FF3333"><b id='payment-amount'>134,500원</b></font>&nbsp;&nbsp
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
				<table width="710" border="0" cellpadding="0" cellspacing="0" class="cmfont">
					<tr height="44">
						<td width="710" align="center" valign="middle">
							<a href="index.jsp"><img src="${pageContext.servletContext.contextPath }/assets/images/b_shopping.gif" border="0"></a>&nbsp;&nbsp;
							<a href="#"><img src="${pageContext.servletContext.contextPath }/assets/images/b_cartalldel.gif" width="103" height="26" border="0"></a>&nbsp;&nbsp;
							<a href="order"><img src="${pageContext.servletContext.contextPath }/assets/images/b_order1.gif" border="0"></a>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
	<br><br>

	<div id="dialog-delete-cart" title="삭제 확인" style="display:none">
		<p></p>
		<p class='validateTips error' style='display:none'>삭제 실패 입니다. 다시 입력해주세요.</p>
	</div>



<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>