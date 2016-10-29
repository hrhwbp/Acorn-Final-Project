<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="common.jsp"%>
	<%@include file="top.jsp"%>

	<div class="container col-md-5 col-md-offset-3">
		<div class="row">
			<div class="col-md-12">
				<div class="thumbnail">
					<div class="list-group">
						<a class="list-group-item list-group-item-action active">
							<h2 class="list-group-item-heading">MY WISH LIST</h2>							
						</a> 
					</div>
					<div class="list-group">
						<a href="#" class="list-group-item list-group-item-action">
							<h5 class="list-group-item-heading">2016년 생일 리스트	</h5>
							<p class="list-group-item-text">2016년 생일을 맞아 작성한 리스트.</p>
						</a> 
						<a href="#" class="list-group-item list-group-item-action">
							<h5 class="list-group-item-heading">2016년 크리스마스 리스트</h5>
							<p class="list-group-item-text">미리 미리 크리스마스를 준비하자!!!</p>
						</a> 
					</div>

					<button type="button" class="btn btn-default btn-lg">
						<span class="glyphicon glyphicon-plus" aria-hidden="false"></span>
						추가하기
					</button>
					<button type="button" class="btn btn-default btn-lg">
						<span class="glyphicon glyphicon-trash" aria-hidden="false"></span>
						삭제하기
					</button>
					<button type="button" class="btn btn-default btn-lg">
						<span class="glyphicon glyphicon-plus" aria-hidden="false"></span>
						추가하기
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
<%@include file="bottom.jsp"%>
</html>