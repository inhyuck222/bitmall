<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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

			<!---- 화면 우측(신상품) 시작 -------------------------------------------------->	
			<table width="767" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="60">
						<img src="${pageContext.servletContext.contextPath }/assets/images/main_newproduct.jpg" width="767" height="40">
					</td>
				</tr>
			</table>

			<table border="0" cellpadding="0" cellspacing="0">
				<!---1번째 줄-->
				<tr>
					<c:forEach items='${productList }' var='product'>
						<td width="200" height=300 align="center" valign="top">
							<table border="0" cellpadding="0" cellspacing="0" width="100" class="cmfont">
								<tr> 
									<td align="center"> 
										<a href="${pageContext.servletContext.contextPath }/product/${product.categoryNo}/${product.no}"><img src="${pageContext.servletContext.contextPath }${product.picturePath}" width="120" height="140" border="0"></a>
									</td>
								</tr>
								<tr>
									<td height="5"></td>
								</tr>
								<tr> 
									<td height="20" align="center">
										<a href="${pageContext.servletContext.contextPath }/product/${product.categoryNo}/${product.no}"><font color="444444">${product.name }</font></a>&nbsp;
									</td>
								</tr>
								<tr>
									<td height="20" align="center"><b>${product.price } 원</b></td>
								</tr>
							</table>
						</td>
					</c:forEach>

				</tr>
				<tr><td height="10"></td></tr>
			</table>

			<!---- 화면 우측(신상품) 끝 -------------------------------------------------->	

		<!-------------------------------------------------------------------------------------------->	
		<!-- 끝 : 다른 웹페이지 삽입할 부분                                                                                                                                                              -->
		<!-------------------------------------------------------------------------------------------->

		</td>
	</tr>
</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
&nbsp

</body>
</html>