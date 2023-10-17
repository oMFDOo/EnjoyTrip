<%@ page import="user.dto.*, java.util.*, board.dto.*"%>
<%@ page session="true" %>
<head>
	<!-- 알림 창-->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<header class="navigation">
	<div class="header-top ">
		<div class="container">
			<div class="row justify-content-between align-items-center">
				<div class="col-lg-2 col-md-4">
					<div
						class="header-top-socials text-center text-lg-left text-md-left">
						<a href="https://www.facebook.com/themefisher" target="_blank"><i
							class="ti-facebook"></i></a> <a
							href="https://twitter.com/themefisher" target="_blank"><i
							class="ti-twitter"></i></a> <a href="https://github.com/themefisher/"
							target="_blank"><i class="ti-github"></i></a>
					</div>
				</div>

				<%
				
					//HttpSession mySession = request.getSession(); // 세션 가져오기
					//UserDto userDto = (UserDto) mySession.getAttribute("userDto"); // 세션에서 userDto 속성 가져오기
					UserDto userDto = (UserDto) session.getAttribute("userDto");
					System.out.println(userDto);
					if (userDto == null) {
				%>

				<%
					} else {
				%>
				
				
				<div
					class="col-lg-10 col-md-8 text-center text-lg-right text-md-right">
					<div id="myPageItem" class="header-top-info open">
						<a href="mypage.jsp"><span> My Page </span></a>
						<a href="board-write.jsp"><span> Blog Posting </span></a>
					</div>
				</div>
				
				<%
						
					}
				%>


			</div>
		</div>
	</div>
	<nav class="navbar navbar-expand-lg  py-4" id="navbar">
		<div class="container">
			<a class="navbar-brand" href="index.jsp"> Mega<span>kit.</span>
			</a>

			<button class="navbar-toggler collapsed" type="button"
				data-toggle="collapse" data-target="#navbarsExample09"
				aria-controls="navbarsExample09" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="fa fa-bars"></span>
			</button>

			<div class="collapse navbar-collapse text-center"
				id="navbarsExample09">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link"
						href="index.jsp">Home <span class="sr-only">(current)</span></a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown03"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">About</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown03">
							<li><a class="dropdown-item" href="about.jsp">Our
									company</a></li>
							<li><a class="dropdown-item" href="pricing.jsp">Pricing</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="service.jsp">Services</a></li>
					<li class="nav-item"><a class="nav-link" href="project.jsp">Portfolio</a></li>
					<li class="nav-item"><a class="nav-link" href="boardList.jsp">Blog
							JJIN</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown05"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Blog</a>
						<ul class="dropdown-menu" aria-labelledby="dropdown05">
							<li><a class="dropdown-item" href="blog-grid.jsp">Blog
									Grid</a></li>
							<li><a class="dropdown-item" href="blog-sidebar.jsp">Blog
									with Sidebar</a></li>

							<li><a class="dropdown-item" href="blog-single.jsp">Blog
									Single</a></li>
						</ul></li>
				</ul>

				<form class="form-lg-inline my-2 my-md-0 ml-lg-4 text-center">
					<div id="goLogInOutParent">


						<%
							if (session.getAttribute("userDto") == null) {
						%>
						<a id="goLogout" href="contact.jsp"
							class="btn btn-solid-border btn-round-full" value="login">Go
							Login</a>
						<%
						
							} else {
						%>
						<a id="goLogin"  href="/users?job=logout"
							class="btn btn-solid-border btn-round-full" value="logout">Go Logout</a>
						<%
							
							}
						%>
					</div>
				</form>
			</div>
		</div>
	</nav>
</header>