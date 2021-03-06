<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link
	href="https://fonts.googleapis.com/css?family=Rajdhani:300,400,500,600,700&display=swap"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,400i,600,600i,700,700i&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="http://cdn.bootstrapmb.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" href="css/all.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/lightcase.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/swiper.min.css">

<link rel="shortcut icon" href="images/trainers/favicon.png"
	type="image/x-icon">
<link rel="stylesheet" href="css/stylecoach.css">

<title>預約課程</title>
</head>
<body>
	<script type="text/javascript">
function getCoachsByExpertise(Expertise){
	// alert(Expertise);
		$.ajax({
			url : "<c:url value='/getCoachsByExpertise'/>",
			type : "POST",
			dataType : "JSON",
			data : {"coachExpertise":Expertise},
			success : function (data) {
				// 將呈現教練區域的子元素先清空
				$('#expert-item-area').empty();
				// 解析json並迴圈append
				var json = $.parseJSON(JSON.stringify(data));
				for (let key in json) {
					var coachId = json[key]['coachId'];
					var coachName = json[key]['coachName'];
					var coachExpertise = json[key]['coachExpertise'];
					var coachPrice = json[key]['coachPrice'];
					$('#expert-item-area').append(bindCoachHtml(coachId,coachName,coachExpertise,coachPrice));
				}
			},
		})
	}

function fuzzySearch(any){
		$.ajax({
			url : "<c:url value='/getCoachsByFuzzySearch'/>",
			type : "POST",
			dataType : "JSON",
			data : {"any":any},
			success : function (data) {
				// 將呈現教練區域的子元素先清空
				$('#expert-item-area').empty();
				// 解析json並迴圈append
				var json = $.parseJSON(JSON.stringify(data));
				for (let key in json) {
					var coachId = json[key]['coachId'];
					var coachName = json[key]['coachName'];
					var coachExpertise = json[key]['coachExpertise'];
					var coachPrice = json[key]['coachPrice'];
					$('#expert-item-area').append(bindCoachHtml(coachId,coachName,coachExpertise,coachPrice));
				}
			},
		})
	}

	function bindCoachHtml(coachId,coachName,coachExpertise,coachPrice) {
		return `
			<div class="expert-item">
				<div class="expert-thumb">
					<a href="<c:url value='coachUpdate/${"${coachId}"}'/>"> 
						<img src="<c:url value='/getPicture/${"${coachId}"}'/>" alt="trainers">
					</a>
				</div>
				<div class="expert-content">
					<div class="expert-info">
						<h4 class="sub-title">
						<a href="<c:url value='coachUpdate/${"${coachId}"}'/>">${"${coachName}"}</a>
						</h4>
						<span>${"${coachExpertise}"}</span>
						<span><br>${"${coachPrice}"}點(小時)</span>
					</div>
					<a class="expert-link" href="#0"> <i class="fas fa-link"></i>
					</a>
				</div>
				<div align="center" style="margin-top: 10px">
				<input class="btn btn-primary" style="width: 200px;"
					type="button" value="教練時間管理"
					onclick="window.location.href='<c:url value='coachTimeMaintain?id=${"${coachId}"}'/>';" />
			</div>
			<div align="center" style="margin-top: 10px">
				<input class="btn btn-primary" style="width: 200px;"
					type="button" value="顧客預約明細"
					onclick="window.location.href='<c:url value='showWorkingList?coachId=${"${coachId}"}'/>';" />
			</div>
			</div>
		`;
	}
</script>
	<!-- 引入共同的頁首 -->
	<div>
		<jsp:include page="/fragment/top.jsp" />
	</div>
	<section class="page-header bg_img"
		data-background="images/banner.jpg">
		<div class="container">
			<h3 class="title">
				<span class="shape-wrapper"><span class="shape"></span>Trainers<span
					class="shape"></span></span>
			</h3>
		</div>
	</section>
	<div class="breadcrumb-section1">
		<div class="container">
			<div class="breadcrumb-wrapper">
				<div class="breadcrumb-title">
					<h6 class="title">個人教練</h6>
				</div>
				<ul class="breadcrumb"
					style="background: transparent; margin: -5px -10px; padding: 0;">
					<li><a href="index.html">首頁</a></li>
					<li>個人教練</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- Blog Section Begin -->
	<div align="center">
		<input class="btn btn-primary" style="width: 200px" type="button"
			value="新增教練"
			onclick="window.location.href='<c:url value="/coachs/add" />';" />
	</div>
	<section class="expert-trainers padding-bottom padding-top">
	
	<aside class="sidebar"
			style="width: 300px; float: left; margin-left: 400px">
			<div class="widget widget-search">
				<form class="widget-form">
					<input type="text" placeholder="Search in here" id="fname" onkeyup="fuzzySearch(this.value)"> <label
						for="w1"><i class="fas fa-search"></i></label> <input
						type="submit" value="Search" id="w1">
				</form>
			</div>
			<div class="widget widget-category">
				<h5 class="widget-title">教練專業</h5>
				<ul>
					<c:forEach var='expertiseLists' items="${expertiseList}">

						<li><a href="javascript:void(0);"
							onclick="getCoachsByExpertise('${expertiseLists}')">${expertiseLists}</a></li>
					</c:forEach>
				</ul>
			</div>
		</aside>
	
		<div class="container" id="container-area" >
			<div class="expert-item-area" id="expert-item-area">
				<c:forEach var='coach' items='${coachs}'>
					<div class="expert-item">
						<div class="expert-thumb">
							<a href="<c:url value='coachUpdate/${coach.coachId}'/>"> <img
								src="<c:url value='/getPicture/${coach.coachId}'/>"
								alt="trainers"></a>
						</div>
						<div class="expert-content">
							<div class="expert-info">
								<h4 class="sub-title">
									<a href="<c:url value='coachUpdate/${coach.coachId}'/>">${coach.coachName}</a>
								</h4>
								<span>${coach.coachExpertise}</span>
							</div>
							<a class="expert-link" href="#0"> <i class="fas fa-link"></i>
							</a>
						</div>
						<div align="center" style="margin-top: 10px">
							<input class="btn btn-primary" style="width: 200px;"
								type="button" value="教練時間管理"
								onclick="window.location.href='<c:url value='coachTimeMaintain?id=${coach.coachId}'/>';" />
						</div>
						<div align="center" style="margin-top: 10px">
							<input class="btn btn-primary" style="width: 200px;"
								type="button" value="顧客預約明細"
								onclick="window.location.href='<c:url value='showWorkingList?coachId=${coach.coachId}'/>';" />
						</div>
					</div>

				
				</c:forEach>
				</div>
			</div>
	</section>
	<!-- Blog Section End -->

	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/modernizr-3.6.0.min.js"></script>
	<script src="js/plugins.js"></script>
	<script
		src="http://cdn.bootstrapmb.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script src="js/isotope.pkgd.min.js"></script>
	<script src="js/swiper.min.js"></script>
	<script src="js/waypoint.js"></script>
	<script src="js/counterup.min.js"></script>
	<script src="js/lightcase.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/maincoach.js"></script>


</body>
</html>