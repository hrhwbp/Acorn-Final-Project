<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html style="margin-bottom: 0;">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


<!-- Bootstrap core CSS common.jsp에 있음-->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link
	href="http://getbootstrap.com/assets/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<!-- Custom styles for this template -->


<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="http://getbootstrap.com/assets/js/ie-emulation-modes-warning.js"></script>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 -->
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
.tt-query, /* UPDATE: newer versions use tt-input instead of tt-query */
.tt-hint {
    width: 396px;
    height: 30px;
    padding: 8px 12px;
    font-size: 24px;
    line-height: 30px;
    border: 2px solid #ccc;
    border-radius: 8px;
    outline: none;
}

.tt-query { /* UPDATE: newer versions use tt-input instead of tt-query */
    box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
}

.tt-hint {
    color: #999;
}

.tt-menu { /* UPDATE: newer versions use tt-menu instead of tt-dropdown-menu */
    width: 422px;
    margin-top: 12px;
    padding: 8px 0;
    background-color: #fff;
    border: 1px solid #ccc;
    border: 1px solid rgba(0, 0, 0, 0.2);
    border-radius: 8px;
    box-shadow: 0 5px 10px rgba(0,0,0,.2);
}
/* .tt-menu.img-circle{
	width:5%;
} */

.tt-suggestion {
    padding: 3px 20px;
    font-size: 18px;
    line-height: 24px;
}

.tt-suggestion.tt-is-under-cursor { /* UPDATE: newer versions use .tt-suggestion.tt-cursor */
    color: #fff;
    background-color: #0097cf;

}

.tt-suggestion p {
    margin: 0;
}

</style>
<script src="//twitter.github.io/typeahead.js/releases/latest/typeahead.bundle.js"></script>
<script type="text/javascript">
	function myinfo() {
		$("#info").submit();
	}
	$( document ).ready(function(){
		$('#friendSearch').typeahead(null,{
			source: function(query, syncResults, asyncResults) {
			    $.get('searching?name='+query, function(data) {
			        asyncResults(data);
			      });
			    },
		    templates: {
				    empty: [
				      '<div class="empty-message">',
				        '친구가 없습니다.',
				      '</div>'
				    ].join('\n'),
				    suggestion: function(data){
				       html = "<div><img src='http://wbp.synology.me/profileimg/" + data.m_image + "' class='img-circle' style='width:10%;'/>";
				        html +="<strong>" + data.m_email + "</strong> - " + data.m_name + "</div>";
				        return html;
				    },
				  }
			})
			jQuery('#friendSearch').on('typeahead:selected', function (e, datum) {
				console.log(datum.m_no);
				 var idx = $('<input type="hidden" value="'+datum.m_no+'" name="m_no">');
				 $("#gofr").append(idx);
    			 $("#gofr").submit(); 
    			
			});
	})
	
</script>
</head>
<body
	style="padding-top: 70px; background-image: url('resources/image/giftshredpapernewnew1.jpg');">
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.jsp"><span
					class="glyphicon glyphicon-gift" aria-hidden="true">RE:MIND</span></a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="snslist"><span
							class="glyphicon glyphicon-home" aria-hidden="true"></span></a></li>
					<li><a
						href="showWishList?w_mno=<%=session.getAttribute("mno")%>"><span
							class="glyphicon glyphicon-gift" aria-hidden="true"></span></a></li>
					<li><a href="javascript:myinfo()"><span
							class="glyphicon glyphicon-user" aria-hidden="true"></span></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Dropdown <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li role="separator" class="divider"></li>
							<li class="dropdown-header">Nav header</li>
							<li><a href="#">Separated link</a></li>
							<li><a href="#">One more separated link</a></li>
						</ul></li>
				</ul>
 				<form class="navbar-form navbar-left" id="searchfr">
					<div class="form-group">
						<div class="ui-widget">
						<input type="text" id="friendSearch" name="friendSearch"
								data-provide="typeahead" placeholder="친구찾기">
						</div>
					</div>
				</form>
				<form id="gofr" action="friendinfo" method="post">
				
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="../navbar/">Default</a></li>
					<li><a href="../navbar-static-top/">Static top</a></li>
					<%
						if (session.getAttribute("mno") != null) {
					%>
					<li><a href="logout">LogOut <span class="sr-only">(current)</span></a></li>
					<%
						} else {
							response.sendRedirect("index.jsp");
						}
					%>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>
	<form action="myinfo" method="post" id="info">
		<input type="hidden" name="m_no"
			value="<%=session.getAttribute("mno")%>">
	</form>
	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!--     Placed at the end of the document so the pages load faster
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
	<!-- <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script> -->
	<!-- <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script> -->
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script
		src=http://getbootstrap.com/assets/js/ie10-viewport-bug-workaround.js></script>

</body>
</html>