<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>BLOCKS - Bootstrap Dashboard Theme</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Carlos Alvarez - Alvarez.is">

<link rel="stylesheet" type="text/css" href="resources/admin/bootstrap/css/bootstrap.min.css" />

<link href="resources/admin/css/main.css" rel="stylesheet">
<link href="resources/admin/css/font-style.css" rel="stylesheet">
<link href="resources/admin/css/flexslider.css" rel="stylesheet">

<script type="text/javascript" src="resources/admin/js/jquery.js"></script>
<script src="https://code.jquery.com/jquery-2.2.4.min.js" integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44=" crossorigin="anonymous"></script>    
<script type="text/javascript" src="resources/admin/bootstrap/js/bootstrap.min.js"></script>

<!-- <script type="text/javascript" src="resources/admin/js/lineandbars.js"></script> -->
<script type="text/javascript" src="resources/admin/js/gauge.js"></script>
	
<!-- NOTY JAVASCRIPT -->
<script type="text/javascript" src="resources/admin/js/noty/jquery.noty.js"></script>
<script type="text/javascript" src="resources/admin/js/noty/layouts/top.js"></script>
<script type="text/javascript" src="resources/admin/js/noty/layouts/topLeft.js"></script>
<script type="text/javascript" src="resources/admin/js/noty/layouts/topRight.js"></script>
<script type="text/javascript" src="resources/admin/js/noty/layouts/topCenter.js"></script>
	
<!-- You can add more layouts if you want -->
<script type="text/javascript" src="resources/admin/js/noty/themes/default.js"></script>
<!-- <script type="text/javascript" src="assets/js/dash-noty.js"></script> This is a Noty bubble when you init the theme-->
<script type="text/javascript" src="http://code.highcharts.com/highcharts.js"></script>
<script src="resources/admin/js/jquery.flexslider.js" type="text/javascript"></script>

<script type="text/javascript" src="resources/admin/js/admin.js"></script>
<!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
   
<!-- Google Fonts call. Font Used Open Sans & Raleway -->
<link href="http://fonts.googleapis.com/css?family=Raleway:400,300" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css">

<style type="text/css">
body {
	padding-top: 60px;
}
</style>
<script type="text/javascript">


//첫번째 차트
function chart1(man, woman) {
	
	var tot = man + woman;
	//alert(man + " " + woman);
	//alert(tot);
	
	var w = Math.floor(woman/tot*100);
	var m =  Math.floor(man/tot*100);
	//alert(w + " " + m);
	//int m =man, w=woman;
	var nn = 20;
	info = new Highcharts.Chart({
		chart: {
			renderTo: 'load',
			margin: [0, 0, 0, 0],
			backgroundColor: null,
            plotBackgroundColor: 'none',
		},
		title: {
			text: null
		},
		tooltip: {
			formatter: function() { 
				return this.point.name +': '+ this.y +' %';
			} 	
		},
	    series: [
			{
			borderWidth: 2,
			borderColor: '#F1F3EB',
			shadow: false,	
			type: 'pie',
			name: 'Income',
			innerSize: '65%',
			data: [
				{ name: '남자', y: m, color: '#b2c831' },
				{ name: '여자', y: w, color: '#3d3d3d' }
			],
			dataLabels: {
				enabled: false,
				color: '#000000',
				connectorColor: '#000000'
			}
		}]
	});
	
}

// 두번째 차트
function chart2() {
	info = new Highcharts.Chart({
		chart: {
			renderTo: 'space',
			margin: [0, 0, 0, 0],
			backgroundColor: null,
            plotBackgroundColor: 'none',
		},
		title: {
			text: null
		},
		tooltip: {
			formatter: function() { 
				return this.point.name +': '+ this.y +' %';
			} 	
		},
	    series: [
			{
			borderWidth: 2,
			borderColor: '#F1F3EB',
			shadow: false,	
			type: 'pie',
			name: 'SiteInfo',
			innerSize: '65%',
			data: [
				{ name: 'Used', y: 80.0, color: '#fa1d2d' },
				{ name: 'Rest', y: 20.0, color: '#3d3d3d' }
			],
			dataLabels: {
				enabled: false,
				color: '#000000',
				connectorColor: '#000000'
			}
		}]
	});
	
}

    $(document).ready(function () {
        $("#btn-blog-next").click(function () {
            $('#blogCarousel').carousel('next')
        });
        $("#btn-blog-prev").click(function () {
            $('#blogCarousel').carousel('prev')
        });

        $("#btn-client-next").click(function () {
            $('#clientCarousel').carousel('next')
        });
        $("#btn-client-prev").click(function () {
            $('#clientCarousel').carousel('prev')
        });
    });

    $(window).load(function () {
        $('.flexslider').flexslider({
            animation: "slide",
            slideshow: true,
            start: function (slider) {
                $('body').removeClass('loading');
            }
        });
        
       
        
    });
    
