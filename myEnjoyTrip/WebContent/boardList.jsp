<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="user.dto.*, java.util.*" %>
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

			</head>

			<body>

				<!-- Header Start -->
	
	<jsp:include page="header.jsp" />

	<!-- Header Close -->

				<!-- Main Contents Start -->
				<div class="main-wrapper ">
					
					<div class="p-5" style="background: url('./images/background.gif') no-repeat; width:100%; background-size: cover;">
					<section class="">
					  <div class="container" >
					    <div class="row">
					      <div class="col-md-12">
					        <div class="block text-center"  >
					          <span class="text-white">Our services</span>
					          <h1 class="text-capitalize mb-4 text-lg" style="text-shadow: 1px 7px 20px rgba(255, 255, 255, 0.9);">Share your journey</h1>
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

					<!-- 글작성 창 Start -->
					<div class="container">
						<div class="row">
							<div class="col-lg-4 col-md-0 col-sm-0 mt-3 pt-2 pb-2" style="background-color: #f5f5f5;">


								<%
									if (userDto != null) {
								%>
									<div class="mt-3 mb-4 p-2" style="display: flex; align-items: center; background-color: #e6e6e6; border-radius: 20px;">
										<div style="width: 80px; height: 80px; border-radius: 50%; overflow: hidden; margin-right: 20px;">
											<img src="./images/team/team-1.jpg" alt="프로필 사진" style="width: 100%; height: 100%; object-fit: cover;">
										</div>
										<div style="font-weight: bold; display: flex; flex-direction: column; align-items: center;">
											<p class="font-style-3" style="font-size: 20; margin: 0;"><span style="color: #01014d;"><%= userDto.getUser_name() %></span> 님 반갑습니다!<br>
												<a href="/mypage.jsp" style="text-align: center;">내 활동</a> 
											</p>
										</div>
									</div>
								<%
								
									} else {
								%>
									<div class="mt-3 mb-4 p-2" style="display: flex; align-items: center; background-color: #e6e6e6; border-radius: 20px;">
										<div style="width: 80px; height: 80px; border-radius: 50%; overflow: hidden; margin-right: 20px;">
											<img src="./images/bg/home-1.jpg" alt="프로필 사진" style="width: 100%; height: 100%; object-fit: cover;">
										</div>
										<div style="font-weight: bold; display: flex; flex-direction: column; align-items: center;">
											<p class="font-style-3" style="font-size: 20; margin: 0;"><span style="color: #01014d;">가입 후 활동하세요!<br>
												<a href="/contact.jsp" style="text-align: center;">로그인</a> 
											</p>
										</div>
									</div>
								<%
									}
								%>
		
		
		


								<h5 class="mt-4 suite-regular-font">🤷‍♀️ 찾는 내용이 있나요?</h5>
								<hr>

								
								<div style="border: 2px solid #9f1717;" class="input-group mb-5">
									<input id="search-bar-value" style=" padding: 0 10px;" type="text" class="form-control font-style-3" placeholder="검색어를 입력하세요!" aria-label="Recipient's username" aria-describedby="button-addon2">
									<button onclick="searchList()" style=" padding: 0 2.5vw; background-color: #9f1717;" class="btn btn-danger font-style-3" type="button" id="button-addon2">검색</button>
								</div>

								<h5 class="mt-4 suite-regular-font">😎 이번 주 인기글을 만나보세요!</h5>
								<hr>
								<div id="board-hot-list"></div>

							</div>
							<hr>
							<div class="col-lg-8 col-md-12 col-sm-0">
								<h3 class="text-md mt-4 elice-font">🎠우리의 여행 이야기</h3>
								<hr>



								<div id="boardTbody"> </div>
								
						
						  <div id="board-pagination"> </div>

							</div>

						</div>
					</div>
					<!-- 글작성 창 Close -->
				</div>
				<!-- Main Contents Close -->


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
									<a href="mailto:support@gmail.com"><span
											class="text-color h4">+23-456-6588</span></a>
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
				<script
					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAkeLMlsiwzp6b3Gnaxd86lvakimwGA6UA&callback=initMap"></script>

				<script src="js/script.js"></script>




				<script>

					var OFFSET = 0;   // limit 10 offet 10
					var SEARCH_WORD = "";

					var LIST_ROW_COUNT = 10;    //limit
					var PAGE_LINK_COUNT = 10;    // pagination link 갯수
					var TOTAL_LIST_ITEM_COUNT = 0;
					var CURRENT_PAGE_INDEX = 1;

					window.onload = function () {

						boardHotList();
						boardList();
						makePaginationHtml();

						// 검색어 검색 
						// document.querySelector("#btnSearchWord").onclick = function () {

						SEARCH_WORD = document.querySelector("#search-bar-value").value;
						// 처음 페이지로 초기화
						OFFSET = 0;
						CURRENT_PAGE_INDEX = 1;

						// 	boardList();
						// }

					};

					
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

					async function boardList() {
						let url = '/board/boardList';
						let urlParams = '?limit=' + LIST_ROW_COUNT + '&offset=' + OFFSET + "&searchWord=" + SEARCH_WORD;

						try {
							let response = await fetch(url + urlParams);
							let data = await response.json();
							makeListHtml(data);

						} catch (error) {
							console.log(error);
							alert('글 조회 과정에 문제가 생겼습니다.');
						}

					}
					async function searchList() {
						SEARCH_WORD = document.querySelector("#search-bar-value").value;
						boardList();
					}


					async function boardHotList() {
						let url = '/board/boardHotList';
						let urlParams = '?limit=' + LIST_ROW_COUNT + '&offset=' + OFFSET + "&searchWord=" + SEARCH_WORD;

						try {
							let response = await fetch(url + urlParams);
							let data = await response.json();
							makeHotListHtml(data);

						} catch (error) {
							console.log(error);
							alert('글 조회 과정에 문제가 생겼습니다.');
						}

					}

					function makeHotListHtml(list) {

						console.log(list);

						let listHTML = ``;

						list.forEach(el => {
							let boardId = el.boardId;
							let userName = el.userName;
							let title = el.title;
							let content = el.content;
							let regDt = el.regDt.substring(5, 11).replace(/-/g, '.');
							let regDtStr = regDt;
							let thumbnail = el.thumbnail;

							let readCount = el.readCount;

							listHTML +=
								`
								<button onclick="clickBoardDetail(\${boardId})" data-boardId=\${boardId} onmouseover="this.style.backgroundColor='#e9aeae'" onmouseout="this.style.backgroundColor='#fff'"style="text-align: left;   width: 100%; background-color: #fff; border-radius: 5px; border: 1px solid #e6e6e6;" name="">
							<div class="row m-1 mt-2 mb-2">
								<div class="col-lg-12 col-md-12 col-sm-12 font-style-3" style="font-size: 1.2rem;">
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
						console.log("이거 넣을건뎅 : " + document.querySelector("#board-hot-list"));

						document.querySelector("#board-hot-list").innerHTML = listHTML;

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
						let url = '/board/boardListTotalCnt';
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

					// insert
					function validateInsert() {
						var isTitleInsertValid = false;
						var isContentInsertValid = false;

						var titleInsertValue = document.querySelector("#titleInsert").value;
						if (titleInsertValue.length > 0) {
							isTitleInsertValid = true;
						}

						var contentInsertValue = document.querySelector("#contentInsert").value;
						if (contentInsertValue.length > 0) {
							isContentInsertValid = true;
						}

						if (isTitleInsertValid && isContentInsertValid) {
							return true;
						} else {
							return false;
						}
					}


					async function boardInsert() {

						let title = document.querySelector("#titleInsert").value;
						let content = document.querySelector("#contentInsert").value;

						let urlParams = new URLSearchParams({
							title: title,
							content: content,
						});

						let fetchOptions = {
							method: "POST",
							body: urlParams,
						}

						let url = '/board/boardInsert';

						try {
							let response = await fetch(url, fetchOptions);
							let data = await response.json();
							if (data.result == "success") { // 백엔드 로그인 필터에서 session timeout 이 발생하면 내려주는 json 값
								alertify.success('글이 등록되었습니다.');
								boardList();
							} else {
								alertify.error('글 등록 과젱에 문제가 있습니다.')
							}
						} catch (error) {
							console.error(error);
							alertify.error('글 등록 과젱에 문제가 있습니다.')
						}
					}


					//detail
					async function boardDetail(boardId) {

						var url = '/board/boardDetail';
						var urlParams = '?boardId=' + boardId;

						try {
							let response = await fetch(url + urlParams);
							let data = await response.json();
							console.log(data);
							makeDetailHtml(data);
						} catch (error) {
							console.error(error);
							alertify.error("글 조회과정에 문제가 생겼습니다.");
						}
					}


					function makeDetailHtml(detail) {
						console.log(detail);
						var boardId = detail.boardId;
						var userSeq = detail.userSeq;
						var userName = detail.userName;
						var title = detail.title;
						var content = detail.content;
						var regDt = detail.regDt;

						var regDtStr = detail.regDt;

						var readCount = detail.readCount;
						var sameUser = detail.sameUser;
						var fileList = detail.fileList;

						document.querySelector("#boardDetailModal").setAttribute("data-boardId", boardId);
						document.querySelector("#boardIdDetail").innerHTML = "#" + boardId;
						document.querySelector("#titleDetail").innerHTML = title;
						document.querySelector("#contentDetail").innerHTML = content;
						document.querySelector("#userNameDetail").innerHTML = userName;
						document.querySelector("#regDtDetail").innerHTML = regDtStr;
						document.querySelector("#readCountDetail").innerHTML = readCount;

						if (sameUser) {
							document.querySelector("#btnBoardUpdateUI").style.display = "inline-block";
							document.querySelector("#btnBoardDeleteUI").style.display = "inline-block";
						} else {
							document.querySelector("#btnBoardUpdateUI").style.display = "none";
							document.querySelector("#btnBoardDeleteUI").style.display = "none";
						}

						let modal = new bootstrap.Modal(document.querySelector("#boardDetailModal"));
						modal.show();
					}

					// update
					function validateUpdate() {
						var isTitleUpdateValid = false;
						var isContentUpdateValid = false;

						var titleUpdate = document.querySelector("#titleUpdate").value;
						var titleUpdateLength = titleUpdate.length;

						if (titleUpdateLength > 0) {
							isTitleUpdateValid = true;
						}

						var contentUpdateValue = document.querySelector("#contentUpdate").value;
						var contentUpdateLength = contentUpdateValue.length;

						if (contentUpdateLength > 0) {
							isContentUpdateValid = true;
						}

						if (isTitleUpdateValid && isContentUpdateValid) {
							return true;
						} else {
							return false;
						}
					}

					async function boardUpdate() {

						let boardId = document.querySelector("#boardUpdateModal").getAttribute("data-boardId");
						let title = document.querySelector("#titleUpdate").value;
						let content = document.querySelector("#contentUpdate").value;

						let urlParams = new URLSearchParams({
							boardId: boardId,
							title: title,
							content: content,
						});

						let fetchOptions = {
							method: "POST",
							body: urlParams,
						}

						let url = '/board/boardUpdate';

						try {
							let response = await fetch(url, fetchOptions);
							let data = await response.json();
							if (data.result == "success") {
								alertify.success('글이 수정되었습니다.');
								boardList();
							} else {
								alertify.error('글 수정 과젱에 문제가 있습니다.');
							}
						} catch (error) {
							console.error(error);
							alertify.error('글 수정 과젱에 문제가 있습니다.');
						}
					}

					//delete
					async function boardDelete() {

						var url = '/board/boardDelete';
						var urlParams = '?boardId=' + document.querySelector("#boardDetailModal").getAttribute("data-boardId");

						try {
							let response = await fetch(url + urlParams);
							let data = await response.json();

							if (data.result == "success") {
								alertify.success("글이 삭제되었습니다.");
								boardList();
							} else {
								alertify.error("글 삭제 과정에 문제가 생겼습니다.");
							}
						} catch (error) {
							console.error(error);
							alertify.error("글 삭제 과정에 문제가 생겼습니다.");
						}
					}


					//detail
					async function boardDetail(boardId) {

						var url = '/board/boardDetail';
						var urlParams = '?boardId=' + boardId;

						try {
							let response = await fetch(url + urlParams);
							let data = await response.json();
							console.log(data);
							makeDetailHtml(data);
						} catch (error) {
							console.error(error);
							alertify.error("글 조회과정에 문제가 생겼습니다.");
						}
					}

					function makeDetailHtml(detail) {
						console.log(detail);
						var boardId = detail.boardId;
						var userSeq = detail.userSeq;
						var userName = detail.userName;
						var title = detail.title;
						var content = detail.content;
						var regDt = detail.regDt;

						var regDtStr = makeDateStr(regDt.date.year, regDt.date.month, regDt.date.day, '.') + ' ' + makeTimeStr(regDt.time.hour, regDt.time.minute, regDt.time.second, ':');

						var readCount = detail.readCount;
						var sameUser = detail.sameUser;
						var fileList = detail.fileList;

						document.querySelector("#boardDetailModal").setAttribute("data-boardId", boardId);
						document.querySelector("#boardIdDetail").innerHTML = "#" + boardId;
						document.querySelector("#titleDetail").innerHTML = title;
						document.querySelector("#contentDetail").innerHTML = content;
						document.querySelector("#userNameDetail").innerHTML = userName;
						document.querySelector("#regDtDetail").innerHTML = regDtStr;
						document.querySelector("#readCountDetail").innerHTML = readCount;

						if (sameUser) {
							document.querySelector("#btnBoardUpdateUI").style.display = "inline-block";
							document.querySelector("#btnBoardDeleteUI").style.display = "inline-block";
						} else {
							document.querySelector("#btnBoardUpdateUI").style.display = "none";
							document.querySelector("#btnBoardDeleteUI").style.display = "none";
						}

						let modal = new bootstrap.Modal(document.querySelector("#boardDetailModal"));
						modal.show();
					}

				</script>



			</body>

			</html>