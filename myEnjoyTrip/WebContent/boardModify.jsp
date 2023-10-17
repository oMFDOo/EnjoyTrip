<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description"
	content="megakit,business,company,agency,multipurpose,modern,bootstrap4">

<meta name="author" content="themefisher.com">

<title><span style = "color:#fff;">Mega<span>kit| Html5 Agency template</title>

<!-- bootstrap.min css -->
<link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
<!-- Icon Font Css -->
<link rel="stylesheet" href="plugins/themify/css/themify-icons.css">
<link rel="stylesheet" href="plugins/fontawesome/css/all.css">
<link rel="stylesheet"
	href="plugins/magnific-popup/dist/magnific-popup.css">
<!-- Owl Carousel CSS -->
<link rel="stylesheet" href="plugins/slick-carousel/slick/slick.css">
<link rel="stylesheet"
	href="plugins/slick-carousel/slick/slick-theme.css">

<!-- Main Stylesheet -->
<link rel="stylesheet" href="css/style.css">


<!-- summernote-->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	integrity="sha256-7ZWbZUAi97rkirk4DcEp4GWDPkWpRMcNaEyXGsNXjLg="
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.css"
	integrity="sha256-IKhQVXDfwbVELwiR0ke6dX+pJt0RSmWky3WB2pNx9Hg="
	crossorigin="anonymous">

<!-- hashtag -->
<script src="https://cdn.jsdelivr.net/npm/@yaireo/tagify"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/@yaireo/tagify/dist/tagify.css"
	rel="stylesheet" type="text/css" />
</head>

