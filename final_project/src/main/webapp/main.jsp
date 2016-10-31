<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE PUBLIC>
<html>
<head>
<meta charset="UTF-8">
<title>ReMind : [RE:AD MIND]</title>
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
   <div class="container col-md-5 col-md-offset-0 " style="background-color: rgb(250, 250, 250); padding-top: 1%">
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
                     yeanaya, hanul120, hongeunii, eshim7, mitchkim48, shinyoung_h님이
                     좋아합니다.
                  </div>
               </div>
               <div class="row">
                  <div class="col-md-12">
                     <table class="table-condensed small" style="background-color: rgb(245, 245, 245); width: 100%">
                    <c:forEach var="re" items="${reply }">
                    <c:if test="${list.b_no == re.r_bno }">
                        <tr>
                           <td><a href="#">${re.r_name }</a> ${re.r_content }</td>
                        </tr>
                        </c:if>
                     </c:forEach>
                     </table>
                  </div>
               </div>
               <div class="row top_pd">
                  <div class="col-md-9">
                  <div class="input-group">
                     <span class="input-group-addon " id="sizing-addon2"><span class="glyphicon glyphicon-heart"></span></span> 
                        <input type="text" class="form-control" placeholder="답글달기..." aria-describedby="sizing-addon2">
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