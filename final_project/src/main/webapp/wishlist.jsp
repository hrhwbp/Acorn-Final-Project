<%@page import="com.remind.model.DataDao"%>
<%@page import="com.remind.model.WishlistDto"%>
<%@page import="java.util.List"%>
<%@page import="com.remind.controller.WishlistBean"%>
<%@page import="com.fasterxml.jackson.annotation.JsonInclude.Include"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ReMind : [RE:AD MIND]</title>

<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script type="text/javascript">
	$(document).ready(function() {
		
		
		$("#btn_wishgroup_submit").click(function() {
			//alert("hi");
			if ($("#wg_detail").val() == "") {
				alert("새로운 목록의 이름을 넣어주세요!");
			} else {
				document.wishGroupForm.action = "insertWishGroup";
				document.wishGroupForm.method = "post";
				document.wishGroupForm.submit();
			}
		});
	});
	
	function groupEdit(wg_no){
    	//alert("Edit");
		
    }
	
	//function groupDelete(wg_no){
		//alert("Delete");
	//}
	
</script>

</head>

<%@include file="common.jsp"%>
<%@include file="top.jsp"%>

<body>
	<div class="container col-md-8 col-md-offset-2">
		<div class="row">
			<div class="col-md-12">
				<div class="thumbnail">
					<div class="list-group">
						<a class="list-group-item list-group-item-action active">
							<h2 class="list-group-item-heading">나의 소원 목록</h2>
						</a>
					</div>
					<!-- ------------------------------소원목록 어코디언------------------------------------- -->
					<div class="panel-group" id="accordion">

						<!-- ----------------새로운 소원목록 작성-------------------------- -->
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a class="accordion-toggle" data-toggle="collapse"
										data-parent="#accordion" href="#collapseThree"> 새로운 소원목록
										작성하기</a>
								</h4>
							</div>
							<div id="collapseThree" class="panel-collapse collapse">
								<div class="panel-body">

									<form name="wishGroupForm">
										<div class="input-group">
											<input type="text" name="wg_detail" id="wg_detail"
												class="form-control" placeholder="새로운 소원목록명..."> <input
												type="hidden" name="wg_mno" id="wg_mno"
												value="<%=session.getAttribute("mno")%>"> <input
												type="hidden" name="w_mno" id="w_mno"
												value="<%=session.getAttribute("mno")%>"> <span
												class="input-group-btn">
												<button class="btn btn-default" id="btn_wishgroup_submit"
													type="button">추가</button>
											</span>
										</div>
										<!-- /input-group -->
									</form>

								</div>
							</div>
						</div>
						<!-- ----------------새로운 소원목록 작성 끝------------------------ -->

						<!-- ---------------기존 등록된 소원목록 뽑기----------------------- -->
						<c:forEach var="wgroup" items="${wishgroup }">
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<table width="100%">
											<tr>
												<td width="86%"><a class="accordion-toggle"
													data-toggle="collapse" data-parent="#accordion"
													href="#collapseTwo_${wgroup.wg_no}">
														${wgroup.wg_detail}</a>
									</h4>

									</td>
									<td width="92px">
										<!-- 버튼그룹 삽입 -->
										<div class="btn-group btn-group-margin-right" role="group"
											aria-label="...">
											<div class="btn-group" role="group">
												<button type="button" id="btn_groupEdit" onclick="groupEdit(${wgroup.wg_no})" data-toggle="modal" data-target="#myModal" class="btn btn-default btn-sm">수정</button>
											</div>
											<div class="btn-group" role="group">
												<button type="button" id="btn_groupDelete" onclick="groupDelete(${wgroup.wg_no})" class="btn btn-default btn-sm">삭제</button>
											</div>
										</div> 
										<!-- 버튼그룹 삽입 끝 -->
									</td>
									</tr>
									</table>


								</div>
								<div id="collapseTwo_${wgroup.wg_no}"
									class="panel-collapse collapse">
									<div class="panel-body">
										<!-- ---------각 상품 내용이 들어갈 자리-----------  -->
										<table border="1"  width="100%">
											<c:set var="cnt" value="0" />
											<c:forEach var="wlist" items="${wishlist }">
												<c:if test="${wgroup.wg_no eq wlist.g_num}">
													<c:set var="cnt" value="${cnt += 1 }" />
													<c:if test="${cnt == 1 }">
														<tr>
															<td width="30%">상품명</td>
															<td width="20%">가격정보</td>
															<td width="50%">상세정보</td>
														</tr>
													</c:if>
													<tr>
														<td>${wlist.w_pname}</td>
														<td>${wlist.w_price}</td>
														<td>${wlist.w_detail}</td>
													</tr>
												</c:if>
											</c:forEach>
										</table>
											<%-- <c:if test="${wgroup.wg_no == null}"> --%>
											<c:if test="${cnt == 0}">
												<p>새로운 물품을 추가하세요</p>
											</c:if>
									</div>
								</div>
							</div>
						</c:forEach>
						<!-- ---------------기존 등록된 소원목록 뽑기 끝------------------------ -->
								
						<!-- ----------Modal----------- -->
					  <div class="modal fade" id="myModal" role="dialog">
					    <div class="modal-dialog">
					    
					      <!-- Modal content-->
					      <div class="modal-content">
					        <div class="modal-header">
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					          <h4 class="modal-title">Modal Header</h4>
					        </div>
					        <div class="modal-body">
					          <p>Some text in the modal.</p>
					        </div>
					        <div class="modal-footer">
					          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					        </div>
					      </div>
					      
					    </div>
					  </div>
						<!-- ----------Modal 끝----------- -->
						
						
						
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
<%@include file="bottom.jsp"%>
</html>