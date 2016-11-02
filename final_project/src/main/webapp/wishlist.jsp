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
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a class="accordion-toggle" data-toggle="collapse"
										data-parent="#accordion" href="#collapseOne"> 새로운 소원목록
										작성하기 </a>
								</h4>
							</div>
							<div id="collapseOne" class="panel-collapse collapse in">
								<div class="panel-body">
									<img alt="추가"
										src="http://cdn.mysitemyway.com/etc-mysitemyway/icons/legacy-previews/icons/blue-jelly-icons-signs/090638-blue-jelly-icon-signs-first-aid.png"
										height="50"><br>
									<div class="btn-group btn-group-justified" role="group"
										aria-label="...">
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-default">Left</button>
										</div>
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-default">Middle</button>
										</div>
										<div class="btn-group" role="group">
											<button type="button" class="btn btn-default">Right</button>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a class="accordion-toggle" data-toggle="collapse"
										data-parent="#accordion" href="#collapseTwo"> Collapsible
										Group Item #2 </a>
								</h4>
							</div>
							<div id="collapseTwo" class="panel-collapse collapse">
								<div class="panel-body">Anim pariatur cliche
									reprehenderit, enim eiusmod high life accusamus terry
									richardson ad squid. 3 wolf moon officia aute, non cupidatat
									skateboard dolor brunch. Food truck quinoa nesciunt laborum
									eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
									it squid single-origin coffee nulla assumenda shoreditch et.
									Nihil anim keffiyeh helvetica, craft beer labore wes anderson
									cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
									vice lomo. Leggings occaecat craft beer farm-to-table, raw
									denim aesthetic synth nesciunt you probably haven't heard of
									them accusamus labore sustainable VHS.</div>
							</div>
						</div>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a class="accordion-toggle" data-toggle="collapse"
										data-parent="#accordion" href="#collapseThree">
										Collapsible Group Item #3 </a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse">
								<div class="panel-body">Anim pariatur cliche
									reprehenderit, enim eiusmod high life accusamus terry
									richardson ad squid. 3 wolf moon officia aute, non cupidatat
									skateboard dolor brunch. Food truck quinoa nesciunt laborum
									eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on
									it squid single-origin coffee nulla assumenda shoreditch et.
									Nihil anim keffiyeh helvetica, craft beer labore wes anderson
									cred nesciunt sapiente ea proident. Ad vegan excepteur butcher
									vice lomo. Leggings occaecat craft beer farm-to-table, raw
									denim aesthetic synth nesciunt you probably haven't heard of
									them accusamus labore sustainable VHS.</div>
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