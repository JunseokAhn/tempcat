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
	<div style="text-align: center">
		<div style="display: inline-block; background-color: rgba(255, 255, 255, 0.9); width: 75%;">
			<br>
			<br>
			<br>
			<form id="loginform" action="login" method="post">
				<input id="id" type="text" name="id" placeholder="ID" width="50%">
				<input id="pw" type="text" name="pw" placeholder="PASSWORD" width="50%">
				<input id="login" type="button" value="LOG IN">
				<input id="signup" type="button" value="SIGN UP" onclick="signup()">
			</form>
		</div>
	</div>
	<script type="text/javascript">
        $('#login').on('click', function () {
            var flag = true;
            var id = document.getElementById('id')
            var pw = document.getElementById('pw')
            alert('login')
            //아이디입력했는지
            if(!id.value.length > 0){
                alert('아이디를 입력해주세요')
                id.focus();
                return false;
            }
            //비밀번호입력했는지
            if(!pw.value.length > 0){
                alert('비밀번호를 입력해주세요')
                pw.focus();
                return false;
            }
            document.getElementById('loginform').submit();
        })
        
        function signup(){
        	location.href='signup'
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