//시계 ***   
function printClock(){
	//alert(man + " 시계에서 확인" + woman);
	var clock;            							
	var currentDate = new Date();                   // 현재시간
	var calendar = currentDate.getFullYear() + "-" + (currentDate.getMonth()+1) + "-" + currentDate.getDate() // 현재 날짜
	var amPm = 'AM'; // 초기값 AM
	var currentHours = addZeros(currentDate.getHours(),2); 
	var currentMinute = addZeros(currentDate.getMinutes() ,2);
	var currentSeconds =  addZeros(currentDate.getSeconds(),2);
	        
	if(currentHours >= 12){ // 시간이 12보다 클 때 PM으로 세팅, 12를 빼줌
		amPm = 'PM';
		currentHours = addZeros(currentHours - 12,2);
	}

	if(currentSeconds >= 50){// 50초 이상일 때 색을 변환해 준다.
		currentSeconds = '<span style="color:#de1951;">'+currentSeconds+'</span>'
	}
	
	clock = currentHours+":"+currentMinute+":"+currentSeconds +" <span style='font-size:50px;'>"+ amPm+"</span>"; //날짜를 출력해 줌
	$(".clockcenter digiclock").html(clock);	// 출력할 장소 선택
	
	setTimeout("printClock()",1000);         	// 1초마다 printClock() 함수 호출
}

function addZeros(num, digit) { // 자릿수 맞춰주기
	var zero = '';
	num = num.toString();
	if (num.length < digit) {
		for (i = 0; i < digit - num.length; i++) {
			zero += '0';
		}
	}
	return zero + num;
}
//*** 시계      

//차트 ***
function stockChart(name, url){
	function generateNumber(min, max) {
		min = typeof min !== 'undefined' ? min : 1;
		max = typeof max !== 'undefined' ? max : 100;
		return Math.floor((Math.random() * max) + min);
	}
	
	var chart,
		categories = ['Categorie 1', 'Categorie 2', 'Categorie 3', 'Categorie 4', 'Categorie 5','Categorie 6', 'Categorie 7', 'Categorie 8', 'Categorie 9', 'Categorie 10', 'Categorie 11', 'Categorie 12', 'Categorie 13', 'Categorie 14', 'Categorie 15', 'Categorie 16', 'Categorie 17', 'Categorie 18', 'Categorie 19','Categorie 20', 'Categorie 21','Categorie 22', 'Categorie 23', 'Categorie 24', 'Categorie 25', 'Categorie 26', 'Categorie 27', 'Categorie 28', 'Categorie 29', 'Categorie 30'],
		serie1 = [13, 13, 46, 61, 23, 12, 24, 16, 14, 12, 12, 24, 19, 13, 11, 11, 14, 11, 11, 11, 11, 13, 22, 10, 18, 15, 24, 31, 19, 10],
		serie2 = [52, 41, 58, 63, 55, 46, 45, 41, 38, 54, 50, 39, 48, 70, 63, 60, 58, 63, 83, 89, 83, 79, 83, 100, 104, 108, 52, 46, 83, 89],
		$aapls;
  	
	$(document).ready(function() {
		chart = new Highcharts.Chart({
			chart: {
			renderTo: 'importantchart',
				type: 'column',
				backgroundColor: 'transparent',
				height: 140,
				marginLeft: 3,
				marginRight: 3,
				marginBottom: 0,
				marginTop: 0
			},
			title: {
			text: ''
			},
			xAxis: {
				lineWidth: 0,
				tickWidth: 0,
				labels: { 
					enabled: false 
				},
				categories: categories
			},
			yAxis: {
				labels: { 
					enabled: false 
				},
				gridLineWidth: 0,
				title: {
					text: null,
				},
			},
			series: [{
				name: 'Awesomness',
				data: serie1
			}, {
				name: 'More Awesomness',
				color: '#fff',
				type: 'line',
				data: serie2
			}],
			credits: { 
				enabled: false 
			},
			legend: { 
				enabled: false 
			},
			plotOptions: {
				column: {
					borderWidth: 0,
					color: '#b2c831',
					shadow: false
				},
				line: {
					marker: { 
						enabled: false 
					},
					lineWidth: 3
				}
      		},
			tooltip: { 
				enabled: false
			}
		});
		
		setInterval(function(){
			chart.series[0].addPoint(generateNumber(), true, true);
			chart.series[1].addPoint(generateNumber(50, 150), true, true);
			new stockStatus(serie1[0]);
		}, 1000);
		
		setInterval(function() {
			$('.info-aapl span').each(function(index, elem) {
				$(elem).animate({
					height: generateNumber(1, 40)
				});
			});
	
		}, 3000);
		
		setInterval(function(){
			new articleUpdate(name, url);
		}, 6000);
		
	});
}