<body>

	<!-- Header Start -->

	<header class="navigation">
		<div class="header-top ">
			<div class="container"></div>
		</div>
		<nav class="navbar navbar-expand-lg  py-4" id="navbar">
			<div class="container">
				<a class="navbar-brand" href="index.jsp" style="color:#fff;"> Mega<span>kit.</span>
				</a>

				<button class="navbar-toggler collapsed" type="button"
					data-toggle="collapse" data-target="#navbarsExample09"
					aria-controls="navbarsExample09" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="fa fa-bars"></span>
				</button>

			</div>
		</nav>
	</header>


	<!-- Header Close -->

	<!-- Main Contents Start -->
	<div class="main-wrapper ">
		<!-- 글작성 창 Start -->
		<div class="container">
			<div class="row">
				<img src="" alt="">
			<div>
			<div class="row">
				<div class="col-lg-9 col-md-9 col-sm-0">
					<form id="board-form" action="">
						<h3 class="text-md mt-4 elice-font">Blog 글 작성</h3>
						<%@ page import="user.dto.*, java.util.*, board.dto.*" %>
						<% String contextPath=request.getContextPath(); UserDto userDto=(UserDto) session.getAttribute("userDto"); %>
						<% BoardDto boardDto=(BoardDto) session.getAttribute("boardDetail"); String
									boardTitle=boardDto.getTitle(); String userName=boardDto.getUserName(); String
									boardContent=boardDto.getContent(); String writeDay=boardDto.getRegDt(); int
									readCount=boardDto.getReadCount(); int boardId=boardDto.getBoardId(); int
									userNum=boardDto.getUserSeq(); 
									System.out.println("여기좀 보시오 : " + boardTitle);
						%>
						<div class="form-group">
							<input id="board-title" name="user_id" type="text" class="form-control" placeholder="제목을 입력하세요" value="<%= boardTitle %>">							
						</div>
						
						<div id="summernote"></div>
					</form>

				</div>
				<div class="col-lg-3 col-md-3 col-sm-0">
					<button  id="board-submit" class="btn btn-danger mt-5" style="width: 100%;">
						<h4 class=" elice-font mt-2" style="color: #fff;">작성 완료</h4>
					</button>
					<hr>
					<h5 class="suite-regular-font"><b>작성 가이드라인</b></h5>
					<div>
						<p style="background-color: #f6f6f6; padding: 10px;">공격적이거나
							모욕적인 언어, 불쾌한 주제와 성적인 내용에 대한 게시글은 예고없이 삭제조치 될 수 있습니다.</p>
					</div>
					<div>
						<p style="background-color: #f6f6f6; padding: 10px;">타인의 저작물을 침해하는 내용을 포함하지 마십시오.</p>
					</div>
				</div>

			</div>
		</div>
		<!-- 글작성 창 Close -->
	</div>
	<!-- Main Contents Close -->





	<!-- footer Start -->
	<footer class="footer section">
		<div class="container">
			<div class="row">
				
			</div>

			<div class="footer-btm pt-4">
				<div class="row">
					<div class="col-lg-6">
						<div class="copyright">
							&copy; Copyright Reserved to <span class="text-color">Megakit.</span>
							by <a href="https://themefisher.com/" target="_blank">Themefisher</a>
						</div>
					</div>
					<div class="col-lg-6 text-left text-lg-right">
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
			</div>
		</div>
	</footer>

	</div>

	<!-- 
    Essential Scripts
    =====================================-->

    <!--
    버튼 동작
    ============================-->

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"
		integrity="sha256-u7e5khyithlIdTpu22PHhENmPcRdFiHRjhAuHcs05RI="
		crossorigin="anonymous">
    </script>

	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/summernote-lite.min.js"
		integrity="sha256-5slxYrL5Ct3mhMAp/dgnb5JSnTYMtkr4dHby34N10qw="
		crossorigin="anonymous">
    </script>

	<!-- language pack -->
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.20/dist/lang/summernote-ko-KR.min.js"
		integrity="sha256-y2bkXLA0VKwUx5hwbBKnaboRThcu7YOFyuYarJbCnoQ="
		crossorigin="anonymous">
    </script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous">
    </script>

	<style>
        @font-face {
            font-family: 'HakgyoansimWoojuR';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2307-2@1.0/HakgyoansimWoojuR.woff2')
                format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'TheJamsil5Bold';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2')
                format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        @font-face {
            font-family: 'SUITE-Regular';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-2@1.0/SUITE-Regular.woff2')
                format('woff2');
            font-weight: 400;
            font-style: normal;
        }

        @font-face {
            font-family: 'omyu_pretty';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/omyu_pretty.woff2')
                format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'MBC1961GulimM';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/MBC1961GulimM.woff2')
                format('woff2');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'KimjungchulGothic-Bold';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/KimjungchulGothic-Bold.woff2')
                format('woff2');
            font-weight: 700;
            font-style: normal;
        }

        @font-face {
            font-family: 'IBMPlexSansKR-Regular';
            src:
                url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-07@1.0/IBMPlexSansKR-Regular.woff')
                format('woff');
            font-weight: normal;
            font-style: normal;
        }
    </style>
	<script>
            $('#summernote').summernote({
                placeholder: 'Share your tour',
                codeviewFilter: false,
                codeviewIframeFilter: true,
                codeviewIframeWhitelistSrc: [],
                codeviewIframeWhitelistSrcBase: [],
                codeviewIframeWhitelistTarget: [],
                codeviewIframeWhitelistSrc: ['*'],
                codeviewIframeWhitelistSrcBase: ['*'],
                codeviewIframeWhitelistTarget: ['*'],
                tabsize: 2,
                height: 500,
                lang: 'ko-KR', // default: 'en-US'
                fontNames: ['HakgyoansimWoojuR', 'TheJamsil5Bold', 'SUITE-Regular', 'omyu_pretty', 'MBC1961GulimM', 'KimjungchulGothic-Bold','IBMPlexSansKR-Regular'],
                fontNamesIgnoreCheck: ['HakgyoansimWoojuR', 'TheJamsil5Bold', 'SUITE-Regular', 'omyu_pretty','MBC1961GulimM', 'KimjungchulGothic-Bold','IBMPlexSansKR-Regular'],
            });
            $('#summernote').summernote('pasteHTML', `<%=boardContent%>`);
    </script>



    <script>
        // summernote 값 가져오기
        document.querySelector("#board-submit").onclick = getValueBoard;
        async function getValueBoard() {
            const boardTitle = document.querySelector("#board-title");
            const summernoteContent = $('#summernote').summernote('code');
            

            let urlParams = new URLSearchParams({
                path: "/board/boardUpdate",
                boardId: <%=boardDto.getBoardId()%>,
                boardTitle: boardTitle.value,
                content: summernoteContent
            });
            let fetchOptions = {
                method: "POST",
                body: urlParams
            };
            let response = await fetch("/board/boardUpdate", fetchOptions);
            console.log(response);
            location.replace("/boardList.jsp");
        	
        }
    </script>




	<!-- Main jQuery -->
	<!-- <script src="plugins/jquery/jquery.js"></script> -->
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

</body>

</html>