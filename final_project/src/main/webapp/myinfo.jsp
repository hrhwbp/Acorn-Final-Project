<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%@ include file="common.jsp" %>
<%@ include file="top.jsp" %>
<script type="text/javascript">

$(function () {
    $('[data-toggle="popover"]').popover()
})

</script>
<body class="body_pd modal-open">
<div class="container"  style="padding-top: 2%">
<div class="row" style="background-color: rgb(253,253,253); padding-top: 30px; padding-bottom: 30px">
	<div class="col-md-2 col-md-offset-2">
		<img src="resources/image/image-h.jpg" alt="Responsive image" class="img-circle img-responsive">
	</div>
	<div class="col-md-6">
		<div class="row">
		<div class="col-md-12">
			<div class="col-md-6">
				<blockquote>
				  <p>aaafdsafdsafdsafdsas</p>
				</blockquote>
			</div>
			<div class="col-md-3 col-md-offset-1 top_pd">
				<button type="button" class="btn btn-default col-md-12">프로필 변경</button>
			</div>		
		
		</div>
		</div>
		<div class="row">
			
			<button type="button" class="btn btn-link col-md-3" disabled="disabled">게시물 100개</button> 
			<button type="button" class="btn btn-link col-md-3">팔로워 431명</button>
			<button type="button" class="btn btn-link col-md-3">팔로우 143명</button>
		
		</div>
	</div>
</div>
<div class="row" style="background-color: rgb(253,253,253);"><!-- row  -->
<div class="col-md-10 col-md-offset-1">
  <div class="col-md-4">
    <div class="thumbnail">
      <img src="https://static.pexels.com/photos/5317/food-salad-restaurant-person.jpg" alt="...">
      <div class="caption">
        <h3>맛있는 식사</h3>
        <p>...</p>
        <p class="text-right"><button type="button" class="btn btn-link">더 보기</button></p>
      </div>
    </div>
  </div>
  <div class="col-md-4">
    <div class="thumbnail">
      <img src="https://static.pexels.com/photos/5317/food-salad-restaurant-person.jpg" alt="...">
      <div class="caption">
        <h3>Thumbnail label</h3>
        <p>...</p>
        <p class="text-right"><button type="button" class="btn btn-link">더 보기</button></p>
      </div>
    </div>
  </div>
 
	
	
</div>	
</div> <!-- row -->
</div>





</body>
<%@ include file="bottom.jsp" %>
</html>