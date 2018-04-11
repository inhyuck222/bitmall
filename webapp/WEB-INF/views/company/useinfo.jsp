<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>비트닷컴 쇼핑몰</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
</head>
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
					<td height="30"><img src="${pageContext.servletContext.contextPath }/assets/images/help_title.gif" width="746" height="30" border="0"></td>
				</tr>
				<tr><td height="13"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="690">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/useinfo_title1.gif" border="0"></td>
				</tr>
			</table>
			<br>
			<!-- 1 -->
			<table border="0" cellpadding="0" cellspacing="0" width="690" class="cmfont">
				<tr>
					<td width="30"><font color="8B9CBF"><b>(1)</b></td>
					<td><font color="8B9CBF"><b>회원 가입은 어떻게 하나요?</b></font></td>
				</tr>
				<tr><td height="10" colspan="2"></td></tr>
				<tr>
					<td width="30"></td>
					<td>
						<font color="4B4B4B">누구나 비트닷컴 인터넷 쇼핑몰의 회원이 되실 수 있습니다. 비트닷컴 인터넷 쇼핑몰 상단에 있는 회원가입 버튼을 선택 하신 후 등록을 해주시면, 바로 회원으로 가입이 됩니다.</font>
					</td>
				</tr>
				<tr><td height="10" colspan="2"></td></tr>
			</table>
			<!-- 2 -->
			<table border="0" cellpadding="0" cellspacing="0" width="690" class="cmfont">
				<tr>
					<td width="30"><font color="8B9CBF"><b>(2)</b></td>
					<td><font color="8B9CBF"><b>상품구매 방법은?</b></font></td>
				</tr>
				<tr><td height="10" colspan="2"></td></tr>
				<tr>
					<td width="30"></td>
					<td>
						<font color="4B4B4B">. . .</font>
					</td>
				</tr>
				<tr><td height="10" colspan="2"></td></tr>
			</table>
			<!-- 3 -->
			<table border="0" cellpadding="0" cellspacing="0" width="690" class="cmfont">
				<tr>
					<td width="30"><font color="8B9CBF"><b>(3)</b></td>
					<td><font color="8B9CBF"><b>ID와 Passward를 잊어버렸을 경우는 ?</b></font></td>
				</tr>
				<tr><td height="10" colspan="2"></td></tr>
				<tr>
					<td width="30"></td>
					<td>
						<font color="4B4B4B">. . .</font>
					</td>
				</tr>
				<tr><td height="10" colspan="2"></td></tr>
			</table>

<!-------------------------------------------------------------------------------------------->	
<!-- 끝 : 다른 웹페이지 삽입할 부분                                                         -->
<!-------------------------------------------------------------------------------------------->	

		</td>
	</tr>
</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>