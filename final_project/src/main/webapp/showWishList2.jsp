<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="ssibal" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='resources/css/bootstrap.css' rel='stylesheet' />
<link href='resources/css/rotating-card.css' rel='stylesheet' />

<meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0' name='viewport' />
<link href="http://netdna.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<!-- <script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script> -->
<script src="resources/js/jquery-1.10.2.js" type="text/javascript"></script>
<script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
//String mno = "3"; //(String)session.getAttribute("w_mno");
	$().ready(function() {
		$('[rel="tooltip"]').tooltip();
	});
	
	function rotateCard(btn) {
		var $card = $(btn).closest('.card-container');
		console.log($card);
		if ($card.hasClass('hover')) {
			$card.removeClass('hover');
		} else {
			$card.addClass('hover');
		}
	}
</script>
<script>
	(function(i, s, o, g, r, a, m) {
		i['GoogleAnalyticsObject'] = r;
		i[r] = i[r] || function() {
			(i[r].q = i[r].q || []).push(arguments)
		}, i[r].l = 1 * new Date();
		a = s.createElement(o), m = s.getElementsByTagName(o)[0];
		a.async = 1;
		a.src = g;
		m.parentNode.insertBefore(a, m)
	})(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

	ga('create', 'UA-46172202-4', 'auto');
	ga('send', 'pageview');
	
	
	$(document).ready(function(){			//Parsing 정보 추가창에 입력
		$("#btnfetch").click(function(){
			$.ajax({
				type:"post",
				url:"urltest",
				data: {"url":$("#w_addr").val()},
				dataType: "json",
				success: function(productData){
					var w_pname, w_price, w_image, insimg, url ;
					
					var list = productData.productlist;
					$(list).each(function(index, objArr){
						w_pname  = objArr["name"];
						w_price = objArr["price"];
						w_image= objArr["image"];
						url = objArr["url"];
					});
					
					$("#w_pname").val(w_pname);
					$("#w_price").val(w_price);
					$("#w_image").attr("src", w_image);
					
				},
				error: function(){
					alert("에러 발생");
				}
			});
		});
	});
		
		$(document).ready(function(){									//insert후 카드 나열	
			$("#iteminsert").click(function(){
				//$("#iteminfo").submit();
				var w_addr, w_mno, w_pname, w_price, w_image, w_detail;
				w_mno = $("#w_mno").val();
				w_addr = $("#w_addr").val();
				w_pname = $("#w_pname").val();
				w_price = $("#w_price").val();
				w_image =$("#w_image").attr("src");
				w_detail = $("#w_detail").val();
				
				var array = {"w_addr":w_addr, "w_pname":w_pname, "w_price":w_price , "w_image":w_image , "w_detail":w_detail, "w_mno":w_mno };
				$.ajax({
					type:"post",
					url:"insertWishList",
					data:  array,
					dataType: "json",
					success: function(insertedData){
						//var w_addr, w_pname, w_price, w_image, w_detail;
						
						var str;
						var list = insertedData.insertedList;
						$(list).each(function(index, objArr){
							/*
							+ objArr["w_image"] +
							+ objArr["w_pname"] +
							+ objArr["w_pname"] +
							+ objArr["w_detail"] +
							+ objArr["w_price"] +
							*/
							
							str += "<div class='col-md-4 col-sm-6'>";
							str += "	<div class='card'>";
							str += "	<div class='front'>";
							str += "	<div class='cover' align='center'>";
							str += "	<img id='i_image' name='i_image'  src='" + objArr["w_image"] + "'/>";
							str += "	</div>";
							str += "	<div class='content'>";
							str += "	<div class='main'>";
							str += "	<h5 class='name motto'>" + objArr["w_pname"] + "</h5>";
							str += "	<p class='text-center col-md-8-offset-2'>실험삼아 아무거나 써보는 건데 한글은 안넘어 가는데 도대체가 영어는 카드를 넘어가냐?</p>";
							str += "	</div>";
							str += "	<div class='footer'>";
							str += "	<button class='btn btn-simple' onclick='rotateCard(this)''><i class='fa fa-mail-forward'></i> 수동 Rotation</button>";
							str += "	</div>";
							str += "	</div>";
							str += "	</div>";
							str += "	<div class='back'>";
							str += "	<div class='header'><h5 class='motto' id='i_pname'>"+ objArr["w_pname"] + "</h5></div>";
							str += "	<div class='content' style='padding-bottom: 30px'>";
							str += "	<div class='main' align='center'>";
							str += "	<textarea class='text-center col-md-12' id='i_detail' name='i_detail'  rows='6'  readonly='readonly'>" + objArr["w_detail"] + "</textarea>";
							str += "	<div class='stats-container col-md-12'>";
							str += "	<div class='stats'><p>가격</p><h4 id='i_price'>" + objArr["w_price"] + "</h4></div>";
							str += "	<div class='stats'><p>등록일</p><h4>114</h4></div>";
							str += "	<div class='stats'><p>추천</p><h4>35</h4></div>";
							str += "	</div></div></div>";
							str += "	<div class='footer'>";
							str += "	<button class='btn btn-simple' rel='tooltip' title='Flip Card' onclick='rotateCard(this)''><i class='fa fa-reply'></i> Back</button>";
							str += "	<div class='social-links text-center' >";
							str += "	<a href='javascript:void(0)' onclick='update('${s.w_pname}')'><i class='glyphicon glyphicon-edit'></i></a>";
							str += "	<a href='javascript:void(0)' onclick='del('${s.w_pname}', '${s.w_mno }')'><i class='glyphicon glyphicon-trash'></i></a>";
							str += "</div></div></div></div></div></div>";

						});
						
						$("#cardlist").append(str);
					},
					error:function(request,status,error){
				        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				       }
				     /*
					error: function(){
						alert("에러 발생");
					}
				       */
				});
			});
		
		
			$("#reset").click(function(){				//insert card reset시키기
				$("#w_mno").val("");
				$("#w_addr").val("");
				$("#w_pname").val("");
				$("#w_price").val("");
				$("#w_image").attr("src", "");
				$("#w_detail").val("");
			});
			
			
			
		});
		
		function del(pname, mno){
			alert(pname, mno);
			$("#deleteModal #itemMno").val(mno);
			$("#deleteModal #itemName").val(pname);
			$("#deleteModal").modal();
		}
		
		function update(pname){
			 $.ajax({
				type:"post",
				url:"showInsertedList",
				data:  {"w_pname":pname},
				dataType: "json",
				success: function(insertedData){
					//var w_addr, w_pname, w_price, w_image, w_detail;
					var w_no, w_addr, w_mno, w_pname, w_price, w_image, w_detail;
					
					var list = insertedData.insertedList;
					$(list).each(function(index, objArr){
						w_no = objArr["w_no"]
						w_image = objArr["w_image"];
						w_pname =  objArr["w_pname"];
						w_detail = objArr["w_detail"];
						w_price = objArr["w_price"];
						w_mno = objArr["w_mno"];
					});
					$("#itemNo").val(w_no);
					$("#itemName").val(pname);
					$("#itemDetail").val(w_detail);
					$("#itemPrice").val(w_price);
					$("#itemMno").val(w_mno);
					$("#updateModal").modal();
				},
				error: function(){
					alert("에러 발생");
				}
			}); 
		}
		
		
	
	
</script>
<style type="text/css">
.sss {
	height: auto;
	margin: auto;
	overflow: hidden;
	max-width: 1100px;
}

.sss input[type=text] {
	float: left;
	outline: none;
	height: 30px;
	width: calc(100% - 100px);
	align-self: center;
	border: none;
	padding: 0 0 0 10px;
	box-sizing: border-box;
	background-color: white;
	border-top-left-radius: 3px;
	border-bottom-left-radius: 3px;
}

.sss input[type=submit] {
	float: right;
	color: white;
	height: 30px;
	width: 100px;
	border: none;
	font-size: 14px;
	text-transform: uppercase;
	background-color: #4285f4;
	border-top-right-radius: 3px;
	border-bottom-right-radius: 3px;
}

.sss input[type=submit]:hover {
	cursor: pointer;
	background-color: #2a75f3;
}
</style>
<title>Insert title here</title>
</head>
<%@include file="common.jsp"%>
<%@include file="top.jsp"%>
<body>



	
	





<a href="showWishList?w_mno=3" >aaa</a>

	<div class="container">
		<div class="row">
			<div class="col-sm-10 col-sm-offset-1">

				<div id="cardlist"></div>
				
				<ssibal:forEach var="s" items="${wishlist}">
				<div class="col-md-4 col-sm-6">
					<div class="card-container manual-flip">
							<div class="card">
								<div class="front">
								
									<div class="cover" align="center">
										<img id="i_image" name="i_image"  src="${s.w_image }" />
									</div>
									<div class="content" >
										<div class="main" >
											<h5 class="name motto">${s.w_pname}</h5>
											<p class="text-center col-md-8-offset-2">
											실험삼아 아무거나 써보는 건데 한글은 안넘어 가는데 도대체가 영어는 카드를 넘어가냐?
											</p>
										</div>
										<div class="footer">
											<button class="btn btn-simple" onclick="rotateCard(this)">
												<i class="fa fa-mail-forward"></i> 수동 Rotation
											</button>
										</div>
									</div>
								</div><!-- end front panel -->

								<div class="back">
									<div class="header">
										<h5 class="motto" id="i_pname">${s.w_pname}</h5>
									</div>
									<div class="content" style="padding-bottom: 30px">
										<div class="main" align="center">
											<textarea class="text-center col-md-12" id="i_detail" name="i_detail"  rows="6"  readonly="readonly">${s.w_detail }</textarea>
											<!--<ssibal:set var="mno" value="${s.w_mno }"/>-->
											
											<div class="stats-container col-md-12">
												<div class="stats">
													<p>가격</p>
													<h4 id="i_price">${s.w_price }</h4>
												</div>
												<div class="stats">
													<p>등록일</p>
													<h4>114</h4>
												</div>
												<div class="stats">
													<p>추천</p>
													<h4>35</h4>
												</div>
											</div>
										</div>
									</div>
									<div class="footer" >
										<button class="btn btn-simple" rel="tooltip" title="Flip Card" onclick="rotateCard(this)"><i class="fa fa-reply"></i> Back</button>
										<div class="social-links text-center" >
											<a href="javascript:void(0)" onclick="update('${s.w_pname}')"><i class="glyphicon glyphicon-edit"></i></a>
											<a href="javascript:void(0)" onclick="del('${s.w_pname}', '${s.w_mno }')"><i class="glyphicon glyphicon-trash"></i></a>
										</div>
									</div>
								</div><!-- end back panel -->
							</div><!-- end card -->
					</div><!-- end card-container -->
				</div><!-- end col-sm-3 -->
				</ssibal:forEach>
				
				


				<div class="col-md-4 col-sm-6">
					<div class="card-container">
						
							<div class="card">
								<div class="front">
									<div class="cover" align="center">
										<img  src="resources/cardimg/add-icon.png" />
									</div>
									<!-- <div class="user">
										<img class="img-circle" src="resources/cardimg/add-icon.png" />
									</div> -->
									<div class="content">
										<div class="main">
											<h3 class="name">여기서 추가가 가능합니다</h3>
											<p class="profession">Product Manager</p>
											<p class="text-center">URL을 붙여넣으면 자동으로 정보가 입력됩니다</p>
										</div>
										<div class="footer">
											<div class="rating">
												<i class="fa fa-mail-forward"></i> 자동 Rotation
											</div>
										</div>
									</div>
								</div><!-- end front panel -->

								<div class="back">
									<div class="header">
										<label>URL</label>
										<div class="form-group sss">
											<input type="text" class="form-control" id="w_addr" name="w_addr" placeholder="URL" style="width: 180px"> 
											<input type="button" value="Fetch" class="form-control" id="btnfetch" style="width: 60px">
										</div>
									</div><br>
									<div class="content">
										<div class="main">
											<label for="exampleInputName2">ITEM 정보</label>
											<form class="has-success" ><!--id="iteminfo" name="iteminfo" action="insertWishList" method="post"  -->
												<div class="row">
													<div class="col-md-7">
														<div class="form-group">
															<input type="text" id="w_pname" name="w_pname" class="form-control" aira-describedby="helpBlock2" placeholder="Item Name" >
															<span id="helpBlock2" class="help-block"></span>  
															<input type="text" id="w_price" name="w_price" class="form-control"  placeholder="price" >
															<!--<input type="hidden" class="form-control" id="w_addr" name="w_addr">-->
															<input type="hidden" id="w_mno" name="w_mno" value="${mno}">
														</div>
													</div>
													<div class="col-md-5">
														<img id="w_image" name="w_image" class="img-responsive" alt="Responsive image">
													</div>
												</div>
												<br>

												<div class="row">
													<div class="col-md-12">
														<textarea class="form-control" id="w_detail" name="w_detail" rows="4"></textarea>
													</div>
												</div>
											</form>

										</div>
									</div>
									<div class="footer">
										<div class="social-links text-center">
											<a href="javascript:void(0);" id="iteminsert" name="iteminsert"><i class="glyphicon glyphicon-ok-circle"></i></a>
											<a href="javascript:void(0);" id="reset" name="reset"><i class="glyphicon glyphicon-repeat"></i></a>
										</div>
									</div>
								</div><!-- end back panel -->
							</div><!-- end card -->
							
					</div><!-- end card-container -->
				</div><!-- end col-sm-3 -->


			</div><!-- end col-sm-10 -->
		</div><!-- end row -->
		<div class="space-200"></div>
	</div>

<!-- 수정모달 팝업 BEGINNING-->
<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="updateModalLabel" aria-hidden="true" >
		<div class="modal-dialog" role="document" >
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="updateModalLabel">수정</h4>
				</div>
				<div class="modal-body">
					<form action="updateWishList" method="post">
						<div class="form-group">
							<label class="form-control-label">Item Name:</label>
							<input type="text" class="form-control" id="itemName" name="w_pname">
						</div>
						<div class="form-group">
							<label class="form-control-label">Item Price:</label>
							<input type="text" class="form-control" id="itemPrice" name="w_price">
						</div>
						<div class="form-group">
							<label for="message-text" class="form-control-label">Rewrite Your Item Detail:</label>
							<textarea class="form-control" id="itemDetail" name="w_detail"></textarea>
							<input type="hidden" id="itemMno" name="w_mno">
							<input type="hidden" id="itemNo" name="w_no">
						</div>
						<div class="modal-footer">
							<button type="submit" class="btn btn-primary" id="updateconfirm">Confirm</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
<!-- 수정모달 팝업 END-->

<!-- 삭제 모달 팝업 BEGINNING -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true" >
		<div class="modal-dialog" role="document" >
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="deleteModalLabel">삭제?</h4>
				</div>
				<div class="modal-body">
					<form action="deleteWishList" method="get">
						<div class="form-group">
							<input type="hidden" id="itemMno" name="w_mno">
							<input type="hidden" id="itemName" name="w_pname">
						</div>
						<button type="submit" class="btn btn-primary" id="deleteconfirm">Confirm</button>
						<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
					</form>
				</div>
			</div>
		</div>
	</div>
<!-- 삭제 모달 팝업 END -->



</body>

<%@include file="bottom.jsp"%>
 
</html>