//***주식 현황
var prenum = 0;
var defprice = 1200;
function stockStatus(num){
	
	if(prenum < num){
		var dif = num-prenum;
		var stat = defprice + num;
		//alert(stat);
		$("div #stockstatus").html(
			'<p><img src="resources/admin/images/up.png" alt="" style="width: 40px; height: 40px;"><bold>Up</bold> | ' + dif + '.</p>'		
		);
		$("div #totcost").html(
				'<i class="graph-arrow"></i><span class="graph-info-big" id="totcost">'+ stat +'원</span>'	
		);
		
		//$("span #difcost").val(dif);
		//alert("up");
		
	}else if(prenum > num){
		var dif = prenum-num;
		var stat = defprice + num;
		//alert(stat);
		$("div #stockstatus").html(
			'<p><img src="resources/admin/images/down.png" alt="" style="width: 40px; height: 40px;"><bold>Up</bold> | ' + dif + '.</p>'		
		);
		$("div #totcost").html(
			'<i class="graph-arrow"></i><span class="graph-info-big" id="totcost">'+ stat +'원</span>'	
		);
		
		//$("span #difcost").val(dif);
		/* <span class="graph-info-small" id="difcost"></span> */
		//alert("down");
	}
	prenum=num;	
}

//Article Update
function articleUpdate(name, url){
	//alert(name + " 검사 " + url)
	$("#url2").html("<a href='" + url + "'>" + name + "</a>");
}

