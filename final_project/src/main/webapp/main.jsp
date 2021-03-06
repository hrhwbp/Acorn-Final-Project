<%@page import="com.remind.model.BoardDto"%>
<%@page import="com.remind.model.LikeDto"%>
<%@page import="com.remind.model.ReplyDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE PUBLIC>
<html>
<head>
<meta charset="UTF-8">
<title>ReMind : [RE:AD MIND]</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
var lastbno_save = null;
$(document).ready(function () {
   $(window).bind("scroll",scrolling);
   $('form').bind("keypress", function(e) {
	   if (e.keyCode == 13) {               
	     e.preventDefault();
	     return false;
	   }
	 });
});

function scrolling(){ 
	var documentHeight  = $(document).height() * 2 - 1200;
	var scrollHeight = $(window).scrollTop()+$(window).height();
	
	if(scrollHeight >= documentHeight) {
		var lastbno = $(".thumbnail:last").attr("data-bno");	
		if(lastbno_save != lastbno){  
		lastbno_save = lastbno;
		$.ajax({ // 스크롤링 
			
			type:"get",
			url:"scroll",
			dataType:"json",
			data:{"last_bno":lastbno},
			success:function(scrollData){
				/* console.log("실행중") */
				var str = "";
				var list = scrollData.datas;
				$(list).each(function(index,objArr){
					
					str += '<div class="row">';
			        str += '<div class="col-md-12">';
			        str += '	<div class="thumbnail" data-bno='+this.b_no+' >';
			       	str += '<div class="thumbnail-wrapper1">' +
							'<div class="thumbnail1" style="background-color: #000;">' +
							'<div class="centered1">';
			        str += '       <img src='+objArr["b_image"]+' class="landscape1">' +
			        		'</div></div></div>';
			        
			        str += '       <div class="caption">';
			        str += '       <div class="row">';
			        str += '          <div class="col-md-12">';
			        str += '			<form action="friendinfo" id="friend'+objArr["b_no"]+'" method="post">';
					str += '				<input type="hidden" name="m_no" value="'+objArr["b_mno"]+'">';
					str += '          <h3><a href="javascript:;"  onclick="gofriend('+objArr["b_no"]+')">'+objArr["b_mname"]+'</a></h3></form>';
			        str += '          <p>'+objArr["b_content"]+'</p>';
			        str += '          </div>';
			        str += '       </div>';
			        //라이크
			        var should_split = this.like_mname;
			        var like_view = "";
			        var n = should_split.split(',');
			        //console.log("자를 문자열 길이 : " + should_split.length);
			        //console.log("이름 숫자 길이 :" + n.length);
			        if (n == 0) {
						like_view = "처음 좋아요의 주인공이 되세요";
					}else if (n > 11){
						like_view = n.length + "명 이상 좋아합니다"
					}else{
						for (var i = 0; i < n.length; i++) {
							like_view += n[i] + "&nbsp;&nbsp; ";
						}
						like_view += '님이 좋아합니다';
					}
			        
			        str += '<div class="row">';
			        str += '	<div class="col-md-12">';
			        str += '		&nbsp;<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp;';
			        str += '		<span id="showlike'+this.b_no+'">';
			        str += ''+like_view+'';
			        str += '		</span>';
			        str += '	</div>';
			        str += '</div>';
					//댓글
					var reply_Mno = this.reply_Mno;
					var reply_Name = this.reply_Name;
					var reply_Content = this.reply_Content;
					var reply_Count = this.reply_Count;
					var reply_name_view = reply_Name.split(',');
					var reply_content_view = reply_Content.split(',');
                    var reply_Mno_view = reply_Mno.split(',');
			        str += '<div class="row">';
					str += '	<div class="col-md-12">';
					str += '		<div id="showreply'+this.b_no+'">';
					str += '			<table class="table-condensed small" style="background-color: rgb(245, 245, 245); width: 100%">';
					if (reply_Count > 5) {
					str += '				<tr>';
					str += '					<td><a href="javascript:;" onclick="showReplyMore('+this.b_no+')">show reply all</a></td>';
					str += '				</tr>';
					}
					for (var i in reply_name_view) {
						str += '				<tr>';
                        str += '<td><a href="friendinfo?m_no=' + reply_Mno_view[i] + '">'+ reply_name_view[i]+'</a> '+reply_content_view[i]+'</td>';
						str += '				</tr>';
					}
					str += '			</table>';
					str += '		</div>';
					str += '	</div>';
					str += '</div>';
			        //like Yn
			        str += '<div class="row top_pd">';
					str += '	<form action="insertReply" method="post" id="reply'+this.b_no+'"';
					str += '			name="reply">';
					str += '		<div class="col-md-12">';
					str += '			<div class="input-group">';
					str += '				<span class="input-group-addon " id="sizing-addon2">';
					var likeYnCheck = this.likeYnCheck;
					if (likeYnCheck >= 1) {
						str += '<span class="glyphicon glyphicon-heart" onclick="likecancel('+this.b_no+')" style="color: red" id="likeYN'+this.b_no+'"></span>';
					}else {
						str += '<span class="glyphicon glyphicon-heart" onclick="likesubmit('+this.b_no+')" id="likeYN'+this.b_no+'"></span>';
					}
					str += '				</span> <input type="text" class="form-control"';
					str += '				placeholder="답글달기..." aria-describedby="sizing-addon2"';
					str += '				name="r_content" id="r_content'+this.b_no+'"> <input';
					str += '				type="hidden" name="r_bno" value="'+this.b_no+'"> <input';
					str += '				type="hidden" name="r_mno" value="'+${mno}+'">'; 
//												<!-- 답글 버튼 --> 
					str += '				<span class="input-group-btn">';
					str += '				<button class="btn btn-default" type="button"';
					str += '				id="btn_reply" onclick="replySubmit('+this.b_no+')">답글</button>';
					str += '			</span>'; 
				//								<!-- 답글 버튼 끝 -->  
					str += '		</div>';
					str += '	</div>';
							//
					str += '	</form>';
					str += '</div>';
			        //
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

      }
   }
}
function anniAjax(){
	alert("dd");
}

   function replySubmit(no){

      if($( "#r_content"+no ).val() == ""){
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
               str += "<td><a href='#'>" + objArr.r_name +"</a>&nbsp;"+ objArr.r_content + "</td>";
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
                    str += "<td><a href='friendinfo?m_no=" + objArr.r_mno + "'>" + objArr.r_name +"</a>"+ objArr.r_content + "</td>";
    				str += "</tr>";
    			})
    			str += "</table>";
    			jQuery("#showreply"+b_no).html(str);
    			jQuery("#r_content"+b_no).val("");
    		}
    	});
    }	

    function gofriend(b_no){
       jQuery("#friend"+b_no).submit();
       
       
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
.thumbnail-wrappper1 {
    width: 25%; 
}

.thumbnail1 {
    position: relative;
    padding-top: 75%;  /* 1:1 ratio */
    overflow: hidden;
}

.thumbnail1 .centered1  {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    -webkit-transform: translate(50%,50%);
    -ms-transform: translate(50%,50%);
    transform: translate(50%,50%);
}

.thumbnail1 .centered1 img {
    position: absolute;
    top: 0;
    left: 0;   
    max-width: 100%;
    height: auto;
    -webkit-transform: translate(-50%,-50%);
    -ms-transform: translate(-50%,-50%);
    transform: translate(-50%,-50%);
}

.thumbnail1 img.portrait1 {
  width: 100%;
  max-width: none;
  height: auto;
}
.thumbnail1 img.landscape1 {
  width: auto;
  max-width: none;
  height: 100%;
}

</style>
</head>
<%@include file="common.jsp"%>
<%@include file="top.jsp"%>
<%@include file="sidebar.jsp"%>


<body style="background-color: white">

	<div style="padding-top: 2%">
		<!--Top menubar와의 거리 2% -->
		
		<div class="container col-md-5 col-md-offset-0 " id="scrollingId" style="padding-top: 1%; padding-bottom: 2%">
			<c:forEach var="list" items="${list }">
				<div class="row">
					<div class="col-md-12">
						<div class="thumbnail" data-bno="${list.b_no }">
							<div class="thumbnail-wrapper1" >
    							<div class="thumbnail1" style="background-color: #000;">
    								<div class="centered1">
										<img alt="" src="${list.b_image}" class="landscape1">
									</div>
								</div>
							</div>
							<div class="caption">
								<div class="row">
									<div class="col-md-12">
										<form action="friendinfo" id="friend${list.b_no }" method="post">
										<input type="hidden" name="m_no" value="${list.b_mno }">
										<h3><a href="javascript:;"  onclick="gofriend(${list.b_no })">${list.b_mname}</a></h3>
										</form>
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
													<td><a href="javascript:;" onclick="showReplyMore(${list.b_no })">show reply all</a></td>
												</tr>
												<%
													}
														for (ReplyDto dto : reply) {
												%>
												<tr>
                                                    <td><a href="friendinfo?m_no=<%=dto.getR_mno()%>"><%=dto.getR_name()%></a> <%=dto.getR_content()%></td>
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
													%> <span class="glyphicon glyphicon-heart" onclick="likecancel(${list.b_no})" style="color: red" id="likeYN${list.b_no }"></span> <%
 													} else {
 													%> <span class="glyphicon glyphicon-heart" onclick="likesubmit(${list.b_no})" id="likeYN${list.b_no }"></span>
													<%
														}
													%>
												</span> <input type="text" class="form-control"
													placeholder="답글달기..." aria-describedby="sizing-addon2"
													name="r_content" id="r_content${list.b_no}" onkeydown="javascript:if(event.keyCode==13){replySubmit(${list.b_no})}"> <input
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
   
   <!-- 이벤트일 표시 DIV -->
   <div class="container col-md-3 col-md-offset-1">
      <div class="col-md-3 " role="complementray">
         <div class="row">
            <div class="col-md-10 col-md-offset-2">
               <nav class="bs-docs-sidebar hidden-print hidden-xs affix"  style="background-color: rgb(153,102, 000); opacity: 0.8; padding-top: 5px; padding-left: 20px; padding-right: 20px; padding-bottom: 20px; border-radius: 10px;">
                  
                     <table style="color: white;">
                     <tr><th colspan="2">생일</th></tr>
                        <c:forEach var="anni" items="${anniversary}">                     
                        <c:if test="${anni.a_detail eq '생일'}">
                     <tr>
                        <td>D-${anni.a_dday }</td><td><a href="showWishList?w_mno=${anni.a_mno}" style="color: rgb(153,255,153)">${anni.a_mname }</a><br/></td><!-- rgb(000,000,000)/검은색 진함 , rgb(051,051,051)/회색느낌 , rgb(051,000,051)/갈색 느낌  -->
                           </tr>					<!-- rgb(000,051,000)//회색에 녹색섞인 느낌  , rgb(255,000,255)//핑크 , rgb(102,255,102) 녹색, rgb(153,255,153) // 연녹 ( 크리스마스 느낌? ) *추천  ,,, 색상은 더 굴려봐야 할듯-->
                              </c:if>
                              </c:forEach>
                           <tr><td colspan="2">&nbsp;</td></tr>
                           <tr><th colspan="2">다른날</th></tr>
                           <jsp:useBean id="now" class="java.util.Date" />
                           <fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
                             
                           <c:forEach var="anni" items="${anniversary}">
                           <fmt:parseDate var="date" value="${anni.a_date}" pattern="yyyy-MM-dd" />
                           <fmt:formatDate value="${date }" pattern="yyyy-MM-dd" var="day" />
                     <c:if test="${anni.a_detail ne '생일'}">
                     <c:if test="${day >= today}">
                     <tr>
                        <td>D-${anni.a_dday }</td>
                        <td><a href="showWishList?w_mno=${anni.a_mno}" style="color: rgb(153,255,153)">${anni.a_mname }</a>의 ${anni.a_detail}<br/></td>
                           </tr>
                           </c:if>
                           </c:if>
                           </c:forEach>
                           <tr><td colspan="2"><a href="anniversary"  style="color: rgb(153,255,153)">기념일 더보기</a></td></tr>
                           </table>
                     </nav>               
            </div>
         </div>
      </div>
   </div>
   <!-- 이벤트일 표시 DIV 끝-->
   
   
   
   
   
   
   
   
   
   <!-- 게시물이 없으면  -->
   <c:set var="listSizeTest" value="${fn:length(list)}" />
   <c:if test="${listSizeTest == 0}">
   <script type="text/javascript">
      console.log("게시물 없음")
   </script>
   </c:if>

</body>

<%@include file="bottom.jsp"%>
</html>