<%@page import="com.remind.model.LikeDto"%>
<%@page import="com.remind.model.ReplyDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE PUBLIC>
<html>
<head>
<meta charset="UTF-8">
<title>ReMind : [RE:AD MIND]</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
var lastbno_save = null;
$(document).ready(function () {
	$(window).bind("scroll",scrolling);  
	//console.log(dd)
});

function scrolling(){ 
	var documentHeight  = $(document).height() * 2 - 1200;
	var scrollHeight = $(window).scrollTop()+$(window).height();
	//console.log ("documentHeight : " + documentHeight) 
	//console.log ("scrollHeight : " + scrollHeight)

	if(scrollHeight >= documentHeight) {
		var lastbno = $(".thumbnail:last").attr("data-bno");
		if(lastbno_save != lastbno){  // 동기화로 바꿈으로서 반드시 들어가야함 ( 안들어갈시 버벅거림 )  //  1.
			
		lastbno_save = lastbno;
		//console.log("last_bno : " + lastbno)
		//console.log(lastbno_save)
		$.ajax({
			type:"get",
			url:"scroll",
			dataType:"json",
			data:{"last_bno":lastbno},
			async : false,
			success:function(scrollData){
				
				var str = "";
				var list = scrollData.datas;
				$(list).each(function(index,objArr){
					str += '<div class="row">';
			        str += '<div class="col-md-12">';
			        str += '	<div class="thumbnail" data-bno='+this.b_no+' >';
			        str += '       <img alt="food" src='+objArr["b_image"]+' height="400px">';
			        str += '       <div class="caption">';
			        str += '       <div class="row">';
			        str += '          <div class="col-md-12">';
			        str += '          <h3>'+objArr["b_mname"]+'</h3>';
			        str += '          <p>'+objArr["b_content"]+'</p>';
			        str += '          </div>';
			        str += '       </div>';
			        str += '</div>';
					str += '</div>';
					str += '</div>';
					str += '</div>';

				});
				$("#scrollingId").append(str)
				
			},
			error:function(){
				console.log("scroll 이벤트 실패")
			}
		});	
		}  //  1.

	}

	function replySubmit(no){

		if($( "input[name$='r_content']" ).val() == ""){
			alert("댓글에 내용을 써주세요");
			return;
		}else{
		
		$.ajax({
			type:"post",
			url:"insertReply",
			data:$("#reply"+no).serialize(),
			dataType:'json',
			success:function(replyData){
				var str = "<table class='table-condensed small' style='background-color: rgb(245, 245, 245); width: 100%'>"
				var list = replyData.datas;
				var count = replyData.count;
				if(count>5){
					str += '<tr><td> <a href="javascript:;" onclick= "showReplyMore('+no+')">show reply all</a></td></tr>'
				}
					jQuery(list).each(function(index, objArr){
					str += "<tr>";
					str += "<td><a href='#'>" + objArr.r_name +"</a>"+ objArr.r_content + "</td>";
					str += "</tr>";
				})
				str += "</table>";
				jQuery("#showreply"+no).html(str);
				jQuery("#r_content"+no).val("");
			}
		
		});
		}
	}
		

	function likesubmit(b_no){
			jQuery.ajax({
			type:"post",
			url:"insertLike",
			data:{"l_bno":b_no, "l_mno":"${mno}"},
			dataType:'json',
			success:function(likeData){
				var list = likeData.datas;
				var count = likeData.likecount
				str = "";
				if(count >11){
             	    str += count + "명이 좋아합니다";
                   }
               else if(count<=11){
            	   jQuery(list).each(function(index, objArr){
                      str += objArr.l_name + "&nbsp&nbsp";
                     }) 
                     str += "님이 좋아합니다";
                   }
				jQuery("#showlike"+b_no).html(str);
				jQuery("#likeYN"+b_no).attr({style:'color: red'});
				jQuery("#likeYN"+b_no).attr({onclick:'likecancel('+b_no+')'})
		}
    })
	}
	function likecancel(b_no){
			jQuery.ajax({
			type:"post",
			url:"cancelLike",
			data:{"l_bno":b_no, "l_mno":"${mno}"},
			dataType:'json',
			success:function(likeData){
				var list = likeData.datas;
				var count = likeData.likecount
				str = "";
				if(count == 0){
					str +="처음 좋아요의 주인공이 되세요";
				}else if(count >11){
             	    str += count + "명이 좋아합니다";
                   }
               else if(count<=11){
            	   jQuery(list).each(function(index, objArr){
                      str += objArr.l_name + " ";
                     }) 
                     str += "님이 좋아합니다";
                   }
				jQuery("#showlike"+b_no).html(str);
				jQuery("#likeYN"+b_no).removeAttr("style");
				jQuery("#likeYN"+b_no).attr({onclick:'likesubmit('+b_no+')'})
			}
		});
	}
    function showReplyMore(b_no){
    	$.ajax({
    		type:"post",
    		url:"moreReply",
    		data:{"b_no":b_no},
    		dataType:'json',
    		success:function(replyData){
    			var str = "<table class='table-condensed small' style='background-color: rgb(245, 245, 245); width: 100%'>"
    			var list = replyData.datas;
    			jQuery(list).each(function(index, objArr){
    				str += "<tr>";
    				str += "<td><a href='#'>" + objArr.r_name +"</a>"+ objArr.r_content + "</td>";
    				str += "</tr>";
    			})
    			str += "</table>";
    			jQuery("#showreply"+b_no).html(str);
    			jQuery("#r_content"+b_no).val("");
    		}
    	});
    }	
}
    
	
</script>
<style type="text/css">
.follower_post {
	position: relative;
	left: 5%;
	top: 50%;
}

