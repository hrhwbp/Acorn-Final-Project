<%@page import="com.remind.model.LikeDto"%>
<%@page import="com.remind.model.ReplyDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE PUBLIC>
<html>
<head>
<meta charset="UTF-8">
<title>ReMind : [RE:AD MIND]</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		<c:forEach var="list" items="${list }">
	/* 	$.ajax({
			type:"post",
			url:"snslist",
			data:{"b_no":"${list.b_no}"},
			success:function(data){
				
				var like = data.likedata[0];
				var reply = data.replydata[0];
				
				var str = "<table class='table-condensed small' style='background-color: rgb(245, 245, 245); width: 100%'>"
				
				jQuery(reply).each(function(index, objArr){
					str += "<tr>";
					str += "<td><a href='#'>" + objArr.r_name +"</a>"+ objArr.r_content + "</td>";
					str += "</tr>";
				})
				str += "</table>";
				jQuery("#showreply${list.b_no}").html(str);
				
			},error:function(request,status,error){
		        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		       }
		}); */
		jQuery('a[name=replySubmit${list.b_no}]').click(function(){
			//$("#reply").submit();
			jQuery("#showreply${list.b_no}").empty();
			  
		$.ajax({
			type:"post",
			url:"insertReply",
			data:$("#reply${list.b_no}").serialize(),
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
				jQuery("#showreply${list.b_no}").html(str);
				jQuery("#r_content${list.b_no}").val("");
			}
		});
		});
		</c:forEach>
	});
	
	function likesubmit(b_no){
		
		jQuery("#showlike"+b_no).empty();
		
	
		jQuery.ajax({
			type:"post",
			url:"insertLike",
			data:{"b_no":b_no, "m_no":"${mno}"},
			dataType:'json',
			success:function(likeData){
				var list = likeData.datas;
				str = "";
				if(list.length() >11){
             	    str += list.size() + "명이 좋아합니다";
                   }
               else if(list.size()<=11){
            	   jQuery(list).each(function(index, objArr){
                      str += objArr.l_name + ",";
                     }) 
                     str += "님이 좋아합니다";
                   }
				jQuery("#showlike"+b_no).html(str);
				jQuery("#r_content" + b_no).val("");
			}
		});
    	
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
	<div style="padding-top: 2%">	<!--Top menubar와의 거리 2% -->
   <div class="container col-md-5 col-md-offset-0 " style="background-color: rgb(250, 250, 250); padding-top: 1%; padding-bottom:2%">

   
   	<c:forEach var="list" items="${list }">
   	
      <div class="row">
         <div class="col-md-12">
            <div class="thumbnail" >
               <img alt="food" src="${list.b_image}" height="400px">
               <div class="caption">
               <div class="row">
                  <div class="col-md-12">
                  <h3>${list.b_mname} </h3>
                  <p>${list.b_content}</p>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-12">
                     &nbsp;<span class="glyphicon glyphicon-heart" aria-hidden="true"></span>&nbsp;
                     	<%-- <c:forEach var = "like" items="${like }">
                     	<c:if test="${list.b_no	 == like.l_bno }">
            			${like.l_mname },
            			</c:if> 
            			</c:forEach>
            			님이  좋아합니다. --%>
            			
            			 <c:set var="like" value="like${list.b_no}" />
            			 <span id="showlike${list.b_no}">
                  <%List<LikeDto> like = (List<LikeDto>)request.getAttribute((String)pageContext.getAttribute("like")); %>
                  <%if(like.size() == 0){ %>
                  	처음 좋아요의 주인공이 되세요
                  <%}else if(like.size() >11){
                	  %>
                       <%=like.size() %>명이 좋아합니다
                       
                     <%}
                  else if(like.size()<=11){
                	  for(LikeDto dto:like){%>
                      <%=dto.getL_mname() %>,
                    <%}%>님이 좋아합니다<%}
                  
                  	%>
                  	</span>
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-12">
                  <div id="showreply${list.b_no}">
                  <c:set var="re" value="reply${list.b_no}" />
                  <%List<ReplyDto> reply = (List<ReplyDto>)request.getAttribute((String)pageContext.getAttribute("re")); %>
                     <table class="table-condensed small" style="background-color: rgb(245, 245, 245); width: 100%">
                    <%for(ReplyDto dto:reply){%>
                       <tr>
                           <td><a href="#"><%=dto.getR_name() %></a> <%=dto.getR_content() %></td>
                        </tr>
                       
                     <%} %>
                     </table>
                     </div>
                  </div>
               </div>
               <div class="row top_pd">
               <form action = "insertReply" method="post" id = "reply${list.b_no}" name = "reply">
                  <div class="col-md-9">
                  <div class="input-group">
                     <span class="input-group-addon " id="sizing-addon2">
                     <span class="glyphicon glyphicon-heart" onclick="likesubmit(${list.b_no})"></span></span> 
                        <input type="text" class="form-control" placeholder="답글달기..." aria-describedby="sizing-addon2" name="r_content" id = "r_content${list.b_no}">
                        <input type="hidden" name="r_bno" value="${list. b_no}">
                        <input type="hidden" name="r_mno" value="${mno }">
                  </div>
                  </div>
                  <div class="col-md-3">
                  <a href="javascript:;" name = "replySubmit${list.b_no }" class="btn btn-default col-md-12" role="button">답글</a>
                  </div>
                  </form>
               </div>
               </div>
            </div>
         </div>
      </div>
      </c:forEach>
   </div>
   </div>
    <div class="container col-md-3 col-md-offset-1" >
      <div class="col-md-3 " role="complementray">
         <div class="row">
            <div class="col-md-10 col-md-offset-2">
               <nav class="bs-docs-sidebar hidden-print hidden-xs affix">
                  <ul class="nav bs-docs-sidenav text-right">
                     <li>${mno }현재 이벤트현재 이벤트현재 이벤트현재 이벤트</li>
					
                  </ul>
               </nav>
            </div>
         </div>

      </div>
   </div>
   
</body>
<%@include file="bottom.jsp"%>
</html>