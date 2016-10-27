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
    
   
	}
	
	.upcomingevent_table{
	background-color: pink;
    border: black;
    border-style: solid;
    border-width: thin;
    
    
	}
</style>


</head>
<body style="background-color: lightgrey">
	<%@include file="common.jsp"%>
	<%@include file="top.jsp"%>
<br><br><br><br><br><br><br><br>
	
<div class="container">
	<div class="row">	
		<div class="follower_post col-md-7 col-md-push-1">		
			<table border="1">
				<tr>
					<td rowspan="2">(사진)</td><td>NYC_Jenny</td>				
				</tr>
				<tr>
					<td>맛있는 저녁</td>
				</tr>
				<tr>
					<td colspan="2">
				<img alt="food" src="https://static.pexels.com/photos/5317/food-salad-restaurant-person.jpg" height="400px">
					</td>
				</tr>
				<tr>
					<td colspan="2">yeanaya, hanul120, hongeunii, eshim7, mitchkim48, shinyoung_h님이 좋아합니다</td>
				</tr>
				<tr>
					<td>hongeunii👍👏🏻👏🏻 way to go 잘먹고 건강한게 최고!</td>
				</tr>
				<tr>
					<td>yeanayapeter 엄청잘먹는걸로 ㅇㅠ명잖아요 ...</td>
				</tr>
				<tr>
					<td>clara.s.zhang@hongeunii 맞아맞아 건강이 우선!! 건강은 무조건 지키자!!🤓💪 건강을위해 적당히 먹어야할거같어😅</td>
				</tr>
				<tr>
					<td>clara.s.zhang@yeanaya 언니~ 피터 살이 너무 쪘어요. 모든 근육이 melted 되고 fat 으로 replaced...😅</td>
				</tr>
			</table>
		</div>	
		
		<div class="mywishlist_table col-md-3 col-md-push-1">
			<table border="1" style=" width:100%; font-size: 10pt"  >
				<tr ><th colspan="4">내 위시 리스트 테이블</th></tr>
				<tr>
					<td>상품명</td><td>가격</td><td>상품정보</td><td>예약중</td>
				</tr>
				<tr>
					<td>소가죽 벨트</td><td>120,000</td><td>고급 소가죽 벨트</td><td>예약중</td>
				</tr>
				<tr>
					<td>세모 부츠</td><td>110,000</td><td>디자인 좋은 세모 부츠</td><td>예약없음</td>
				</tr>
			</table>		
		</div>
	</div>	
	
	
<div class="row">	
	<div class="upcomingevent_table col-md-3 col-md-push-8">
		다가오는 EVENT LIST<br>
		다가오는 EVENT LIST<br>
		다가오는 EVENT LIST<br>
		다가오는 EVENT LIST<br>
		다가오는 EVENT LIST<br>
		다가오는 EVENT LIST<br>
	</div>
</div>
		
</div>
	
	<%@include file="bottom.jsp"%>
</body>
</html>