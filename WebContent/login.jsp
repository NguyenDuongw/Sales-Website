<%@page import="org.eclipse.jdt.internal.compiler.ast.IfStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.If"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/login-style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="container">
		<div class="screen">
			<div class="screen__content">
				<c:if test='${param.action == "dologin" }'>
					<div
						style="padding: 20px; background-color: #f44336; color: white; z-index: -1;">
						<strong><%=request.getAttribute("message")%></strong>
					</div>
				</c:if>

				<form class="login" name="loginForm"
					onsubmit="return validateForm()"
					action="<%=response.encodeUrl(request.getContextPath() + "/login?action=dologin")%>"
					method="post">
					<input type="hidden" name="action" value="dologin" />
					<div class="login__field">
						<i class="login__icon fa fa-user"></i> 
						<input type="text" class="login__input" placeholder="User name / Email" name="email" id="uname">
					</div>
					<div class="login__field">
						<i class="login__icon fa fa-lock"></i> <input type="password"
							class="login__input" placeholder="Password" name="password" id="psw">
					</div>
					<button class="button login__submit" type="submit" id="submit-btn">
						<span class="button__text">Log In Now</span> <i
							class="button__icon fa fa-chevron-right"></i>
					</button>
				</form>
				<div class="social-login">
					<h3>log in via</h3>
					<div class="social-icons">
						<a href="#" class="social-login__icon fa fa-instagram"></a> <a
							href="#" class="social-login__icon fa fa-facebook"></a> <a
							href="#" class="social-login__icon fa fa-twitter"></a>
					</div>
				</div>
			</div>
			<div class="screen__background">
				<span class="screen__background__shape screen__background__shape4"></span>
				<span class="screen__background__shape screen__background__shape3"></span>
				<span class="screen__background__shape screen__background__shape2"></span>
				<span class="screen__background__shape screen__background__shape1"></span>
			</div>
		</div>
	</div>
	<script src="js/login.js"></script>
</body>
</html>