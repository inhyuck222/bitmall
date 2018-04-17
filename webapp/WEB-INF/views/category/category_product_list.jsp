<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
	<title>비트닷컴 쇼핑몰</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8">
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
			
				<table border="0" cellpadding="0" cellspacing="0">
					<tr id='container'>						
						<c:forEach items='${productList }' var='product'>
							<td id='item'>
								<table class="cmfont">
									<tr> 
										<td align="center"> 
											<a href="${pageContext.servletContext.contextPath }/product/${product.categoryNo}/${product.no}"><img id='item-image' src="${pageContext.servletContext.contextPath }${product.picturePath}"></a>
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
			</td>
		</tr>
	</table>
<br><br>
<jsp:include page="/WEB-INF/views/include/footer.jsp"/>
&nbsp

</body>
</html>