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
	var loadTotalPrice = $("td[id='amount-products']").each(function(index, o){
		totalAmount += parseInt($(o).text());
	});
	var paymentAmount = totalAmount + deliveryCharge;
	
	$("#payment-amount").text(paymentAmount);	
}

$(function(){
	
	setPaymentAmount();
	
});	
</script>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/admin/include/admin-menu.jsp"/>
	<hr width='900' size='3'>
	<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
		<tr> 
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문번호</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE"><font size="3"><b>${orderInfo.code }</b></font></td>
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문일</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">${orderInfo.orderDate }</td>
		</tr>
	</table>
	<br>
	<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
		<tr> 
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문자</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">${orderUser.name }</td>
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">결제 정보</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">${orderInfo.payment }</td>
		</tr>
		<tr> 
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문자 E-Mail</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">${orderUser.email }</td>
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문자전화</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">${orderUser.phone }</td>
		</tr>
		<tr> 
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">주문자주소</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE" colspan="3">${orderUser.address }</td>
		</tr>
	</table>
	<img src="blank.gif" width="10" height="5"><br>
	<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
		<tr> 
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">수신자</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">${orderInfo.recipientName }</td>
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">수신자전화</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE">${orderInfo.recipientPhone }</td>
		</tr>
		<tr> 
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">수신자주소</font></td>
	        <td width="300" height="20" bgcolor="#EEEEEE" colspan="3">${orderInfo.recipientAddress }</td>
		<tr> 
	        <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">메모</font></td>
	        <td width="300" height="50" bgcolor="#EEEEEE" colspan="3">${orderInfo.requirements } </td>
		</tr>
	</table>
	<br>
	<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
		<tr bgcolor="#CCCCCC"> 
	    <td width="340" height="20" align="center"><font color="#142712">상품번호</font></td>
			<td width="50"  height="20" align="center"><font color="#142712">수량</font></td>
			<td width="70"  height="20" align="center"><font color="#142712">단가</font></td>
			<td width="70"  height="20" align="center"><font color="#142712">금액</font></td>
			<td width="60"  height="20" align="center"><font color="#142712">사이즈</font></td>
		</tr>
		<c:forEach items='${orderProductList }' var='orderProductInfo'>
			<tr bgcolor="#EEEEEE" height="20">	
				<td width="340" height="20" align="left">${orderProductInfo.orderProductNo }</td>	
				<td width="50"  height="20" align="center">${orderProductInfo.quantity }</td>
				<td width="70"  height="20" align="right">${orderProductInfo.price }</td>
				<td id='amount-products' width="70"  height="20" align="right">${orderProductInfo.amount }</td>
				<td width="60"  height="20" align="center">${orderProductInfo.size }</td>	
			</tr>
		</c:forEach>
	</table>
	<br>
	
	<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
		<tr bgcolor="#CCCCCC"> 
	    	<td width="480" height="20" align="center"><font color="#142712">부가 서비스</font></td>
			<td width="70"  height="20" align="center"><font color="#142712">수량</font></td>
			<td width="60"  height="20" align="center"><font color="#142712">금액</font></td>
		</tr>
		<tr bgcolor="#EEEEEE" height="20">	
			<td width="480" height="20" align="left">택배비</td>	
			<td width="70"  height="20" align="center">1</td>	
			<td width="60"  height="20" align="right">2,500</td>
		</tr>
	</table>
	<br>
	
	<img src="blank.gif" width="10" height="5"><br>
	<table width="800" border="1" cellspacing="0" cellpadding="4" bordercolordark="white" bordercolorlight="black">
		<tr> 
		  <td width="100" height="20" bgcolor="#CCCCCC" align="center"><font color="#142712">총금액</font></td>
			<td width="700" height="20" bgcolor="#EEEEEE" align="right"><font color="#142712" size="3"><b id='payment-amount'></b></font> 원&nbsp;&nbsp</td>
		</tr>
	</table>
	<br>
	
	<table width="800" border="0" cellspacing="0" cellpadding="7">
		<tr> 
			<td align="center">
				<a href="jumun.jsp"><input type="button" value="이 전 화 면"></a>&nbsp
				<input type="button" value="프린트" onClick="javascript:print();">
			</td>
		</tr>
	</table>
	<br>
</body>
</html>
