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
<link rel="stylesheet"
	href="http://cdn.bootstrapmb.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="css/all.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/lightcase.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/swiper.min.css">

<link rel="shortcut icon" href="images/meal/favicon.png"
	type="image/x-icon">
<link rel="stylesheet" href="css/stylemeal.css">

<title>餐點簡介</title>
</head>
<body>
	<form method='POST'>
		<input type='hidden' name='_method' value='DELETE'>
	</form>

	<!-- 引入共同的頁首 -->
	<div>
		<jsp:include page="/fragment/top.jsp" />
	</div>
	<section class="page-header bg_img"
		data-background="images/meal/foodtop.jpg">
		<div class="container">
			<h3 class="title">
				<span class="shape-wrapper"><span class="shape"></span>Meal
					Information<span class="shape"></span></span>
			</h3>
		</div>
	</section>
	<div class="breadcrumb-section1">
		<div class="container">
			<div class="breadcrumb-wrapper">
				<div class="breadcrumb-title">
					<h6 class="title">餐點資訊</h6>
				</div>
				<ul class="breadcrumb"
					style="background: transparent; margin: -5px -10px; padding: 0;">
					<li><a href="updateShowAllMealList">GoBackToUpdateMealList</a></li>
					<li><a href="mealSystem">HOME</a></li>
					<li>後台${mealList.mealName}</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- SIDE BAR -->


	<!-- 	Trainer Section Starts Here -->
	<section>
		<br>
		<article style="display: flex; justify-content: center;">
			<img width='800'
				src="<c:url value='meal/picture/${mealList.mealId}' />" />
		</article>
		<br>
		<br>
		<div class="trainer-details padding-bottom padding-top">
			<div class="container">
				<div class="row">
					<div class="col-lg-8 mb-5 mb-lg-0">
						<article>
							<div class="trainer-area">
								<div class="trainer-item">
									<div class="trainer-content">
										<h1 class="title">${mealList.mealName}</h1>
										<br>
										<h5>
											<span>餐點價格：TWD$${mealList.mealPrice}</span>
										</h5>
										<h6 style="text-align: center">餐點介紹</h6>
										<p style="text-align: center">${mealList.mealContent}</p>
									</div>
								</div>
							</div>
						</article>
					</div>

					<div class="col-lg-4">
						<aside class="sidebar">
							<div class=" widget-category">
								<h5 class="widget-title">餐點資訊</h5>
								<ul>
									<li><a>餐點價格：TWD$${mealList.mealPrice}</a></li>
									<li><a>${mealList.mealKcal}Kcal</a></li>
									<li><a>餐點分類：${mealList.mealCategoryBean.categoryName}</a></li>
									<li><a>餐點編號：${mealList.mealId}</a></li>
								</ul>
							</div>
						</aside>
					</div>
				</div>
			</div>
		</div>
		<!-- Trainer Section Ends Here -->






		<!-- Package Section Two Ends Here -->

		<div class="container">
			<div class="row mb-30-none justify-content-center">
				<div class="col-lg-4 col-md-6">
					<div class="package-item">
						<div class="package-header">
							<h2 class="title">我要修改</h2>
							<img src="css/img/plane.png" />
						</div>
						<div class="package-content">
							<a href="<c:url value='/updateMeal?id=${mealList.mealId}' />"
								class="custom-button">修改</a>
								<br>
							<a class="deletelink custom-button"
			href="${pageContext.request.contextPath}/delete/${mealList.mealId}">刪除</a>
								<br>
						</div>
					</div>
				</div>
			</div>
			<br>
		</div>
		<br>
	</section>
	<!-- Package Section Two Ends Here -->
	
	<script type='text/javascript'>
		$(document).ready(function() {
			$('.deletelink').click(function() {
				if (confirm('確定刪除此筆紀錄? ')) {
					var href = $(this).attr('href');
					$('form').attr('action', href).submit();
				}
				return false;

			});
		})
	</script>
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
