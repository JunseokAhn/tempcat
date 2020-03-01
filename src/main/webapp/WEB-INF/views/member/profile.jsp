<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>TempCat</title>
<script src="<c:url value="/resources/js/jquery-3.4.1.js/"/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
	<!-- Post -->
	<article class="post">
		<header>
			<div class="title">
				<h2>
					<a href="single.html">Magna sed adipiscing</a>
				</h2>
				<p>Lorem ipsum dolor amet nullam consequat etiam feugiat</p>
			</div>
			<div class="meta">
				<time class="published" datetime="2015-11-01">November 1, 2015</time>
				<a href="#" class="author">
					<span class="name">Jane Doe</span>
					<img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
				</a>
			</div>
		</header>
		<a href="single.html" class="image featured">
			<img src="<c:url value="/resources/images/pic01.jpg"/>" alt="" />
		</a>
		<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies mi non congue ullam corper. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
		<footer>
			<ul class="actions">
				<li><a href="single.html" class="button large">Continue Reading</a></li>
			</ul>
			<ul class="stats">
				<li><a href="#">General</a></li>
				<li><a href="#" class="icon solid fa-heart">28</a></li>
				<li><a href="#" class="icon solid fa-comment">128</a></li>
			</ul>
		</footer>
	</article>
	<!-- Post -->
	<article class="post">
		<header>
			<div class="title">
				<h2>
					<a href="single.html">Magna sed adipiscing</a>
				</h2>
				<p>Lorem ipsum dolor amet nullam consequat etiam feugiat</p>
			</div>
			<div class="meta">
				<time class="published" datetime="2015-11-01">November 1, 2015</time>
				<a href="#" class="author">
					<span class="name">Jane Doe</span>
					<img src="<c:url value="/resources/images/avatar.jpg"/>" alt="" />
				</a>
			</div>
		</header>
		<a href="single.html" class="image featured">
			<img src="<c:url value="/resources/images/pic01.jpg"/>" alt="" />
		</a>
		<p>Mauris neque quam, fermentum ut nisl vitae, convallis maximus nisl. Sed mattis nunc id lorem euismod placerat. Vivamus porttitor magna enim, ac accumsan tortor cursus at. Phasellus sed ultricies mi non congue ullam corper. Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
		<footer>
			<ul class="actions">
				<li><a href="single.html" class="button large">Continue Reading</a></li>
			</ul>
			<ul class="stats">
				<li><a href="#">General</a></li>
				<li><a href="#" class="icon solid fa-heart">28</a></li>
				<li><a href="#" class="icon solid fa-comment">128</a></li>
			</ul>
		</footer>
	</article>
	<div style="text-align: center; padding-left: 10%;">
		<div style="display: inline-block; background-color: rgba(255, 255, 255, 0.9); width: 55%; height: 380px; max-width: 850px; min-width: 579px; padding-left: 100px; padding-right: 100px;">
			<br>
			<br>
			<br>
			<div style="text-align: right; float: left;">
				<span>Your Profile</span>

			</div>
			<div style="float: right;" align="left">
				<br>
				<br>
				<br>
				<span>Nick Name</span>${sessionScope.nickname}
			</div>
		</div>
	</div>
	<div style="display: inline-block; background-color: rgba(255, 255, 255, 0.9); width: 55%; height: 380px; max-width: 850px; min-width: 579px; padding-left: 100px; padding-right: 100px;">
		<br>
		<br>
		<br>
		<div style="text-align: right; float: left;">
			<span>아이디</span>
			<br>
		</div>
		<div style="float: right;" align="left">
			<input id="id" name="id" placeholder="ID">
			<br>
		</div>
	</div>
	</div>
	<script type="text/javascript">
		
	</script>

	<!-- Scripts -->

	<script src="<c:url value="/resources/assets/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/browser.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/breakpoints.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/util.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/main.js"/>"></script>
</body>

</html>