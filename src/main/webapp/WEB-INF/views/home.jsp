<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="<c:url value="/resources/js/jquery-3.4.1.js/"/>"></script>
<link href="	<c:url value="/resources/css/style.css"/>" rel="stylesheet">
<title>TempCat</title>
</head>
<body>
	<nav>
		<ul class="nav-container">
			<li>BLOG CONTENTS</li>
			<li><a href="<c:url value="/board/main"/>">BOARD</a></li>
		</ul>
	</nav>

	<hr>
	<hr>

	<a href="<c:url value="index"/>">index</a>
	<a href="<c:url value="/member/login"/>">LOG IN</a>


</body>
</html>