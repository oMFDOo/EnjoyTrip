<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta name="description" content="megakit,business,company,agency,multipurpose,modern,bootstrap4">

	<meta name="author" content="themefisher.com">

	<title>Megakit| Html5 Agency template</title>

	<!-- bootstrap.min css -->
	<link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
	<!-- Icon Font Css -->
	<link rel="stylesheet" href="plugins/themify/css/themify-icons.css">
	<link rel="stylesheet" href="plugins/fontawesome/css/all.css">
	<link rel="stylesheet" href="plugins/magnific-popup/dist/magnific-popup.css">
	<!-- Owl Carousel CSS -->
	<link rel="stylesheet" href="plugins/slick-carousel/slick/slick.css">
	<link rel="stylesheet" href="plugins/slick-carousel/slick/slick-theme.css">

	<!-- Main Stylesheet -->
	<link rel="stylesheet" href="css/style.css">
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=6bd50cc16da21213a3ad09596d22ba5e"></script>

</head>

<body>

	<!-- Header Start -->
	
	<jsp:include page="header.jsp" />

	<!-- Header Close -->

	<div class="main-wrapper ">
		<section class="page-title bg-1">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="block text-center">
							<span class="text-white">Our blog</span>
							<h1 class="text-capitalize mb-4 text-lg">Blog articles</h1>
							<ul class="list-inline">
								<li class="list-inline-item"><a href="index.html" class="text-white">Home</a></li>
								<li class="list-inline-item"><span class="text-white">/</span></li>
								<li class="list-inline-item"><a href="#" class="text-white-50">Our blog</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
		<div id="detail">
		</div>
		<section class="section blog-wrap bg-gray">
			<div class="container">

				<div class="row">
					<div class="container pt-3 suite-regular-font">
						
						<h2>관광지 검색</h2>
						
						<div class="row">
							<div class="col-lg-2 col-md-2 col-sm-4">
								<select id="area1List" class="custom-select form-select">
									<option value=''>시도</option>
								</select>
							</div>
							<div class="col-lg-2 col-md-2 col-sm-4">
								<select id="area2List" class="custom-select form-select">
									<option value=''>구군</option>
								</select>
							</div>
							<div class="col-lg-2 col-md-2 col-sm-4">
								<select id="cat1List" class="custom-select form-select">
									<option value=''>대분류</option>
								</select>
							</div>
							<div class="col-lg-2 col-md-2 col-sm-4">
								<select id="cat2List" class="custom-select form-select">
									<option value=''>중분류</option>
								</select>
							</div>
							<div class="col-lg-2 col-md-2 col-sm-4">
								<select id="cat3List" class="custom-select form-select">
									<option value=''>소분류</option>
								</select>
							</div>
							<div class="col-lg-2 col-md-2 col-sm-4">
								<div class="d-grid gap-2">
									<button id="btnSearch" type="button" class="btn btn-main suite-regular-font p-1" style="width: 100%;"><h5 style="display: inline; color:#fff;">검색 </h5></button>
								</div>
							</div>
						</div>
					</div>
					<div class="container d-flex justify-content-center align-items-center h-100">
						<div id="spinner" class="spinner-border text-info hide" role="status"><!-- hide class 로 제어-->
							<span class="visually-hidden"></span>
						</div>
					</div>

					<div class="w-100" id="map" style="width:100%;height:400px;"></div>

					<div class="row w-100">
						<div class="container mt-3">
							<div class="row" id="itemList">
								<div class="col-3"></div>
								<div class="col-3"></div>
								<div class="col-3"></div>
								<div class="col-3"></div>
							</div>
						</div>
					</div>
					<!-- <img src="/video/Tourist destination.gif"> -->
				</div>

		</section>

		<!-- footer Start -->
		<footer class="footer section">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="widget">
							<h4 class="text-capitalize mb-4">Company</h4>

							<ul class="list-unstyled footer-menu lh-35">
								<li><a href="#">Terms & Conditions</a></li>
								<li><a href="#">Privacy Policy</a></li>
								<li><a href="#">Support</a></li>
								<li><a href="#">FAQ</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-2 col-md-6 col-sm-6">
						<div class="widget">
							<h4 class="text-capitalize mb-4">Quick Links</h4>

							<ul class="list-unstyled footer-menu lh-35">
								<li><a href="#">About</a></li>
								<li><a href="#">Services</a></li>
								<li><a href="#">Team</a></li>
								<li><a href="#">Contact</a></li>
							</ul>
						</div>
					</div>
					<div class="col-lg-3 col-md-6 col-sm-6">
						<div class="widget">
							<h4 class="text-capitalize mb-4">Subscribe Us</h4>
							<p>Subscribe to get latest news article and resources </p>

							<form action="#" class="sub-form">
								<input type="text" class="form-control mb-3" placeholder="Subscribe Now ...">
								<a href="#" class="btn btn-main btn-small">subscribe</a>
							</form>
						</div>
					</div>

					<div class="col-lg-3 ml-auto col-sm-6">
						<div class="widget">
							<div class="logo mb-4">
								<h3>Mega<span>kit.</span></h3>

							</div>
							<h6><a href="tel:+23-345-67890">Support@megakit.com</a></h6>
							<a href="mailto:support@gmail.com"><span class="text-color h4">+23-456-6588</span></a>
						</div>
					</div>
				</div>

				<div class="footer-btm pt-4">
					<div class="row">
						<div class="col-lg-6">
							<div class="copyright">
								&copy; Copyright Reserved to <span class="text-color">Megakit.</span> by <a
									href="https://themefisher.com/" target="_blank">Themefisher</a>
							</div>
						</div>
						<div class="col-lg-6 text-left text-lg-right">
							<ul class="list-inline footer-socials">
								<li class="list-i	<div class=" footer-btm pt-4">
									<div class="row">
										<div class="col-lg-4 col-md-12 col-sm-12">
											<div class="copyright">
												&copy; Copyright Reserved to <span class="text-color">Megakit.</span> by
												<a href="https://themefisher.com/" target="_blank">Themefisher</a>
											</div>
										</div>

										<div class="col-lg-4 col-md-12 col-sm-12">
											<div class="copyright">
												Distributed by <a href="https://themewagon.com/"
													target="_blank">Themewagon</a>
											</div>
										</div>
										<div class="col-lg-4 col-md-12 col-sm-12 text-left text-lg-left">
											<ul class="list-inline footer-socials">
												<li class="list-inline-item"><a
														href="https://www.facebook.com/themefisher"><i
															class="ti-facebook mr-2"></i>Facebook</a></li>
												<li class="list-inline-item"><a
														href="https://twitter.com/themefisher"><i
															class="ti-twitter mr-2"></i>Twitter</a></li>
												<li class="list-inline-item"><a
														href="https://www.pinterest.com/themefisher/"><i
															class="ti-linkedin mr-2 "></i>Linkedin</a></li>
											</ul>
										</div>
									</div>
						</div>nline-item"><a href="https://www.facebook.com/themefisher"><i
								class="ti-facebook mr-2"></i>Facebook</a></li>
						<li class="list-inline-item"><a href="https://twitter.com/themefisher"><i
									class="ti-twitter mr-2"></i>Twitter</a></li>
						<li class="list-inline-item"><a href="https://www.pinterest.com/themefisher/"><i
									class="ti-linkedin mr-2 "></i>Linkedin</a></li>
						</ul>
					</div>
				</div>
			</div>
	</div>
	</footer>

	</div>

	<!-- 
    Essential Scripts
    =====================================-->
	<!-- 카카오맵 -->
	<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
	</script>
	<!-- 검색 js 코드 -->
	<script src="js/main.js"></script>

	<!-- Main jQuery -->
	<script src="plugins/jquery/jquery.js"></script>
	<script src="js/contact.js"></script>
	<!-- Bootstrap 4.3.1 -->
	<script src="plugins/bootstrap/js/popper.js"></script>
	<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
	<!--  Magnific Popup-->
	<script src="plugins/magnific-popup/dist/jquery.magnific-popup.min.js"></script>
	<!-- Slick Slider -->
	<script src="plugins/slick-carousel/slick/slick.min.js"></script>
	<!-- Counterup -->
	<script src="plugins/counterup/jquery.waypoints.min.js"></script>
	<script src="plugins/counterup/jquery.counterup.min.js"></script>

	<!-- Google Map -->
	<!-- <script src="plugins/google-map/map.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>    
    
    <script src="js/script.js"></script> -->

</body>

</html>