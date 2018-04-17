<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				
				var orderNo = deleteDialog.orderNo;
				var code = deleteDialog.code;
				var tr = deleteDialog.parentTr;	
				var data = {
					no : orderNo, 
					code : code
				};
				console.log(JSON.stringify(data));
				
				$.ajax({
					url: "/bitmall/api/admin/order/delete", 
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

						tr.remove();
						var totalOrderCount = parseInt($("#total-order-count").text()) + 1;
						$("#total-order-count").text(totalOrderCount);
						
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
	
	$(document).on("click", "#btn-delete", function(event){
		event.preventDefault();
				
		var trElement = $(this).closest("#order-info-list-item");
		
		var orderNo = $(this).data("no");
		
		var code = $(this).data("code");
		var message = "[code : " + code + "]";
		message += "<br/><br/>삭제 하시겠습니까?"
		
		$("#dialog-delete-cart p").html(message);
		
		deleteDialog.orderNo = orderNo;
		deleteDialog.code = code;
		deleteDialog.parentTr = trElement;
		deleteDialog.dialog("open");
	});
	
});

</script>

<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/admin/include/admin-menu.jsp"/>
<hr width='900' size='3'>
	<table width="800" border="0" cellspacing="0" cellpadding="0">
		<tr height="40">
			<td align="left"  width="100" valign="bottom">&nbsp 주문수 : <font id='total-order-count'color="#FF0000">${orderList.size() }</font></td>
		</tr>
		<tr><td height="5"></td></tr>
	</table>

	<table width="800" border="1" cellspacing="0" cellpadding="0" bordercolordark="white" bordercolorlight="black">
		<tr bgcolor="#CCCCCC" height="23"> 
			<td width="70"  align="center">주문번호</td>
		    <td width="70"  align="center">주문일</td>	
			<td width="70"  align="center">총금액</td>
		    <td width="65"  align="center">주문자</td>
			<td width="50"  align="center">결재</td>
		    <td width="135" align="center">주문상태</td>
		    <td width="50"  align="center">삭제</td>
		</tr>
		<c:forEach items='${orderList }' var='orderInfo'>
		<tr id='order-info-list-item' bgcolor="#F2F2F2" height="23">
			<td width="70"  align="center"><a href="${pageContext.servletContext.contextPath }/admin/order/info?orderNo=${orderInfo.no }">${orderInfo.code }</a></td>
			<td width="70"  align="center">${orderInfo.orderDate }</td>		
			<td width="70"  align="right">${orderInfo.amount } 원&nbsp</td>	
			<td width="65"  align="center">${orderInfo.recipientName }</td>	
			<td width="50"  align="center">${orderInfo.payment }</td>	
			<td width="135" align="center">
				<select name="status" style="font-size:9pt; color:black">
					<option value="주문신청" selected>주문신청</option>
					<option value="주문확인">주문확인</option>
					<option value="입금확인">입금확인</option>
					<option value="배송중">배송중</option>
					<option value="주문완료">주문완료</option>
					<option value="주문취소">주문취소</option>
				</select>&nbsp;
				<button id='btn-update'>수정</button>
			</td>
			<td width="50" align="center">
				<button id='btn-delete' data-no='${orderInfo.no }' data-code='${orderInfo.code }'>삭제</button>
			</td>
		</tr>
		</c:forEach>			
	</table>
	<br>
	
	<div id="dialog-delete-cart" title="삭제 확인" style="display:none">
		<p></p>
		<p class='validateTips error' style='display:none'>삭제 실패 입니다. 다시 입력해주세요.</p>
	</div>	
	
</body>
</html>