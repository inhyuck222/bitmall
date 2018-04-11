<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
	<title>쇼핑몰 관리자 홈페이지</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
	<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="white" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br>
<jsp:include page="/WEB-INF/views/admin/include/admin-menu.jsp"/>
<hr width='900' size='3'>
<table width="450" border="0" cellspacing="0" cellpadding="0">
	<tr height="50">
		<td align="left"  width="300" valign="bottom">&nbsp 옵션명 : <font color="#0457A2"><b>사이즈</b></font></td>
		<td align="right" width="200" valign="bottom">
			<input type="button" value="신규입력" onclick="javascript:go_new();"> &nbsp
		</td>
	</tr>
	<tr><td height="5" colspan="2"></td></tr>
</table>

<table width="500" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
	<tr bgcolor="#CCCCCC" height="20"> 
		<td width="100" align="center"><font color="#142712">소옵션번호</font></td>
		<td width="300" align="center"><font color="#142712">소옵션명</font></td>
		<td width="100" align="center"><font color="#142712">수정/삭제</font></td>
	</tr>
	<tr bgcolor="#F2F2F2" height="20">	
		<td width="100" align="center">1</td>
		<td width="300" align="left">XL</td>
		<td width="100" align="center">
			<a href="opts_edit.jsp?no1=1&no2=1">수정</a>/
			<a href="">삭제</a>
		</td>
	</tr>
	<tr bgcolor="#F2F2F2" height="20">	
		<td width="100" align="center">2</td>
		<td width="300" align="left">L</td>
		<td width="100" align="center">
			<a href="opts_edit.jsp?no1=1&no2=2">수정</a>/
			<a href="">삭제</a>
		</td>
	</tr>
	<tr bgcolor="#F2F2F2" height="20">	
		<td width="100" align="center">3</td>
		<td width="300" align="left">M</td>
		<td width="100" align="center">
			<a href="opts_edit.jsp?no1=1&no2=3">수정</a>/
			<a href="">삭제</a>
		</td>
	</tr>
	<tr bgcolor="#F2F2F2" height="20">	
		<td width="100" align="center">4</td>
		<td width="300" align="left">S</td>
		<td width="100" align="center">
			<a href="opts_edit.jsp?no1=1&no2=4">수정</a>/
			<a href="">삭제</a>
		</td>
	</tr>
</table>
</body>
</html>