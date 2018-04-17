<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table width="959" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr> 
		<td>
			<!--  상단 왼쪽 로고  -------------------------------------------->
			<table border="0" cellspacing="0" cellpadding="0" width="182">
				<tr>
					<td>
						<a href="/ad" onclick="<input type='hidden' name='no' value='${authUser.no }'>" title="no" id="no" >
						<input type="hidden" name="no" value="${authUser.no }">
						<img src="${pageContext.servletContext.contextPath }/assets/images/top_logo.gif" width="182" height="40" border="0">
						</a>
					</td>
				</tr>
			</table>
		</td>
		<td align="right" valign="bottom">
			<!--  상단메뉴 시작 (main_topmemnu.jsp) : Home/로그인/회원가입/장바구니/주문배송조회/즐겨찾기추가  ---->	
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
	<c:choose>		
		<c:when test="${empty authUser }">
			<td>
				<a href="${pageContext.servletContext.contextPath }">Home</a>
			</td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif"width="11"></td>
			<td>
				<a href="${pageContext.servletContext.contextPath }/user/login">Login</a>
			</td>
			<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif"width="11"></td>
			<td>
				<a href="${pageContext.servletContext.contextPath }/user/join">Join</a>
			</td>
		</c:when>
		
		<c:otherwise>
			<td>
				<a href="${pageContext.servletContext.contextPath }">Home</a>
			</td>
			<td>
				<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11">
			</td>
			<!-- 로그아웃 -->
			<td>
				<a href="${pageContext.servletContext.contextPath }/user/logout">Logout</a>
			</td>
			<td>
				<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11">
			</td>
			<!-- 회원정보수정 -->
			<td>
				<a href="${pageContext.servletContext.contextPath }/user/modify">My Info</a>
			</td>
			<td>
				<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11">
			</td>
			<td>
				<a href="${pageContext.servletContext.contextPath }/cart/list">Cart</a>
			</td>
			<td>
				<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11">
			</td>
			<td>
				<a href="${pageContext.servletContext.contextPath }/order/list">My Order</a>
			</td>
			<td>
				<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif"width="11">
			</td>

		</c:otherwise>
	</c:choose>	
				</tr>
				
				
			</table>
			<!--  상단메뉴 끝 (main_topmemnu.php)  ---------->	
		</td>
	</tr>
</table>

<!--  상단 메인 이미지 --------------------------------------------------->
<table width="959" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
		<td><img src="${pageContext.servletContext.contextPath }/assets/images/main_image0.jpg" width="182" height="175"></td>
	  <td><img src="${pageContext.servletContext.contextPath }/assets/images/main_image1.jpg" width="777" height="175"></td>
	</tr>
</table>