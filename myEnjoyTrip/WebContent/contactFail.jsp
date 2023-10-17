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
							<span class="text-white">Contact Us</span>
							<h1 class="text-capitalize mb-4 text-lg">Get in Touch</h1>
							<ul class="list-inline">
								<li class="list-inline-item"><a href="index.html" class="text-white">Home</a></li>
								<li class="list-inline-item"><span class="text-white">/</span></li>
								<li class="list-inline-item"><a href="#" class="text-white-50">Contact Us</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- contact form start -->
		<section class="contact-form-wrap section">
			<div class="container">
				<div class="row mb-5">
					<div class="col-lg-3 col-md-2 col-sm-1"></div>
					<div id="signInItem" class="col-lg-6 col-md-8 col-sm-10 open">
						<form id="login-form" class="contact__form open" method="POST" action="/users">
							<!-- form message -->
							<div class="row">
								<div class="col-12">
									<div class="alert alert-success contact__msg" style="display: none" role="alert">
										Your message was sent successfully.
									</div>
								</div>
							</div>
							<!-- end message -->
							<h3 class="text-md mb-4">지금 로그인하여<br>다양한 정보를 획득하세요!</h3>
							<input type="hidden" name="job" value="login"><br>
							<div class="form-group">
								<input id="userIdLogin" name="user_id" type="text" class="form-control" placeholder="Your ID">
							</div>
							<div class="form-group">
								<input id="userPwLogin" name="user_password" type="password" class="form-control" placeholder="Your PW">
							</div>
							<div id="pwWrongErr">
								
							</div>
							<%-- 로그인 실패 메시지 표시 부분 --%>
						    <% String errorMessage = (String)request.getAttribute("errorMessage"); %>
						    <% if (errorMessage != null) { %>
						        <p style="color: red;"><%= errorMessage %></p>
						    <% } %>
							<div class="form-group">
								<a href="#" class="">forget Passworrd</a>
								/
								<a id="btnToSign" href="#" class="">Sign up</a>
							</div>
							<button id="btnLogin" class="btn btn-main" name="submit" type="submit">Login</button>
						</form>
					</div>
					
					<div class="col-lg-3 col-md-2 col-sm-1"></div>
				</div>

				<div class="row mb-5">
					<div class="col-lg-3 col-md-2 col-sm-1"></div>
					<div id="hiUser" style="text-align: center;" class="col-lg-6 col-md-8 col-sm-10 close">
						<h3 class="text-md mb-4 ">반가워요 여행자님!<br>오늘도 유익한 여행 정보 얻어가세요!</h3>
						
						<div class="form-group suite-regular-font">
							새로 업데이트된 정보들을 확인하세요!
						</div>

						<a class="btn btn-solid-border btn-round-full suite-regular-font" href="./blog-grid.html">
							<h5 class="m-0"><i class="far fa-paper-plane"></i> 정보 얻으러 가기</h3>
						</a>
					</div>
					
					<div class="col-lg-3 col-md-2 col-sm-1"></div>
				</div>

				<div class="row">
					<div class="col-lg-3 col-md-2 col-sm-1  "></div>
					<div id="signUpItem"  class="col-lg-6 col-md-8 col-sm-10 close">
						<form id="signup-form" class="contact__form" method="post" action="/users">
							<!-- form message -->
							<div class="row">
								<div class="col-12">
									<div class="alert alert-success contact__msg" style="display: none" role="alert">
										Your message was sent successfully.
									</div>
								</div>
							</div>
							<!-- end message -->
							<h3 class="text-md mb-4">회원이 아니시라면,<br>가입하여 함께하세요!</h3>
							<input type="hidden" name="job" value="signup"><br>
							<div class="input-group mb-3">
								<input name="user_id" type="text" class="form-control" placeholder="Your ID">
							</div>
							<div class="input-group mb-3">
								<input name="user_password" type="password" class="form-control" placeholder="Your PW">
							</div>
							<div class="input-group mb-3">
								<input name="user_name" type="text" class="form-control" placeholder="Your Name">
							</div>
							<div class="input-group mb-3">
								<input name="user_job" type="text" class="form-control" placeholder="Your Job">
							</div>
							<div class="input-group mb-3">
								<input name="user_email" type="text" class="form-control" placeholder="Your E-mail">
							</div>
							<button class="btn btn-main" name="submit" type="submit">Sign Up</button>
						</form>
					</div>
					
					<div class="col-lg-3 col-md-2 col-sm-1"></div>
				</div>
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
						<div class="col-lg-4 col-md-12 col-sm-12">
							<div class="copyright">
								&copy; Copyright Reserved to <span class="text-color">Megakit.</span> by <a
									href="https://themefisher.com/" target="_blank">Themefisher</a>
							</div>
						</div>

						<div class="col-lg-4 col-md-12 col-sm-12">
							<div class="copyright">
								Distributed by <a href="https://themewagon.com/" target="_blank">Themewagon</a>
							</div>
						</div>
						<div class="col-lg-4 col-md-12 col-sm-12 text-left text-lg-left">
							<ul class="list-inline footer-socials">
								<li class="list-inline-item"><a href="https://www.facebook.com/themefisher"><i
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

	<script src="js/script.js"></script>


	<script>
        window.onload = function () {
            // nav - login
            document.querySelector("#btnToSign").addEventListener("click", function () {
                const signUpItem = document.querySelector("#signUpItem");
                signUpItem.classList.remove("close");
                signUpItem.classList.add("open");
                const signInItem = document.querySelector("#signInItem");
                signInItem.classList.remove("open");
                signInItem.classList.add("close");
            })
			/*
            document.querySelector("#login-form").onsubmit = e => {
				e.preventDefault();
				let userId = document.querySelector("#userIdLogin").value;
                let password = document.querySelector("#userPwLogin").value;

				console.log(userId + password);

                if (userId == 'ssafy' && password == '1234') {

					console.log("로그인 성공");
                    // refactoring
                    // 네비게이션 창의 로그인/회원가입창 없애기
                    
					// 로그인 버튼 보이기
                    const goLogin = document.querySelector("#goLogin");
                    goLogin.classList.replace("open", "close");

					// 로그아웃 버튼 보이기
                    const goLogout = document.querySelector("#goLogout");
                    goLogout.classList.replace("close", "open");

					// 마이페이지 보여주기
                    const myPageItem = document.querySelector("#myPageItem");
                    myPageItem.classList.replace("close", "open");

					// 환영인사 출력
					const hiUser = document.querySelector("#hiUser");
                    hiUser.classList.replace("close", "open");

					// 로그인 없애기
					const loginForm = document.querySelector("#login-form");
                    loginForm.classList.replace("open", "close");
                }
				// 비밀번호 틀림
				else {
					const pwWrongErr = document.querySelector("#pwWrongErr");
					pwWrongErr.innerHTML = "<div style='color: #cb1b1b;' class='suite-regular-font'>고객님 아이디는 ssafy 비밀번호는 1234입니다^^</div>"
				}
			}
            */
			/* 
			document.querySelector("#signup-form").onsubmit = e => {
				e.preventDefault();

                const signUpItem = document.querySelector("#signUpItem");
                signUpItem.classList.remove("open");
                signUpItem.classList.add("close");
                const signInItem = document.querySelector("#signInItem");
                signInItem.classList.remove("close");
                signInItem.classList.add("open");

			}
			*/
        }
    </script>
</body>

</html>