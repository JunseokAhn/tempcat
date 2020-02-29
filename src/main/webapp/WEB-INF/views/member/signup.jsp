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
		<div style="display: inline-block; background-color: rgba(255, 255, 255, 0.9); width: 55%; height: 370px; max-width: 850px; min-width: 579px; padding-left: 100px; padding-right: 100px;">
			<br>
			<br>
			<br>
			<form id="signupform" action="signup" method="post">
				<div style="text-align: right; float: left;">
					<span>아이디</span>
					<br>
					<span>비밀번호</span>
					<br>
					<span>비밀번호 재입력</span>
					<br>
					<span>이름</span>
					<br>
					<span>닉네임</span>
					<br>
					<span>이메일</span>
				</div>
				<div style="float: right;" align="left">
					<input id="id" name="id" placeholder="ID">
					<br>
					<input id="pw" name="pw">
					<br>
					<input id="pw2">
					<br>
					<input id="nam" name="nam">
					<br>
					<input id="nickname" name="nickname">
					<br>
					<input id="email1">
					@
					<input id="email2">
					<br>
					<input id="signup" type="button" value="SIGN UP">
				</div>
				<span id="id-check" style="font-size: 75%; color: red;"></span>
				<span id="pw-check" style="font-size: 75%; color: red;"></span>

			</form>


		</div>
	</div>
	<script type="text/javascript">
		var flag = true;
		var id, pw, pw2, nam, nickname;

		$('#id').on('keyup', function() {
			//유효성검사
			id = document.getElementById('id')
			if (id.value.length > 15) {
				$('#id-check').html('아이디는 15자리 이하여야입니다.')
				flag = false;
			}

		})
		$('#id').on('keydown', function() {
			//유효성검사
			id = document.getElementById('id')
			if (id.value.length < 16) {
				$('#id-check').html('');
				flag = true;
			}

		})

		$('#signup').on('click', function() {
			id = document.getElementById('id');
			pw = document.getElementById('pw');
			pw2 = document.getElementById('pw2');
			//pw2유효성
			nam = document.getElementById('nam');
			console.log(nam.value)
			nickname = document.getElementById('nickname');
			email1 = document.getElementById('email1').value;
			email2 = document.getElementById('email2').value;
			email = email1 + '@' + email2;
			$.ajax({
				url : 'signup',
				data : {
					id : id.value,
					pw : pw.value,
					name : nam.value,
					nickname : nickname.value,
					email : email
				},
				type : 'post',
				success : function(res) {
					alert(res)
					if (res == 'exist id') {
						alert('이미 아이디가 존재합니다.');
						id.focus();
					}
					if (res == 'insert error') {
						alert('알 수 없는 에러 발생, 오류유형 1.');
					}
					if (res == 'insert success') {
						location.href = "../index";
					}
				},
				error : function(res) {
					alert('알 수 없는 에러 발생, 오류유형 2.');
					//alert(JSON.stringify(res));
				}
			})

		})
	</script>

	<!-- Scripts -->

	<script src="<c:url value="/resources/assets/js/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/browser.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/breakpoints.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/util.js"/>"></script>
	<script src="<c:url value="/resources/assets/js/main.js"/>"></script>
</body>

</html>