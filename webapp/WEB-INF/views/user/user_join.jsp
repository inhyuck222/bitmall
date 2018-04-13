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
		<!-- 시작 : 다른 웹페이지 삽입할 부분                                                                                                                                                            -->
		<!-------------------------------------------------------------------------------------------->	
			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/login_title2.gif" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>

		<form:form
			modelAttribute="userVo" 
			name="joinForm" 
			method="post" 
			action="${pageContext.servletContext.contextPath }/user/join">
			<table border="0" cellpadding="5" cellspacing="1" width="685" bgcolor="cccccc">
				<tr>
					<td align="center" bgcolor="efefef">
						<table border="0" cellpadding="0" cellspacing="5" width="100%" bgcolor="white">
							<tr>
								<td align="center">
									<table border="0" cellpadding="0" cellspacing="0" width="635" class="cmfont">
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>이메일 (ID)</b></font>
											</td>
											<td>
												<form:input path="email" maxlength = "12" size="20" class="cmfont1"/>
												<a href="javascript:check_id();"><img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/b_idcheck.gif" border="0"></a>
												<p>
													<strong>
														<form:errors path="email"/>
													</strong>
												</p>												
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>비밀번호</b></font>
											</td>
											<td>
												<form:password path="password" maxlength = "10" size="20" class="cmfont1"/>
												<p>
													<strong>
														<form:errors path="password"/>
													</strong>
												</p>
											</td>
										</tr>
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>비밀번호 확인</b></font>
											</td>
											<td>
												<input TYPE="password" name="passwordConfirm" maxlength = "10" size="20" class="cmfont1">
											</td>
										</tr>
										<tr><td colspan="2" height="10"></td></tr>
										<tr><td colspan="2" bgcolor="E6DDD5"></td></tr>
										<tr><td colspan="2" height="10"></td></tr>
									</table>
									<table border="0" cellpadding="0" cellspacing="0" width="635" class="cmfont">
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>이 름</b></font>
											</td>
											<td>
												<form:input path="name" maxlength = "10" size="20" class="cmfont1"/>
												<p>
													<strong>
														<form:errors path="name"/>
													</strong>
												</p>
											</td>
										</tr>										
										<tr><td colspan="2" height="10"></td></tr>
										<tr><td colspan="2" bgcolor="E6DDD5"></td></tr>
										<tr><td colspan="2" height="10"></td></tr>
									</table>
									<table border="0" cellpadding="0" cellspacing="0" width="635" class="cmfont">
										<tr>
											<td width="127" height="30">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>핸드폰 번호</b></font>
											</td>
											<td>
												<form:input path="phone" size = "20" maxlength = "15" value = "" class="cmfont1"/>
												<p>
													<strong>
														<form:errors path="phone"/>
													</strong>
												</p>
											</td>
										</tr>
										<tr>
											<td width="127" height="50">
												<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>주 소</b></font>
											</td>
											<td> 
												<!--a href="javascript:FindZip(0)"><img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" border="0"></a><br-->
												<form:input path='address' size = "50" maxlength = "200" value = "" class="cmfont1"/><br/>
												<p>
													<strong>
														<form:errors path="address"/>
													</strong>
												</p>
											</td>
											<!--td>
												<input type="text" name='zip1' size = "4" maxlength = "3" value = "762" class="cmfont1"><font color="898989">-</font>
												<input type="text" name='zip2' size = "4" maxlength = "3" value = "634" class="cmfont1"> 
												<a href="javascript:FindZip(0)"><img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/b_zip.gif" border="0"></a><br>
												<input type="text" name='address' size = "50" maxlength = "200" value = "경기도 안양" class="cmfont1"><br>
											</td-->
										</tr>										
									</table>
			
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr>
					<td height="45" align="right">
						<input type='submit' value='가입'>						
						<button>취소</button>
					</td>
				</tr>
			</table>
		</form:form>

		<!-------------------------------------------------------------------------------------------->	
		<!-- 끝 : 다른 웹페이지 삽입할 부분                                                                                                                                                              -->
		<!-------------------------------------------------------------------------------------------->	

		</td>
	</tr>
</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
</body>
</html>