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
				<a href="<c:url value="/"/>">Blog Contents</a>
			</h1>
			<nav class="links">
				<ul>
					<li><a href="#">Intro</a></li>
					<li><a href="<c:url value="/board/noticelist"/>">Notice Board</a></li>
					<li><a href="<c:url value="/board/freelist"/>">Free Board</a></li>
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
							<h3>INTRO</h3>
							<p>Introduction to the Producer</p>
						</a></li>
					<li><a href="<c:url value="/board/noticelist"/>">
							<h3>NOTICE BOARD</h3>
							<p>Only Admin can write</p>
						</a></li>
					<li><a href="<c:url value="/board/freelist"/>">
							<h3>FREE BOARD</h3>
							<p>Everyone can write</p>
						</a></li>
					<li><a href="#">
							<h3>Send Request</h3>
							<p>About the site or everything else.</p>
						</a></li>
				</ul>
			</section>

			<!-- Actions -->
			<section>
				<c:if test="${sessionScope.id==null}">
					<ul class="actions stacked">
						<li><a href="<c:url value="/member/login"/>" class="button large fit">Log In</a></li>
						<li><a href="<c:url value="/member/signup"/>" class="button large fit">Sign Up</a></li>
					</ul>
				</c:if>
				<c:if test="${sessionScope.id!=null}">
					<ul class="actions stacked">
						<li><a href="<c:url value="/member/profile"/>" class="button large fit">Profile</a></li>
						<li><a href="<c:url value="/member/logout"/>" class="button large fit">Log Out</a></li>
					</ul>
				</c:if>
			</section>

		</section>

	</div>

	<div style="text-align: center">
		<div style="display: inline-block; background-color: rgba(255, 255, 255, 0.9); width: 55%; min-height: 430px; min-width: 579px; padding-left: 100px; padding-right: 100px; border: solid 1px rgba(160, 160, 160, 0.3);">
			<br>
			<br>
			<section>
				<h3>Sign UP</h3>
				<hr>
				<br>

				<form method="post" action="#">
					<div class="row gtr-uniform">
						<div class="col-6 col-12-xsmall">
							<input type="text" name="id" id="id" value="" placeholder="ID" />
						</div>
						<span id="id-check" style="font-size: 75%; color: red;"></span>
						<div class="col-6 col-12-xsmall">
							<input type="text" name="nam" id="nam" placeholder="Your name" />
						</div>
						<div class="col-6 col-12-xsmall">
							<input type="text" name="nickname" id="nickname" placeholder="Nickname" />
						</div>
						<div class="col-6">
							<input type="email" name="demo-email" id="pw" placeholder="PASSWORD" />
							<input type="email" name="demo-email" id="pw2" placeholder="PASSWORD2" />
						</div>
						<span id="pw-check" style="font-size: 75%; color: red;"></span>

						<div class="col-6 col-12-xsmall">
							<input type="text" name="email1" id="email1" placeholder="E-Mail" />
						</div>

						<div class="col-6 col-12-xsmall">
							<select name="demo-category" id="email2">
								<option value="">- Select -</option>
								<option value="@naver.com">naver.com</option>
								<option value="@google.com">google.com</option>
								<option value="@daum.net">daum.net</option>
								<option value="@sesoc.global">sesoc.global</option>
							</select>
						</div>

						<!-- 
						<div class="col-4 col-12-small">
							<input type="radio" id="demo-priority-low" name="demo-priority" checked>
							<label for="demo-priority-low">Low</label>
						</div>
						<div class="col-4 col-12-small">
							<input type="radio" id="demo-priority-normal" name="demo-priority">
							<label for="demo-priority-normal">Normal</label>
						</div>
						<div class="col-4 col-12-small">
							<input type="radio" id="demo-priority-high" name="demo-priority">
							<label for="demo-priority-high">High</label>
						</div>
						<div class="col-6 col-12-small">
							<input type="checkbox" id="demo-copy" name="demo-copy">
							<label for="demo-copy">Email me a copy</label>
						</div> -->
						<div class="col-6 col-12-small">
							<input type="checkbox" id="robot" name="robot">
							<label for="robot">Not a robot</label>
						</div>
						<div class="col-6">
							<ul class="actions">
								<li><input id="signupBT" type="button" value="sign Up" onclick="signup()" /></li>
								<li><input type="reset" value="Reset" /></li>
							</ul>
						</div>
					</div>
				</form>
			</section>


		</div>
	</div>
	<script type="text/javascript">
        var flag = true;
        var id, pw, pw2, nam, nickname;
        
        $('#id').on('keyup', function () {
            //유효성검사
            id = document.getElementById('id')
            if(id.value.length > 15){
                $('#id-check').html('아이디는 15자리 이하여야입니다.')
                flag = false;
            }
            
        })
        $('#id').on('keydown', function () {
            //유효성검사
            id = document.getElementById('id')
            if(id.value.length < 16){
                $('#id-check').html('');
                flag = true;
            }
            
        })

        function signup () {
            id = document.getElementById('id');
            pw = document.getElementById('pw');
            pw2 = document.getElementById('pw2');
            //pw2유효성
            nam = document.getElementById('nam');
            console.log(nam.value)
            nickname = document.getElementById('nickname');
            email1 = document.getElementById('email1').value;
            email2 = document.getElementById('email2').value;
            email = email1 + '' + email2;
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
                success : function (res) {
                    alert(res)
                    if(res == 'exist id'){
                        alert('이미 아이디가 존재합니다.');
                        id.focus();
                    }
                    if(res == 'insert error'){
                        alert('알 수 없는 에러 발생, 오류유형 1.');
                    }
                    if(res == 'insert success'){
                        location.href = "<c:url value="/"/>";
                    }
                },
                error : function (res) {
                    alert('알 수 없는 에러 발생, 오류유형 2.');
                    //alert(JSON.stringify(res));
                }
            })
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