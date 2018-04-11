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
<form name="form1" method="get" action="">
<table width="800" border="0" cellspacing="0" cellpadding="0">
	<tr height="40">
		<td align="left"  width="100" valign="bottom">&nbsp 주문수 : <font color="#FF0000">20</font></td>
		<td align="right" width="650" valign="bottom">
			기간 : 
			<input type="text" name="day1_y" size="4" value="2008">
			<select name="day1_m">
				<option value="01" selected>1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
			<select name="day1_d">
				<option value="01" selected>1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				<option value="25">25</option>
				<option value="26">26</option>
				<option value="27">27</option>
				<option value="28">28</option>
				<option value="29">29</option>
				<option value="30">30</option>
				<option value="31">31</option>
			</select> - 
			<input type="text" name="day2_y" size="4" value="2008">
			<select name="day2_m">
				<option value="01" selected>1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
			</select>
			<select name="day2_d">
				<option value="01" selected>1</option>
				<option value="02">2</option>
				<option value="03">3</option>
				<option value="04">4</option>
				<option value="05">5</option>
				<option value="06">6</option>
				<option value="07">7</option>
				<option value="08">8</option>
				<option value="09">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>
				<option value="13">13</option>
				<option value="14">14</option>
				<option value="15">15</option>
				<option value="16">16</option>
				<option value="17">17</option>
				<option value="18">18</option>
				<option value="19">19</option>
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				<option value="25">25</option>
				<option value="26">26</option>
				<option value="27">27</option>
				<option value="28">28</option>
				<option value="29">29</option>
				<option value="30">30</option>
				<option value="31">31</option>
			</select> &nbsp
			<select name="sel1">
				<option value="0" selected>전체</option>
				<option value="1">주문신청</option>
				<option value="2">주문확인</option>
				<option value="3">입금확인</option>
				<option value="4">배달중</option>
				<option value="5">주문완료</option>
				<option value="6">주문취소</option>
			</select> &nbsp 
			<select name="sel2">
				<option value="1">주문번호</option>
				<option value="2">고객명</option>
				<option value="3">상품명</option>
			</select>
			<input type="text" name="text1" size="10" value="">&nbsp
		</td>
		<td align="left" width="50" height="50" valign="bottom">
			<input type="button" value="검색"> &nbsp;
		</td>
	</tr>
	<tr><td height="5"></td></tr>
</table>
</form>

<table width="800" border="1" cellspacing="0" cellpadding="0" bordercolordark="white" bordercolorlight="black">
	<tr bgcolor="#CCCCCC" height="23"> 
		<td width="70"  align="center">주문번호</td>
    <td width="70"  align="center">주문일</td>
	  <td width="250" align="center">상품명</td>
		<td width="40"  align="center">제품수</td>	
		<td width="70"  align="center">총금액</td>
    <td width="65"  align="center">주문자</td>
		<td width="50"  align="center">결재</td>
    <td width="135" align="center">주문상태</td>
    <td width="50"  align="center">삭제</td>
	</tr>
	<tr bgcolor="#F2F2F2" height="23">
		<form method="post" action=""> 
		<td width="70"  align="center"><a href="jumun_info.jsp?no=0803050004">0803050004</a></td>
		<td width="70"  align="center">2008-03-05</td>
		<td width="250" align="left">&nbsp;파란 브라우스 외 1</td>	
		<td width="40" align="center">2</td>	
		<td width="70"  align="right">35,000&nbsp</td>	
		<td width="65"  align="center">홍길동</td>	
		<td width="50"  align="center">카드</td>	
		<td width="135" align="center" valign="bottom">
			<select name="state" style="font-size:9pt; color:black">
				<option value="1" selected>주문신청</option>
				<option value="2">주문확인</option>
				<option value="3">입금확인</option>
				<option value="4">배송중</option>
				<option value="5">주문완료</option>
				<option value="6">주문취소</option>
			</select>&nbsp;
			<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/admin/b_edit1.gif" border="0">
		</td>	
		<td width="50" align="center" valign="bottom">
			<a href=""><img src="${pageContext.servletContext.contextPath }/assets/images/admin/b_delete1.gif" border="0"></a>
		</td>
		</form>
	</tr>
	<tr bgcolor="#F2F2F2" height="23">
		<form method="post" action="">  
		<td width="70"  align="center"><a href="jumun_info.jsp?no=0803030002">0803030002</a></td>
		<td width="70"  align="center">2008-03-03</td>
		<td width="250" align="left">&nbsp;실크 브라우스</td>	
		<td width="40" align="center">1</td>	
		<td width="70"  align="right">120,000&nbsp</td>	
		<td width="65"  align="center">이길동</td>	
		<td width="50"  align="center">무통장</td>	
		<td width="135" align="center" valign="bottom">
			<select name="state" style="font-size:9pt; color:blue">
				<option value="1">주문신청</option>
				<option value="2">주문확인</option>
				<option value="3">입금확인</option>
				<option value="4">배송중</option>
				<option value="5" selected>주문완료</option>
				<option value="6">주문취소</option>
			</select>&nbsp;
			<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/admin/b_edit1.gif" border="0">
		</td>	
		<td width="50" align="center" valign="bottom">
			<a href=""><img src="${pageContext.servletContext.contextPath }/assets/images/admin/b_delete1.gif" border="0"></a>
		</td>
		</form>
	</tr>
	<tr bgcolor="#F2F2F2" height="23">
		<form method="post" action="">   
		<td width="70"  align="center"><a href="jumun_info.jsp?no=0803010006">0803010006</a></td>
		<td width="70"  align="center">2008-03-01</td>
		<td width="250" align="left">&nbsp;하얀 브라우스</td>	
		<td width="40" align="center">1</td>	
		<td width="70"  align="right">155,000&nbsp</td>	
		<td width="65"  align="center">김미자</td>	
		<td width="50"  align="center">카드</td>	
		<td width="135" align="center" valign="bottom">
			<select name="state" style="font-size:9pt; color:red">
				<option value="1">주문신청</option>
				<option value="2">주문확인</option>
				<option value="3">입금확인</option>
				<option value="4">배송중</option>
				<option value="5">주문완료</option>
				<option value="6"selected>주문취소</option>
			</select>&nbsp;
			<input type="image" src="${pageContext.servletContext.contextPath }/assets/images/admin/b_edit1.gif" border="0">
		</td>	
		<td width="50" align="center" valign="bottom">
			<a href=""><img src="${pageContext.servletContext.contextPath }/assets/images/admin/b_delete1.gif" border="0"></a>
		</td>
		</form>
	</tr>
</table>
<br>
<table width="800" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="30" class="cmfont" align="center">
			<img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_prev.gif" align="absmiddle" border="0"> 
			<font color="#FC0504"><b>1</b></font>&nbsp;
			<a href="jumun.jsp?page=2&sel1=&sel2=&text1=&day1_y=&day1_m=&day1_d=&day2_y=&day2_m=&day2_d="><font color="#7C7A77">[2]</font></a>&nbsp;
			<a href="jumun.jsp?page=3&sel1=&sel2=&text1=&day1_y=&day1_m=&day1_d=&day2_y=&day2_m=&day2_d="><font color="#7C7A77">[3]</font></a>&nbsp;
			<img src="${pageContext.servletContext.contextPath }/assets/images/admin/i_next.gif" align="absmiddle" border="0">
		</td>
	</tr>
</table>
</body>
</html>