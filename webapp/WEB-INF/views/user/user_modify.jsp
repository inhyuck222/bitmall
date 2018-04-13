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

			<table border="0" cellpadding="0" cellspacing="0" width="747">
				<tr><td height="13"></td></tr>
				<tr>
					<td height="30" align="center">
						<img src="${pageContext.servletContext.contextPath }/assets/images/login_title.gif" width="747" height="30" border="0">
					</td>
				</tr>
				<tr><td height="13"></td></tr>
			</table>
			<table border="0" cellpadding="0" cellspacing="0" width="685" class="cmfont">
				<tr>
					<td><img src="${pageContext.servletContext.contextPath }/assets/images/member_edit.gif" border="0"></td>
				</tr>
				<tr><td height="10"></td></tr>
			</table>

			<form:form
				modelAttribute="userVo" 
				name="modifyForm" 
				method="post" 
				action="${pageContext.servletContext.contextPath }/user/modify">
				
				<table border="0" cellpadding="5" cellspacing="1" width="685" bgcolor="cccccc">
					<tr>
						<td align="center" bgcolor="efefef">
							<table border="0" cellpadding="0" cellspacing="5" width="100%" bgcolor="white">
								<tr>
									<td align="center">
										<table border="0" cellpadding="0" cellspacing="0" width="635" class="cmfont">
											<tr>
												<td width="127" height="30">
													<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>기존 비밀번호</b></font>
												</td>
												<td>
													<form:password path="password" maxlength = "10" size="20" class="cmfont1"/>
													<form:hidden path="email"/>
												</td>
											</tr>
											<tr>
												<td width="127" height="30">
													<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>변경 비밀번호</b></font>
												</td>
												<td>
													<input type="password" name="newPassword" maxlength = "10" size="20" class="cmfont1"/>
												</td>
											</tr>
											<tr>
												<td width="127" height="30">
													<img align="absmiddle" src="${pageContext.servletContext.contextPath }/assets/images/i_dot.gif" border="0"> <font color="898989"><b>변경 비밀번호 확인</b></font>
												</td>
												<td>
													<input type="password" maxlength = "10" size="20" class="cmfont1"/>
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
													<form:input path="name" maxlength = "10" value = "${authUser.name }" size="20" class="cmfont1"/>
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
													<form:input path='phone' size = "20" maxlength = "20" value = "${authUser.phone }" class="cmfont1"/>
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
													<form:input path='address' size = "50" maxlength = "200" value = "${authUser.address }" class="cmfont1"/><br>
													<p>
														<strong>
															<form:errors path="address"/>
														</strong>
													</p>
												</td>
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
							<input type="submit" value="수정">&nbsp;&nbsp;
							<a href="${pageContext.servletContext.contextPath }"><button>취소</button></a>
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