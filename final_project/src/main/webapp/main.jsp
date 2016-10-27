<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE PUBLIC>
<html>
<head>
<meta charset="UTF-8">
<title>ReMind : [RE:AD MIND]</title>
<style type="text/css">

	.follower_post{
	position: relative;
	left: 5%;
	top: 50%;
	
	}

	.mywishlist_table{
	background-color: lightblue;
    border: black;
    border-style: solid;
    border-width: thin;
    width: 30%;
    position: fixed;
    right: 0px;
    top: 10%
	}
	
	.upcomingevent_table{
	background-color: pink;
    border: black;
    border-style: solid;
    border-width: thin;
    width: 30%;
    position: fixed;
    right: 0px;
    top: 20%
	}
</style>


</head>
<body>
	<%@include file="common.jsp"%>
	<%@include file="top.jsp"%>
	
	
	
<div class="container">
	<div class="follower_post">		
		<table border="1">
			<tr>
				<td>글쓴이사진</td><td>ILOVE_NYC</td><td>3시간 전</td>
			</tr>
			<tr>
				<td colspan="3"><img src="https://static.pexels.com/photos/5317/food-salad-restaurant-person.jpg" width="50%"></td>
			</tr>
			<tr>
				<td colspan="3">
					<p>좋아요 102개</p>
					<p>#먹방 #맛있어 #ㅋㅋㅋ</p>
				</td>
			</tr>
		</table>
	</div>
	
	<div class="mywishlist_table">
		내 위시리스트 테이블
		<table border="1" style="width: 100%; font-size: 12px" >
			<tr><th>물품명</th><th>물품가격</th><th>상세정보</th><th>홀딩중</th></tr>
			<tr><td>UBS드라이브</td><td>23,000</td><td>Seagate 32GB USB 드라이브</td><td><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></td></tr>
		</table>
	</div>
	
	<div class="upcomingevent_table">
		다가오는 EVENT LIST
		<table border="1" style="width: 100%; font-size: 12px">
			<tr><th>친구명</th><th>물품명</th><th>물품가격</th><th>상세정보</th><th>홀딩중</th></tr>
			<tr><td>심진영</td><td>신상 구두</td><td>320,000</td><td>페라가몽 구두</td><td><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></td></tr>
			<tr><td>박배흠</td><td>신상 점퍼</td><td>132,000</td><td>저렴한 점퍼</td><td><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></td></tr>
		</table>
	</div>
	
</div>
	
	<%@include file="bottom.jsp"%>
</body>
</html>