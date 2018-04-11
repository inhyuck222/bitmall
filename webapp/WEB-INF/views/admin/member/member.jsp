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
<table width="800" border="0" cellspacing="0" cellpadding="0">
	<form name="form1" method="get" action="">
	<tr height="40">
		<td width="200" valign="bottom">&nbsp 회원수 : <font color="#FF0000">20</font></td>
		<td width="200">&nbsp</td>
		<td width="350" align="right" valign="bottom">
			<select name="sel1" class="combo1">
				<option value="1" >이름</option>
				<option value="2" >아이디</option>
			</select>
			<input type="text" name="text1" size="15" value="">&nbsp
		</td>
		<td width="50" valign="bottom">
			<input type="submit" value="검색">&nbsp
		</td>
	</tr>
	<tr><td height="5" colspan="4"></td></tr>
	</form>
</table>
<table width="800" border="1" cellspacing="0" bordercolordark="white" bordercolorlight="black">
	<tr bgcolor="#CCCCCC" height="23"> 
		<td width="100" align="center">ID</td>
		<td width="100" align="center">이름</td>
		<td width="100" align="center">전화</td>
		<td width="100" align="center">핸드폰</td>
		<td width="200" align="center">E-Mail</td>
		<td width="100" align="center">회원구분</td>
		<td width="100" align="center">수정/삭제</td>
	</tr>
	
	
	<tr bgcolor="#F2F2F2" height="23">	
		<td width="100">&nbsp id1</td>	
		<td width="100">&nbsp 홍길동</td>	
		<td width="100">&nbsp 02 -123-1234</td>	
		<td width="100">&nbsp 011-123-1234</td>	
		<td width="200">&nbsp abcd@abcd.com</td>	
		<td width="100" align="center">회원</td>	
		<td width="100" align="center">
			<a href="#">수정</a>/
			<a href="#">삭제</a>
		</td>
	</tr>
	
	<c:forEach var="vo" items="${list }" varStatus="status">
	
	<tr bgcolor="#F2F2F2" height="23">	
		<td width="100">&nbsp ${vo.id }</td>	
		<td width="100">&nbsp ${vo.name }</td>	
		<td width="100">&nbsp ${vo.phone_number }</td>	
		<td width="100">&nbsp ${vo.handphone }</td>	
		<td width="200">&nbsp ${vo.email }</td>	
		<td width="100" align="center">${vo.type }</td>	
		<td width="100" align="center">
			<a href="#">수정</a>/
			<a href="#">삭제</a>
		</td>
	</tr>
	</c:forEach>
</table>
<br>
<table width="800" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="30" class="cmfont" align="center">
			<img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_prev.gif" align="absmiddle" border="0"> 
			<font color="#FC0504"><b>1</b></font>&nbsp;
			<a href="member.jsp?page=2"><font color="#7C7A77">[2]</font></a>&nbsp;
			<a href="member.jsp?page=3"><font color="#7C7A77">[3]</font></a>&nbsp;
			<img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_next.gif" align="absmiddle" border="0">
		</td>
	</tr>
</table>
</center>
</body>
</html>