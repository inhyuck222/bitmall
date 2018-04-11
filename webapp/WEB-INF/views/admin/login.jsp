<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<TITLE> 비트닷컴 쇼핑몰</TITLE>
<META HTTP-EQUIV="content-type" content="text/html; charset=utf-8">
</head>

<body bgcolor="white" text="black" link="blue" vlink="purple" alink="red" onLoad="focusIt()">
<br><br><br><br><br><br><br><br><br><br>
<input type="hidden" name="no" value="${authUser.no}">

<form name="form1" action="${pageContext.servletContext.contextPath}/admin/auth" method="post">

<table  bordercolor="purple" border width='330' cellpadding='4' cellspacing='0'>
	<tr>
		<td>
			<table bgcolor="#feffd7" border="0" width="330" cellpadding='0' cellspacing='0'>
				<tr>
					<td width="324" colspan="2" bgcolor='#F0E8C6' height="42" align='center'>
            			<b>쇼핑몰&nbsp;&nbsp;운영자 관리</b>
	        		</td>
			  	</tr>
			    <tr>
					<td width="106" height="5">&nbsp;</td>
					<td width="212" height="5">&nbsp;</td>
			    </tr>
				<tr>
					<td width="106" valign="middle" align="right">&nbsp;<img src="${pageContext.servletContext.contextPath }/assets/images/admin/id.gif" width="20" height="16" border="0"></td>
					<td width="212" valign='center'>&nbsp;<input type="text" name="email" maxlength="12" size="14"></td>
				</tr>
			    <tr>
					<td width="106" valign="middle" align="right">&nbsp;<img src="${pageContext.servletContext.contextPath }/assets/images/admin/pw.gif" width="75" height="16" border="0"></td>
					<td width="212" valign='center'>
		          		&nbsp;<input type="password" name="password" maxlength="12" size="14">
					</td>
			    </tr>
				<tr>
					<td width="324" colspan="2" align='center'>
						<input type='submit' value='login'>						
					</td>
				</tr>
			</table>
		</td>
	</tr>
</table>

</form>
</body>
</html>
