<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="${pageContext.servletContext.contextPath }/assets/css/font.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/head.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/main_page.css" rel="stylesheet" type="text/css">
<link href="${pageContext.servletContext.contextPath }/assets/css/navigation.css" rel="stylesheet" type="text/css">
<table width="959" height="50" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr >
		<td align="right" valign="bottom">
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
				<c:choose>		
					<c:when test="${empty authUser }">
						<td>
							<a href="${pageContext.servletContext.contextPath }"><label id='head-item'>메인 페이지</label></a>
						</td>
						<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif"width="11"></td>
						<td>
							<a href="${pageContext.servletContext.contextPath }/user/login"><label id='head-item'>로그인</label></a>
						</td>
						<td><img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif"width="11"></td>
						<td>
							<a href="${pageContext.servletContext.contextPath }/user/join"><label id='head-item'>회원 가입</label></a>
						</td>
					</c:when>
					
					<c:otherwise>
						<td>
							<a href="${pageContext.servletContext.contextPath }"><label id='head-item'>메인 페이지</label></a>
						</td>
						<td>
							<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11">
						</td>
						<!-- 로그아웃 -->
						<td>
							<a href="${pageContext.servletContext.contextPath }/user/logout"><label id='head-item'>로그 아웃</label></a>
						</td>
						<td>
							<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11">
						</td>
						<!-- 회원정보수정 -->
						<td>
							<a href="${pageContext.servletContext.contextPath }/user/modify"><label id='head-item'>내 정보</label></a>
						</td>
						<td>
							<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11">
						</td>
						<td>
							<a href="${pageContext.servletContext.contextPath }/cart/list"><label id='head-item'>장바구니</label></a>
						</td>
						<td>
							<img src="${pageContext.servletContext.contextPath }/assets/images/top_menu_line.gif" width="11">
						</td>
						<td>
							<a href="${pageContext.servletContext.contextPath }/order/list"><label id='head-item'>주문 리스트</label></a>
						</td>
					</c:otherwise>
				</c:choose>	
				</tr>
			</table>
		</td>
	</tr>
</table>

<!--  상단 메인 이미지 --------------------------------------------------->
<table align="center">
	<tr>		
		<td><img src="${pageContext.servletContext.contextPath }/assets/new-image/head.jpg" width="959" height="360"></td>
	</tr>
</table>