</script>    
</head>
<body onload="printClock(), chart1(${man},${woman}), chart2(), stockChart('${articleName}','${articleUrl}')">
	
  	<!-- NAVIGATION MENU -->
	<div class="navbar-nav navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="index.html"><img src="resources/admin/images/logo30.png" alt=""> BLOCKS Dashboard</a>
			</div> 
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="MainAdmin"><i class="icon-home icon-white"></i> Home</a></li>                            
					<li><a href="showAdminTable"><i class="icon-th icon-white"></i> Tables</a></li>
					<li><a href="showadminTable"><i class="icon-lock icon-white"></i> Login</a></li>
					<li><a href="user.html"><i class="icon-user icon-white"></i> User</a></li>
				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</div>

	<!--Admin Profile  -->
	<div class="container">
		<div class="row">
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
	      			<dtitle>User Profile</dtitle><hr>
					<div class="thumbnail">
						<img src="resources/admin/images/face80x80.jpg" alt="Marcel Newman" class="img-circle">
					</div><!-- /thumbnail -->
					<h1>Create by Sim </h1>
					<h3>Seoul, Korea</h3><br>
					<div class="info-user">
						<span aria-hidden="true" class="li_user fs1"></span>
						<span aria-hidden="true" class="li_settings fs1"></span>
						<span aria-hidden="true" class="li_mail fs1"></span>
						<span aria-hidden="true" class="li_key fs1"></span>
					</div>
				</div>
			</div>

			<!-- DONUT CHART BLOCK -->
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<dtitle>Site Bandwidth</dtitle><hr>
					<div id="load"></div>
					<h2>성별 비율</h2>
				</div>
			</div>

			<!-- DONUT CHART BLOCK -->
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<dtitle>Disk Space</dtitle><hr>
					<div id="space"></div>
					<h2>65%</h2>
				</div>
			</div>
        
        
			<div class="col-sm-3 col-lg-3">
				<div class="half-unit">
					<dtitle>현재시간</dtitle><hr>
					<div class="clockcenter">
						<digiclock></digiclock>
					</div>
				</div>

				<!-- SERVER UPTIME -->
				<div class="half-unit">
					<dtitle>주가 현황</dtitle><hr>
					<div class="cont" id="stockstatus">
						<p><img src="resources/admin/images/up.png" alt="" style="width: 40px; height: 40px;"><bold></bold></p>
					</div>
				</div>
			</div>
			
		</div><!-- /row -->
      
      
		<!-- SECOND ROW OF BLOCKS -->     
		<div class="row">
			<div class="col-sm-3 col-lg-3">
			<!-- MAIL BLOCK -->
			<div class="dash-unit">
				<dtitle>Co-Founders</dtitle><hr>
					<div class="framemail">
						<div class="window">
							<ul class="mail">
								<li>
									<i class="unread"></i>
									<img class="avatar" src="resources/admin/images/photo01.jpeg" alt="avatar">
									<p class="sender">나</p>
									<p class="message"><strong>힘들어!!</strong>여따가 뭐 넣지??</p>
									<div class="actions">
										<a><img src="http://png-1.findicons.com/files//icons/2232/wireframe_mono/16/undo.png" alt="reply"></a>
										<a><img src="http://png-1.findicons.com/files//icons/2232/wireframe_mono/16/star_fav.png" alt="favourite"></a>
										<a><img src="http://png-4.findicons.com/files//icons/2232/wireframe_mono/16/tag.png" alt="label"></a>
										<a><img src="http://png-4.findicons.com/files//icons/2232/wireframe_mono/16/trash.png" alt="delete"></a>
									</div>
								</li>
							</ul>
						</div>
					</div>
				</div><!-- /dash-unit -->
			</div><!-- /span3 -->

			  
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<dtitle>Other Information</dtitle><hr>
					<div class="section-graph">
						<div id="importantchart"></div><br>
						<div class="graph-info" id="totcost">
							<i class="graph-arrow"></i>
							<span class="graph-info-big"></span>
							<span class="graph-info-small" id="difcost"></span>
						</div>
					</div>
				</div>
			</div>

			    
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<dtitle>Member & Board & Wishlist</dtitle><hr>
					<div class="cont">
						<p><bold>${wishcnt}</bold> | <ok>아이템수</ok></p><br>
						<p><bold>${memcnt}</bold> | 회원수</p><br>
						<p><bold>${boardcnt}</bold> | <bad>게시물수</bad></p><br>
						<p><img src="resources/admin/images/up-small.png" alt=""> 12% Compared Last Month</p>
					</div>
				</div>
			</div>
        
			  
			<div class="col-sm-3 col-lg-3">
				<div class="dash-unit">
					<dtitle>Latest News</dtitle><hr>
					<div class="info-user">
						<span aria-hidden="true" class="li_news fs2"></span>
					</div><br>
					<div class="text">
						<p><b>Article Update:</b><p>
						<p id="url2"></p>
						<p><grey>Last Update: 5 minutes ago.</grey></p>
					</div>
				</div>
			</div>  
        
		</div><!-- /row -->
     
 
	    
		<!-- <div class="row">
			<div class="col-sm-3 col-lg-3">
				<div class="half-unit">
					<dtitle>이벤트 List</dtitle><hr>
					<div class="cont">
						<p><bold>13</bold> | Pending Tasks</p>
					</div>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width:20%;">
							<span class="sr-only">60% Complete</span>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-3 col-lg-3">
				<div class="half-unit">
					<dtitle>Total Subscribers</dtitle><hr>
					<div class="cont">
						<p><bold>14.744</bold></p>
						<p>98 Subscribed Today</p>
					</div>
				</div>
			</div>
     	</div>  -->
   
		
     
      
      
	</div> <!-- /container -->
	
	<div id="footerwrap">
      	<footer class="clearfix"></footer>
      	<div class="container">
      		<div class="row">
      			<div class="col-sm-12 col-lg-12">
      			<p><img src="resources/admin/images/logo.png" alt=""></p>
      			<p>RE:MIDN - Created With Love - Inspired by SIM</p>
      			</div>

      		</div><!-- /row -->
      	</div><!-- /container -->		
	</div><!-- /footerwrap -->
          
</body></html>