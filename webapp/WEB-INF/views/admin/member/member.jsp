<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<input type="hidden" name="no" value="${authUser.no}">
<br>
<jsp:include page="/WEB-INF/views/admin/include/admin-menu.jsp"/>
<hr width='900' size='3'>

<table width="800" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
	<tr bgcolor="#CCCCCC" height="23">
		<td width="200" align="center">번호</td>
		<td width="200" align="center">E-Mail</td>
		<td width="100" align="center">이름</td>
		<td width="100" align="center">핸드폰</td>
		<td width="100" align="center">주소</td>
		<td width="100" align="center">수정/삭제</td>
	</tr>
	
	<c:forEach items="${memberList }" var="member">
		<tr bgcolor="#F2F2F2" height="23">
			<td width="100">&nbsp ${member.no }</td>
			<td width="100">&nbsp ${member.email }</td>
			<td width="100">&nbsp ${member.name }</td>	
			<td width="100">&nbsp ${member.phone }</td>
			<td width="100">&nbsp ${member.address }</td>
			<td width="100">
				<a href="#">수정</a>/
				<a href="#">삭제</a>
			</td>
		</tr>
	</c:forEach>
</table>
<br>
</body>
</html>