<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</head>

<%@include file="common.jsp"%>
<%@include file="top.jsp"%>

<body>
	<div class="container col-md-5 col-md-offset-3">
		<div class="row">
			<div class="col-md-12">
				<div class="thumbnail">
					<div class="list-group">
						<a class="list-group-item list-group-item-action active">
							<h2 class="list-group-item-heading">나의 소원 목록</h2>
						</a>
					</div>

					<div class="panel-group" id="accordion">
					
					<c:forEach var="wgroup" items="${wishgroup }">							
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a class="accordion-toggle" data-toggle="collapse"
										data-parent="#accordion" href="#collapseTwo"> 
										${wgroup.wg_detail}</a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse">
								<div class="panel-body">
									<!-- ---------각 상품 내용일 들어갈 자리-----------  -->
									<table>
									<c:forEach var="wlist" items="${wishlist }">	
										<tr>
											<td>상품명</td><td>가격</td><td>상세정보</td>
										</tr>
										<tr>
											<td>${wlist.w_pname}</td><td>${wlist.w_price}</td><td>${wlist.w_detail}</td>
										</tr>								
									</c:forEach>
									</table>		
								</div>
							</div>
						</div>
						</c:forEach>
						
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a class="accordion-toggle" data-toggle="collapse"
										data-parent="#accordion" href="#collapseThree">
										새로운 소원목록 작성하기</a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse">
								<div class="panel-body">
								
								<form action="insertWishGroup" method="get">
									<div class="input-group">
										<input type="text" name="wg_detail" class="form-control" placeholder="새로운 소원목록명...">
										<input type="hidden" name="wg_mno" value="<%=session.getAttribute("mno") %>">
										<span class="input-group-btn">
										<button class="btn btn-default" id="wishgroup_submit" type="button">추가</button>
										</span>
									</div><!-- /input-group -->
								</form>
								
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
<%@include file="bottom.jsp"%>
</html>