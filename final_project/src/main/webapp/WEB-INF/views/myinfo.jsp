<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyInfo</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

</head>

<%@ include file="../../top.jsp" %>
<body style="">
<div class="container">
<div class="container"  style="padding-top: 2%; padding-bottom: 5%">
<div class="row" style="background-color: rgb(253,253,253); padding-top: 30px; padding-bottom: 30px">
	<div class="col-md-2 col-md-offset-2">
		<button style="color: buttontext; border: 0; cursor: pointer; height: 100%; padding: 0; width: 100%;" data-toggle="modal" data-target="#imageUp">
		<img src="resources/image/${myinfo.m_image }" alt="Responsive image" class="img-circle img-responsive" style="width: 100%">
		</button>
	</div>
	<div class="col-md-6">
		<div class="row">
		<div class="col-md-12">
			<div class="col-md-6">
				<blockquote>
				  <p>${myinfo.m_name}</p>
				</blockquote>
			</div>
			<div class="col-md-3 col-md-offset-1 top_pd">
				<button type="button" class="btn btn-default col-md-12" data-toggle="modal" data-target="#updateInfo">프로필 변경</button>
			</div>		
		
		</div>
		</div>
		<div class="row">
			
			<button type="button" class="btn btn-link col-md-3" disabled="disabled">게시물 100개</button> 
			<button type="button" class="btn btn-link col-md-3">팔로워 ${fn:length(mylist)}</button>
			<button type="button" class="btn btn-link col-md-3">팔로우 ${fn:length(ilist)}</button>
		
		</div>
	</div>
</div>
<div class="row" style="padding-bottom: 2%">
	<div class="col-md-10 col-md-offset-1">
		<button type="button" class="btn btn-link col-md-12" style="background-color: rgb(255,230,231);"><h4><span class="glyphicon glyphicon-plus"></span>&nbsp;&nbsp;&nbsp;게시물 추가하기</h4></button>
	</div>
</div>

<div class="row" style="background-color: rgb(253,253,253);"><!-- row  -->
<div class="col-md-10 col-md-offset-1">
  <c:forEach var="board" items="${board}">  
  <div class="col-md-4">
    <div class="thumbnail">
    	<div class="row" style="height: 190px;">
		   <img src="${board.b_image }" alt="Responsive image" class="img-responsive center-block" style="height: 100%">
    	</div>
      <div class="caption">
        <h3>${board.b_content }</h3>
        <p>좋아요 ${board.b_like}개</p>
        <p class="text-right"><button type="button" class="btn btn-link" data-toggle="modal" data-target="#myModal">더 보기</button></p>
      </div>
    </div>
  </div>
  </c:forEach>
  
  <div class="col-md-4">
    <div class="thumbnail">
    	<div class="row" style="height: 190px;">
		   <img src="http://pix.iemoji.com/images/emoji/apple/ios-9/256/heavy-plus-sign.png" alt="Responsive image" class="img-responsive center-block" style="height: 100%">
    	</div>
      <div class="caption">
        <h3>Thumbnail label</h3>
        <p>...</p>
        <p class="text-right"><button type="button" class="btn btn-link" data-toggle="modal" data-target="#myModal">더 보기</button></p>
      </div>
    </div>
  </div> 
	
	
</div>	
</div> <!-- row -->
</div>


	<!-- 프로필 수정 모달 -->
	<div class="modal fade" id="updateInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog" style="margin: 150px auto;">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
		
			<div class="row">
				<div class="col-md-4 col-md-offset-4 text-center">
				<div style="color: buttontext; border: 0; cursor: pointer; height: 180px; padding: 0; width: 100%;">
					<a  onclick="$('#file').click();">
					<img id="image" src="resources/image/image-h.jpg" alt="Responsive image" class="img-circle img-responsive" style="height: 100%; width: 100%">
					</a>
	      			<input type="file" id="file" class="sr-only" name="m_image">
				</div>
				</div>
				
			</div>
	     </div>
		<form>
	      	<div class="modal-body">
				<div class="row">
					<div class="col-md-12">
						<label for="Email1">E-mail</label>
						<input type="email" class="form-control" id="Email1" placeholder="${myinfo.m_email}" readonly="readonly">
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label for="name">이름</label>
						<input type="text" class="form-control" id="name" value="${myinfo.m_name }" required>
					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<label for="inputOldPassword" class="">현재 비밀번호</label> 
						<input type="password" id="inputOldPassword" class="form-control" placeholder="Password" required>					
					</div>
				</div>
				<div class="row form-group">
						<div class="col-md-2">
							
						</div>
						<div class="col-md-4 top_pd text-right">
							<c:set var="date" value="${myinfo.m_bdate}"/>
							<label class="">년도</label>
							<jsp:useBean id="toDay" class="java.util.Date" />
							<fmt:formatDate value="${toDay}" var = "viewYear" pattern="yyyy" />
							<select class="form-control" name="year">
								<option>${fn:substring(date,0,4) }</option>
								<c:forEach var="i" begin="0" end ="100" step="1">
								<option>${viewYear -i }</option>
								</c:forEach>

							</select>
						</div>

						<div class="col-md-3 top_pd text-right">
							<label class="">월</label> 
							<select class="form-control" name="month">
								<option>${fn:substring(date,5,7) }</option>
								<c:forEach var="i" begin="1" end ="12" step="1">
								<option>${i}</option>
								</c:forEach>
							</select>
						</div>

						<div class="col-md-3 top_pd text-right">
							<label class="" for="ss">일</label> 
							<select id="ss" name="day"
								class="form-control" >
								<option>${fn:substring(date,8,10) }</option>
								<c:forEach var="i" begin="1" end ="31" step="1">
								<option>${i}</option>
								</c:forEach>
							</select>
						</div>
					</div>
	      	</div>
	    	<div class="modal-footer">
	    	<button class="btn btn-primary" type="submit">Save changes</button>
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</form>
		
	    </div>
	  </div>
	</div>
	<!-- 모달 팝업 -->
	
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<div class="row">
				<div class="col-md-12">
					<img alt="Responsive image" class="img-responsive" src="https://static.pexels.com/photos/5317/food-salad-restaurant-person.jpg">
				</div>
			</div>
	      </div>
	      <div class="modal-body">
	      <div class="row">	      
			<h3 class="col-md-12">맛있는 식사</h3>
			<p class="col-md-6">좋아요 138개</p><p class="text-right col-md-6">2016-10-31 20:29:55</p>
	      </div>
	      </div>
	      <div class="modal-footer">
		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
		<button type="button" class="btn btn-primary">Save changes</button>
	      </div>
	    </div>
	  </div>
	</div>


	<!-- 모달 팝업 -->
	<div class="modal fade" id="imageUp" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-body">
	      <div class="row">
	      
	      </div>
	      </div>
	    </div>
	  </div>
	</div>
	
	
</div> <!-- container -->
<script>
var upload = document.getElementById('file'),
 	image = document.getElementById('image');
upload.onchange = function (e) {
  e.preventDefault();
  var file = upload.files[0],
      reader = new FileReader();
  reader.onload = function (event) {
    image.src = event.target.result;
  };
  reader.readAsDataURL(file);
};
</script>
</body>
<%@ include file="../../bottom.jsp" %>
</html>