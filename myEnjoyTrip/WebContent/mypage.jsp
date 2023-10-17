<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ page import="user.dto.*, java.util.*, board.dto.*" %>
	<% String contextPath=request.getContextPath(); UserDto userDto=(UserDto) session.getAttribute("userDto"); %>

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

	<style>
		.open {
			display: block;
		}

		.close {
			display: none;
		}
	</style>
</head>

<body>

	<!-- Header Start -->
	
	<jsp:include page="header.jsp" />

	<!-- Header Close -->

	<div class="main-wrapper ">
		
					<div class="p-5" style="background: url('./images/background.png') no-repeat; width:100%; background-size: cover;">
					<section class="">
					  <div class="container" >
					    <div class="row">
					      <div class="col-md-12">
					        <div class="block text-center"  >
					          <span class="text-white">Our services</span>
					          <h1 class="text-capitalize mb-4 text-lg" style="text-shadow: 1px 7px 20px rgba(255, 255, 255, 0.9);">know thyself</h1>
					          <ul class="list-inline">
					            <li class="list-inline-item"><a href="#" class="text-white">Home</a></li>
					            <li class="list-inline-item"><span class="text-white">/</span></li>
					            <li class="list-inline-item"><a href="#" class="text-white-50">Our services</a></li>
					          </ul>
					        </div>
					      </div>
					    </div>
					  </div>
					</section>
					</div>

		
		<!-- contact form start -->
		<div class="container">
		
		
			<div class="row">
				<div id="signUpItem" class="col-lg-5 col-md-12 col-sm-12 open">
					<div class="card mt-4 mb-3" style="max-width: 540px;">
						<div class="row g-0">
						<% int imageNum = userDto.getUser_num()%10; %>
							<div style="background-image: url(./images/team/team-<%=imageNum %>.jpg); background-size: cover;" class="col-md-4">

							</div>
							<div class="col-md-8">
								<div class="card-body" ">
									<p > <h5 style="display: inline;" class="card-title font-style-2"> <%= userDto.getUser_name()%></h5><span class="font-style-2">님 반갑습니다!</span></p>
									<p class="card-text font-style-2"> " 오늘 하루도 행복하세요! "</p>
								</div>
							</div>
						</div>
					</div>



					<form id="contact-form" class="contact__form mb-5" method="post" action="/users">
						<!-- end message -->
						<input type="hidden" name="job" value="updateinfo">
						
						<div>
							<h5 class="font-style-2">성명</h5>
						</div>
						<div class="input-group mb-2">
							<input id="info-name" name="user_name" type="text" class=" suite-regular-font form-control"
								placeholder="Last Name" disabled value="<%= userDto.getUser_name()%>">
						</div>

						<div>
							<h5 class="font-style-2">ID</h5>
						</div>
						<div class="input-group mb-2">
							<input id="info-id" name="id" type="text" class="suite-regular-font form-control" disabled
								placeholder="Your ID" value="<%= userDto.getUser_id()%>">
						</div>

						<div>
							<h5 class="font-style-2">PW</h5>
						</div>
						<div class="input-group mb-1">
							<input id="info-newpw" name="user_password" type="password" class="form-control" placeholder="New PW">
						</div>
						<div class="input-group mb-2">
							<input id="info-confpw" name="user_confirmpassword" type="password" class="form-control" placeholder="Confirm PW">
						</div>
						
						<div>
							<h5 class="font-style-2">Job</h5>
						</div>
						<div class="input-group mb-2">
							<input id="info-job" name="user_job" type="text" class=" suite-regular-font form-control"
								placeholder="Your Job" value="<%= userDto.getUser_job()%>">
						</div>
						
						<div>
							<h5 class="font-style-2">E-Mail</h5>
						</div>
						<div class="input-group mb-2">
							<input id="info-email" name="user_email" type="email" class=" suite-regular-font form-control"
								placeholder="Your E-mail" value="<%= userDto.getUser_email()%>">
						</div>

						
						<button class="btn btn-main suite-regular-font m-0" style="width: 100%;" name="submit" type="submit">수정하기</button>
					</form>
						<hr class="mt-5">
						<div class="suite-regular-font mt-5"></div>
						<form id="withdrawal-form" class="contact__form mb-2" method="post" action="/users">
							<input type="hidden" name="job" value="withdrawal">
							<button class="btn btn-secondary suite-regular-font " name="submit" type="submit">회원탈퇴</button>
						</form>
					


					<!-- Modal -->
					<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">의견을 전달하였습니다.</h5>
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
								<div class="modal-body suite-regular-font">
									고객님의 소중한 시간을 내어 작성해주신 점 감사드리며, <br>
									개선을 위해 최선을 다할 것을 보장해 드립니다.
								</div>
								<div class="modal-footer">
									<a type="button" class="btn btn-secondary" data-dismiss="modal" href="./index.html">Close</a>
								</div>
							</div>
						</div>
					</div>



				</div>

				<div class="col-lg-7 col-md-12 col-sm-12">
					<h2 class="suite-regular-font mt-5"> ✍ 내가 쓴 글 </h2>
					<hr>



					<div id="boardTbody"> </div>
					
					<div id="board-pagination"> </div>

					
					<div class="mt-5">
						<hr class="mt-5">
					</div>

					<a class="btn btn-light text-md btn-lg btn-block p-1" data-toggle="collapse" href="#collapseExample"
						role="button" aria-expanded="false" aria-controls="collapseExample">
						<div class="container m-1">
							<div class="row">
								<div class="col-lg-2"></div>
								<div class="col-lg-8">
									<h3 class=" mb-4 mt-3">실망스러운 점을<br> 알려주시면 개선하겠습니다.</h3>
								</div>
								<div class="col-lg-2 p-2">
									<i class="fas fa-angle-down pt-4"></i>
								</div>
							</div>
						</div>

					</a>
					<div class="collapse" id="collapseExample">
						<form id="claim-form" class="contact__form mb-2" method="post">
							<!-- end message -->
							
							<div class="mt-3 suite-regular-font" style="text-align: center;"> 건의사항이 있나요? </div>
							<div>
								<h6 class="suite-regular-font mt-3"> 제목</h6>
							</div>
							<div id="claimTitle" class="input-group mb-3">
								<input name="id" type="text" class="suite-regular-font form-control" placeholder="제목">
							</div>
							<div>
								<h6 class="suite-regular-font mt-3"> 상세내용</h6>
							</div>
							<div class="input-group mb-3">
								<textarea class="form-control suite-regular-font" id="claimText" name="w3review" style="width: 100%; height: 200px;" placeholder="고객님의 경험을 적어주세요."></textarea>
							</div>

							<button id="sendCliamBtn" class="btn btn-main suite-regular-font m-0" style="width: 100%;" name="submit"
								data-toggle="modal" data-target="#exampleModal" type="reset">의견 전달</button>

						</form>
						
					</div>

				</div>
			</div>
		</div>

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

	<!-- Google Map -->
	<script src="plugins/google-map/map.js"></script>
	<script src="js/script.js"></script>


	<script>

		var OFFSET = 0;   // limit 10 offet 10
		var SEARCH_WORD = "";
	
		var LIST_ROW_COUNT = 5;    //limit
		var PAGE_LINK_COUNT = 7;    // pagination link 갯수
		var TOTAL_LIST_ITEM_COUNT = 0;
		var CURRENT_PAGE_INDEX = 1;
		window.onload = function () {
			// nav - login
			document.querySelector("#sendCliamBtn").addEventListener("click", function () {
				
			})
			// login process
			document.querySelector("#claim-form").onsubmit = e => {
				e.preventDefault();
			}
			boardList();
		}
		async function boardList() {
			let url = '/board/myboardList';
			let urlParams = '?limit=' + LIST_ROW_COUNT + '&offset=' + OFFSET;

			try {
				let response = await fetch(url + urlParams);
				let data = await response.json();
				makeListHtml(data);

			} catch (error) {
				console.log(error);
				alert('글 조회 과정에 문제가 생겼습니다.');
			}

		}

		
		async function clickBoardDetail(boardId) {
				let url = '/board/boardDetail';
				let urlParams = '?boardId=' + boardId;

				try {

					let response = await fetch(url + urlParams);
					let data = await response.json();
					makeListHtml(data);

				} catch (error) {
					console.log(error);
					//alert('글 조회 과정에 문제가 생겼습니다.');
				}
				location.replace("/boardDetail.jsp");

		}

		function makeListHtml(list) {

			console.log(list);

			let listHTML = ``;

			list.forEach(el => {
				let boardId = el.boardId;
				let userName = el.userName;
				let title = el.title;
				let content = el.content;
				let regDt = el.regDt.substring(5, 11).replace(/-/g, '.');
				let regDtStr = regDt;

				let readCount = el.readCount;

				listHTML +=
					`
			<button onclick="clickBoardDetail(\${boardId})" data-boardId=\${boardId} onmouseover="this.style.backgroundColor='#fff5f5'" onmouseout="this.style.backgroundColor='#fff'" style="background-color: #fff; border-radius: 5px; border: 1px solid #e6e6e6; text-align: left;   width: 100%;" name="">
				<div class="row m-1 mt-2 mb-2">
					<div class="col-lg-8 col-md-6 col-sm-12 font-style-3" style="font-size: 1.3rem;">
						\${title}
					</div>
					<div class="col-lg-12 col-md-12 col-sm-12 font-style-3">
						\${userName} | \${regDtStr} | \${readCount}
					</div>
				</div>
			</button>
			`
					;
			});

			document.querySelector("#boardTbody").innerHTML = listHTML;
			boardListTotalCnt();

			makeListHtmlEventHandler();

		}

		function makePaginationHtml(listRowCount, pageLinkCount, currentPageIndex, totalListItemCount, wrapperId) {
			// 페이지네이션을 렌더링할 HTML 문자열
			let paginationHtml = '<ul class="pagination pagination-sm justify-content-center">';

			// 이전 페이지 버튼 생성
			if (currentPageIndex > 1) {
				paginationHtml += '<li class="page-item"><a class="page-link" href="?page=' + (currentPageIndex - 1) + '"> 👈 </a></li>';
			}

			// 페이지 번호 생성
			for (let page = 1; page <= Math.ceil(totalListItemCount / listRowCount); page++) {
				if (page === currentPageIndex) {
					// 현재 페이지는 활성화된 상태로 표시
					paginationHtml += '<li class="page-item active"><span class="page-link">' + page + '</span></li>';
				} else {
					paginationHtml += '<li class="page-item"><a class="page-link" href="?page=' + page + '">' + page + '</a></li>';
				}

				// 페이지 링크 개수가 지정된 개수를 넘으면 중단
				if (page >= pageLinkCount) {
					break;
				}
			}

			// 다음 페이지 버튼 생성
			if (currentPageIndex < Math.ceil(totalListItemCount / listRowCount)) {
				paginationHtml += '<li class="page-item"><a class="page-link" href="?page=' + (currentPageIndex + 1) + '"> 👉 </a></li>';
			}

			paginationHtml += '</ul>';

			// 생성한 페이지네이션 HTML을 지정된 요소에 추가
			const wrapperElement = document.querySelector("#board-pagination");
			if (wrapperElement) {
				wrapperElement.innerHTML = paginationHtml;

				// 페이지 번호 클릭 이벤트 처리
				const pageLinks = wrapperElement.querySelectorAll(".page-link");
				pageLinks.forEach((link) => {
					link.addEventListener("click", function(event) {
						event.preventDefault(); // 링크 클릭 시 기본 동작을 막음 (페이지 이동 X)
						const page = parseInt(this.getAttribute("href").split("=")[1]); // 클릭한 페이지 번호 추출
						// 페이지 이동 로직을 호출
						movePage(page);
					});
				});
			} else {
				console.error('요소를 찾을 수 없습니다:', board-pagination);
			}
		}

		function makeListHtmlEventHandler() {
			document.querySelectorAll("#boardTbody tr").forEach(el => {
				el.onclick = function () {
					var boardId = this.getAttribute("data-boardId");
					boardDetail(boardId);
				}
			});
		}

		async function boardListTotalCnt() {
			let url = '/board/myboardListTotalCnt';
			let urlParams = '?searchWord=' + SEARCH_WORD;

			try {
				let response = await fetch(url + urlParams);
				let data = await response.json();
				TOTAL_LIST_ITEM_COUNT = data.totalCnt;
				makePaginationHtml(LIST_ROW_COUNT, PAGE_LINK_COUNT, CURRENT_PAGE_INDEX, TOTAL_LIST_ITEM_COUNT, "paginationWrapper");

			} catch (error) {
				console.log(error);
				alert('글 전체 수 조회 과정에 문제가 생겼습니다.');
			}
		}

		function movePage(pageIndex) {
			OFFSET = (pageIndex - 1) * LIST_ROW_COUNT;
			CURRENT_PAGE_INDEX = pageIndex;
			boardList();
		}
	</script>
</body>

</html>