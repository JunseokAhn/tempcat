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
					<li><a href="<c:url value="/intro"/>">Intro</a></li>
					<li><a href="<c:url value="/notice/noticelist"/>">Notice Board</a></li>
					<li><a href="<c:url value="/free/freelist"/>">Free Board</a></li>
				</ul>
			</nav>
			<nav class="main">
				<ul>
					<li class="search"><a class="fa-search" href="#search">Search</a>
						<form id="search" method="get" action="<c:url value="/searchlist"/>">
							<input type="text" name="searchText" placeholder="Title" />
						</form></li>
					<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>

		<!-- Menu -->
		<section id="menu">

			<!-- Search -->
			<section>
				<form id="search" method="get" action="<c:url value="/searchlist"/>">
					<input type="text" name="searchText" placeholder="Title" />
				</form>
			</section>

			<!-- Links -->
			<section>
				<ul class="links">
					<li><a href="<c:url value="/intro"/>">
							<h3>INTRO</h3>
							<p>Introduction to the Producer</p>
						</a></li>
					<li><a href="<c:url value="/notice/noticelist"/>">
							<h3>NOTICE BOARD</h3>
							<p>Only Admin can write</p>
						</a></li>
					<li><a href="<c:url value="/free/freelist"/>">
							<h3>FREE BOARD</h3>
							<p>Everyone can write</p>
						</a></li>
					<li><a href="<c:url value="/request"/>">
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




		<div style="text-align: center">
			<div style="display: inline-block; background-color: rgba(255, 255, 255, 0.9); width: 55%; min-height: 430px; min-width: 579px; padding-left: 100px; padding-right: 100px; border: solid 1px rgba(160, 160, 160, 0.3);">
				<br>
				<br>
				<section>
					<h3>Sign UP</h3>
					<hr>
					<br>
					<div>
						<span id="id-error" style="font-size: 75%; color: red; position: absolute; background-color: white;"></span>
						<span id="pw-error" style="font-size: 75%; color: red; position: absolute; background-color: white;"></span>
						<span id="nam-error" style="font-size: 75%; color: red; position: absolute; background-color: white;"></span>
						<span id="nick-error" style="font-size: 75%; color: red; position: absolute; background-color: white;"></span>
						<span id="email-error" style="font-size: 75%; color: red; position: absolute; background-color: white;"></span>
					</div>
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
								<input type="password" name="pw" id="pw" placeholder="PASSWORD" />
							</div>
							<div class="col-6">
								<input type="password" name="pw2" id="pw2" placeholder="PASSWORD2" />
							</div>
							<div class="col-6 col-12-xsmall">
								<input type="text" name="email1" id="email1" placeholder="E-Mail" />
							</div>

							<div class="col-6 col-12-xsmall">
								<select name="email2" id="email2">
									<option value="select">- Select -</option>
									<option value="@naver.com">naver.com</option>
									<option value="@google.com">google.com</option>
									<option value="@daum.net">daum.net</option>
									<option value="@sesoc.global">sesoc.global</option>
								</select>
							</div>

							<div class="col-6 col-12-small">
								<input type="checkbox" id="robot" name="robot">
								<label for="robot">Not a robot</label>
							</div>
							<div class="col-6">
								<ul class="actions">
									<li><input id="signupBT" type="button" value="sign Up" onclick="signup()" /></li>
									<li><input type="reset" value="Reset" onclick="reset()" /></li>
								</ul>
							</div>
						</div>
						<hr style="margin-top: 40px;">
						<div id="error" style="font-size: 75%; color: red; margin-bottom: 72px;"></div>
					</form>
				</section>


			</div>
		</div>
	</div>
	<script type="text/javascript">
        var idFlag = false;
        var pwFlag = false;
        var nameFlag = false;
        var nickFlag = false;
        var emailFlag = false;
        
        var id = document.getElementById('id');
        var pw = document.getElementById('pw');
        var pw2 = document.getElementById('pw2');
        var nam = document.getElementById('nam');
        var nickname = document.getElementById('nickname');
        var email1 = document.getElementById('email1');
        var email2 = document.getElementById('email2');
        var email = email1.value + '' + email2.value;
        
        setInterval(function () {
            
            if($('#id').val().length > 13){
                $('#id-error').html('아이디는 13자리 이하여야입니다.');
                idFlag = false;
            }
            if($('#id').val().length < 14){
                $('#id-error').html('');
                idFlag = true;
            }
            if($('#pw').val().length > 13){
                $('#pw-error').html('비밀번호는 13자리 이하여야입니다');
                pwFlag = false;
            }
            if($('#pw').val().length < 14){
                $('#pw-error').html('');
                pwFlag = true;
            }
            if($('#nam').val().length > 13){
                $('#nam-error').html('이름은 13자리 이하여야입니다');
                nameFlag = false;
            }
            if($('#nam').val().length < 14){
                $('#nam-error').html('');
                nameFlag = true;
            }
            if($('#email1').val().length > 13){
                $('#email-error').html('이메일은 13자리 이하여야입니다');
                emailFlag = false;
            }
            if($('#email1').val().length < 14){
                $('#email-error').html('');
                emailFlag = true;
            }
            if($('#nickname').val().length > 13){
                $('#nick-error').html('닉네임은 13자리 이하여야입니다');
                nickFlag = false;
            }
            if($('#nickname').val().length < 14){
                $('#nick-error').html('');
                nickFlag = true;
            }
        }, 500);
        
        function reset () {
            idFlag = false;
            pwFlag = false;
            nameFlag = false;
            nickFlag = false;
            emailFlag = false;
            $('#id-error').html('');
            $('#pw-error').html('');
            $('#nam-error').html('');
            $('#email-error').html('');
            $('#nick-error').html('');
        }
        function signup () {
            if(!$('#robot').is(':checked')){
                alert('로봇은 가입할 수 없습니다.');
                return false;
            }
            if(idFlag == false || pwFlag == false || nameFlag == false || nickFlag == false || emailFlag == false){
                return false;
            }
            
            if(id.value.length < 1){
                $('#error').html('아이디를 입력해주세요');
                id.focus();
                return false;
            }
            
            if(pw.value.length < 1){
                $('#error').html('비밀번호를 입력해주세요');
                pw.focus();
                return false;
            }
            if(nam.value.length < 1){
                $('#error').html('이름을 입력해주세요');
                nam.focus();
                return false;
            }
            if(nickname.value.length < 1){
                $('#error').html('닉네임을 입력해주세요');
                nickname.focus();
                return false;
            }
            if(email1.value.length < 1){
                $('#error').html('이메일을 입력해주세요');
                email1.focus();
                return false;
            }
            if(email2.value == 'select'){
                $('#error').html('이메일 주소를 입력해주세요');
                email2.focus();
                return false;
            }
            if(pw.value != pw2.value){
                $('#error').html('비밀번호를 확인해주세요');
                pw2.focus();
                return false;
            }
            
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