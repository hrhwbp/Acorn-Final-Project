<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE PUBLIC>
<html>
<head>
<meta charset="UTF-8">
<title>ReMind : [RE:AD MIND]</title>
<style type="text/css">

body {
	background-color: white;	
}
body .container{
	background-color: rgb(250, 250, 250)
}
.row .col-md-12 .table-condensed{
	background-color: rgb(245, 245, 245); 
	/* width: 100%" */
}

.container col-md-3{
	padding-top: 15%;
}


</style>


</head>
<%@include file="common.jsp"%>
<%@include file="top.jsp"%>
<body>
	<div class="container col-md-5 col-md-offset-3">
		<div class="row">
			<div class="col-md-12">
				<div class="thumbnail">

					<img alt="food"
						src="https://static.pexels.com/photos/5317/food-salad-restaurant-person.jpg"
						height="400px">

					<div class="caption">
						<div class="row">
							<div class="col-md-12">
								<h3>NYC_Jenny</h3>
								<p>맛있는 저녁</p>
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								&nbsp;<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp;
								yeanaya, hanul120, hongeunii, eshim7, mitchkim48, shinyoung_h님이
								좋아합니다.
							</div>
						</div>
						<div class="row">
							<div class="col-md-12">
								<table class="table-condensed small">
									<tr>
										<td><a href="#">hongeunii👍👏🏻👏🏻</a> way to go 잘먹고
											건강한게 최고!</td>
									</tr>
									<tr>
										<td><a href="#">yeanayapeter</a> 엄청잘먹는걸로 ㅇㅠ명잖아요 ...</td>
									</tr>
									<tr>
										<td><a href="#">clara.s.zhang@hongeunii</a> 맞아맞아 건강이 우선!!
											건강은 무조건 지키자!!🤓💪 건강을위해 적당히 먹어야할거같어😅</td>
									</tr>
									<tr>
										<td><a href="#">clara.s.zhang@yeanaya</a> 언니~ 피터 살이 너무
											쪘어요. 모든 근육이 melted 되고 fat 으로 replaced...😅</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="row top_pd">
							<div class="col-md-9">
								<div class="input-group">
									<span class="input-group-addon " id="sizing-addon2"><span
										class="glyphicon glyphicon-heart"></span></span> <input type="text"
										class="form-control" placeholder="답글달기..."
										aria-describedby="sizing-addon2">
								</div>
							</div>
							<div class="col-md-3">
								<a href="#" class="btn btn-default col-md-12" role="button">답글</a>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container col-md-3 col-md-offset-1" style="padding-top: 15%;">
		<div class="col-md-3 " role="complementray">
			<div class="row">
				<div class="col-md-10 col-md-offset-2">
					<nav class="bs-docs-sidebar hidden-print hidden-xs affix">
						<ul class="nav bs-docs-sidenav text-right">
							<li>${mno}현재 이벤트현재 이벤트현재 이벤트현재 이벤트</li>

						</ul>

					</nav>
				</div>
			</div>

		</div>
	</div>
</body>
<%@include file="bottom.jsp"%>
</html>