.mywishlist_table {
	background-color: lightblue;
	border: black;
	border-style: solid;
	border-width: thin;
}

.upcomingevent_table {
	background-color: pink;
	border: black;
	border-style: solid;
	border-width: thin;
}
</style>
</head>
<%@include file="common.jsp"%>
<%@include file="top.jsp"%>
<%@include file="sidebar.jsp"%>

<body style="background-color: white">

	<div style="padding-top: 2%">
		<!--Top menubar와의 거리 2% -->
		
		<div class="container col-md-5 col-md-offset-0 " id="scrollingId"
			style="background-color: rgb(250, 250, 250); padding-top: 1%; padding-bottom: 2%">
			<c:forEach var="list" items="${list }">
				<div class="row">
					<div class="col-md-12">
						<div class="thumbnail" data-bno="${list.b_no }">
							<img alt="food" src="${list.b_image}" height="400px">
							<div class="caption">
								<div class="row">
									<div class="col-md-12">
										<h3>${list.b_mname}</h3>
										<p>${list.b_content}</p>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										&nbsp;<span class="glyphicon glyphicon-heart"
											aria-hidden="true"></span>&nbsp;
										<c:set var="like" value="like${list.b_no}" />
										<span id="showlike${list.b_no}"> <%	List<LikeDto> like = (List<LikeDto>) request.getAttribute((String) pageContext.getAttribute("like")); %>
											<% if (like.size() == 0) {
											%> 처음 좋아요의 주인공이 되세요 <%
												} else if (like.size() > 11) {
											%> <%=like.size()%>명이 좋아합니다 <%
											 	} else if (like.size() <= 11) {
 													for (LikeDto dto : like) {
 												%> <%=dto.getL_mname()%>&nbsp;
											<% }
											%>님이 좋아합니다<%
												}
											%>
										</span>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div id="showreply${list.b_no}">
											<c:set var="re" value="reply${list.b_no}" />
											<c:set var="recount" value="replycount${list.b_no}" />
											<%
												List<ReplyDto> reply = (List<ReplyDto>) request.getAttribute((String) pageContext.getAttribute("re"));
											%>
											<table class="table-condensed small"
												style="background-color: rgb(245, 245, 245); width: 100%">
												<%
													if ((Integer) request.getAttribute((String) pageContext.getAttribute("recount")) > 5) {
												%>
												<tr>
													<td><a href="javascript:;"
														onclick="showReplyMore(${list.b_no })">show reply all</a></td>
												</tr>
												<%
													}
														for (ReplyDto dto : reply) {
												%>
												<tr>
													<td><a href="#"><%=dto.getR_name()%></a> <%=dto.getR_content()%></td>
												</tr>
												<%
													}
												%>
											</table>
										</div>
									</div>
								</div>
								<div class="row top_pd">
									<form action="insertReply" method="post" id="reply${list.b_no}"
										name="reply">
										<div class="col-md-12">
											<div class="input-group">
												<span class="input-group-addon " id="sizing-addon2">
													<c:set var="likeYN" value="likeYN${list.b_no}" /> <%
 													int likeYN = (Integer) request.getAttribute((String) pageContext.getAttribute("likeYN"));
 													%>
													<%
														if (likeYN >= 1) {
													%> <span class="glyphicon glyphicon-heart"
													onclick="likecancel(${list.b_no})" style="color: red"
													id="likeYN${list.b_no }"></span> <%
 													} else {
 													%> <span
													class="glyphicon glyphicon-heart"
													onclick="likesubmit(${list.b_no})" id="likeYN${list.b_no }"></span>
													<%
														}
													%>
												</span> <input type="text" class="form-control"
													placeholder="답글달기..." aria-describedby="sizing-addon2"
													name="r_content" id="r_content${list.b_no}"> <input
													type="hidden" name="r_bno" value="${list. b_no}"> <input
													type="hidden" name="r_mno" value="${mno }"> 
												<!-- 답글 버튼 --> 
												<span class="input-group-btn">
													<button class="btn btn-default" type="button"
														id="btn_reply" onclick="replySubmit(${list.b_no })">답글</button>
												</span> 
												<!-- 답글 버튼 끝 -->  
											 </div>
										</div>
										<%-- <div class="col-md-3">
                  <a href="javascript:;" onclick= "replySubmit(${list.b_no })" class="btn btn-default col-md-12" role="button">답글</a>
                  </div> --%>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div class="container col-md-3 col-md-offset-1">
		<div class="col-md-3 " role="complementray">
			<div class="row">
				<div class="col-md-10 col-md-offset-2">
					<nav class="bs-docs-sidebar hidden-print hidden-xs affix">
						<ul class="nav bs-docs-sidenav text-right">
							
							<c:forEach var="anni" items="${anniversary}">
                  
                     <li>${anni.a_date}는 <a href="showWishList?w_mno=${anni.a_mno}">${anni.a_mname }</a>님의 ${anni.a_detail }입니다.<n/></li>
                     
                   </c:forEach>
							
						</ul>
					</nav>
				</div>
			</div>

		</div>
	</div>

	

</body>
<%@include file="bottom.jsp"%>
</html>