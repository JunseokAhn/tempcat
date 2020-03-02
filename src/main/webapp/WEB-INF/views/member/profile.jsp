<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>TempCat</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="<c:url value="/resources/js/jquery-3.4.1.js/"/>"></script>
<link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css"/>" />
</head>
<body class="is-preload">

	<!-- Wrapper -->
	<div id="wrapper">

		<!-- Header -->
		<header id="header">
			<h1>
				<a href="index.html">Blog Contents</a>
			</h1>
			<nav class="links">
				<ul>
					<li><a href="#">Intro</a></li>

					<li><a href="#">Board</a></li>
				</ul>
			</nav>
			<nav class="main">
				<ul>
					<li class="search"><a class="fa-search" href="#search">Search</a>
						<form id="search" method="get" action="#">
							<input type="text" name="query" placeholder="Search" />
						</form></li>
					<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>

		<!-- Menu -->
		<section id="menu">

			<!-- Search -->
			<section>
				<form class="search" method="get" action="#">
					<input type="text" name="query" placeholder="Search" />
				</form>
			</section>

			<!-- Links -->
			<section>
				<ul class="links">
					<li><a href="#">
							<h3>Lorem ipsum</h3>
							<p>Feugiat tempus veroeros dolor</p>
						</a></li>
					<li><a href="#">
							<h3>Dolor sit amet</h3>
							<p>Sed vitae justo condimentum</p>
						</a></li>
					<li><a href="#">
							<h3>Feugiat veroeros</h3>
							<p>Phasellus sed ultricies mi congue</p>
						</a></li>
					<li><a href="#">
							<h3>Etiam sed consequat</h3>
							<p>Porta lectus amet ultricies</p>
						</a></li>
				</ul>
			</section>

			<!-- Actions -->
			<section>
				<ul class="actions stacked">
					<li><a href="login" class="button large fit">Log In</a></li>

				</ul>
			</section>

		</section>
	</div>
	<div style="position: relative; float: left;">
		<!-- Post -->
		<article class="post" style="position: relative; width: 45%; display: inline-block;">
			<header>
				<div class="title">
					<h2>
						<a href=""> My profile </a>
						<img id="contextBT" style="width: 4%; min-width: 18px;" src="<c:url value="/resources/images/down.png"/>" onclick="contexting()">
					</h2>
					<p id="context"></p>
				</div>
				<div class="meta">
					<time class="published" datetime="2015-11-01">Sign UP - 2020. 03. 01.</time>
					<a href="#" class="author">
						<span class="name">${sessionScope.name}</span>
						<img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
					</a>

				</div>
			</header>
			<%-- <a href="single.html" class="image featured">
				<img src="<c:url value="/resources/images/pic01.jpg"/>" alt="" />
			</a> --%>

			<footer>
				<ul class="stats">
					<li><a href="#">NICK NAME</a></li>
					<li><a href="#">${sessionScope.nickname}</a></li>
				</ul>
			</footer>
			<span class="name">${sessionScope.nickname}</span>
			<ul class="actions">
				<li><a href="single.html" class="button large">Change</a></li>
			</ul>
			<footer>
				<ul class="actions">
					<li><a href="single.html" class="button large">My Information</a></li>
				</ul>

			</footer>
		</article>
		<!-- Post -->
		<article class="post" style="position: relative; float: right; width: 45%;">
			<header>
				<div class="title">
					<h2>
						<a href="single.html">Lately Activity</a>
					</h2>
					<p>your lastest 3month activity</p>
				</div>
				<div class="meta">
					<time class="published" datetime="2015-11-01">November 1, 2015</time>
					<a href="#" class="author">
						<span class="name">Jane Doe</span>
						<img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
					</a>
				</div>
			</header>
			<p>sdafdsa</p>
			<p>sadfsda</p>
			<footer>
				<ul class="actions">
					<li><a href="single.html" class="button large">View My Posts</a></li>
					<li><a href="single.html" class="button large">View My Comments</a></li>
					<li><a href="single.html" class="button large">Continue Reading</a></li>
				</ul>
				<ul class="stats">
					<li><a href="#">General</a></li>
					<li><a href="#" class="icon solid fa-heart">28</a></li>
					<li><a href="#" class="icon solid fa-comment">128</a></li>
				</ul>
			</footer>
		</article>
	</div>

	<script type="text/javascript">
        function contexting () {
            $('#context')
                    .html('비밀번호를 변경하거나 개인정보를 변경할 수 있습니다. 주기적인 비밀번호 변경을 통해 개인정보를 안전하게 보호하세요.');
            $('#contextBT')
                    .attr('src', '<c:url value="/resources/images/up.png"/>')
                    .attr('onclick', 'contexted()');
        }
        function contexted () {
            $('#context').html('');
            $('#contextBT')
                    .attr('src', '<c:url value="/resources/images/down.png"/>')
                    .attr('onclick', 'contexting()');
        }
    </script>

	<!-- Scripts -->

	<script src="<c:url value="/resources/assets/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/browser.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/breakpoints.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/util.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/main.js"/>"></script>
</body>

</html>