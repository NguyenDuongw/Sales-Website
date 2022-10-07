<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<%-- Receive parameter from home --%>
<title>${param.title}</title>

<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<!-- Topbar Start -->
	<div class="container-fluid">
		<div class="row bg-secondary py-1 px-xl-5">
			<div class="col-lg-6 d-none d-lg-block">
				<div class="d-inline-flex align-items-center h-100">
					<a class="text-body mr-3" href="">About</a> <a
						class="text-body mr-3" href="">Contact</a> <a
						class="text-body mr-3" href="">Help</a> <a class="text-body mr-3"
						href="">FAQs</a>
				</div>
			</div>
			<div class="col-lg-6 text-center text-lg-right">
				<div class="d-inline-flex align-items-center">
					<div class="btn-group">
						<button type="button" class="btn btn-sm btn-light dropdown-toggle"
							data-toggle="dropdown">My Account</button>
						<div class="dropdown-menu dropdown-menu-right">
							<button class="dropdown-item" type="button"
								onclick="window.location.href='/PRJ321x-Ass3/login?action=login';">
								Sign in</button>
							<button class="dropdown-item" type="button">Sign up</button>
						</div>
					</div>
					<div class="btn-group mx-2">
						<button type="button" class="btn btn-sm btn-light dropdown-toggle"
							data-toggle="dropdown">USD</button>
						<div class="dropdown-menu dropdown-menu-right">
							<button class="dropdown-item" type="button">EUR</button>
							<button class="dropdown-item" type="button">GBP</button>
							<button class="dropdown-item" type="button">CAD</button>
						</div>
					</div>
					<div class="btn-group">
						<button type="button" class="btn btn-sm btn-light dropdown-toggle"
							data-toggle="dropdown">EN</button>
						<div class="dropdown-menu dropdown-menu-right">
							<button class="dropdown-item" type="button">FR</button>
							<button class="dropdown-item" type="button">AR</button>
							<button class="dropdown-item" type="button">RU</button>
						</div>
					</div>
				</div>
				<div class="d-inline-flex align-items-center d-block d-lg-none">
					<a href="" class="btn px-0 ml-2"> <i
						class="fas fa-heart text-dark"></i> <span
						class="badge text-dark border border-dark rounded-circle"
						style="padding-bottom: 2px;">0</span>
					</a> <a href="" class="btn px-0 ml-2"> <i
						class="fas fa-shopping-cart text-dark"></i> <span
						class="badge text-dark border border-dark rounded-circle"
						style="padding-bottom: 2px;">0</span>
					</a>
				</div>
			</div>
		</div>
		<div
			class="row align-items-center bg-light py-3 px-xl-5 d-none d-lg-flex">
			<div class="col-lg-4">
				<a href="${pageContext.request.contextPath}/ListController"
					class="text-decoration-none"> <span
					class="h1 text-uppercase text-primary bg-dark px-2">PRJ</span> <span
					class="h1 text-uppercase text-dark bg-primary px-2 ml-n1">321x</span>
				</a>
			</div>
			<div class="col-lg-4 col-6 text-left">
				<form action="/PRJ321x-Ass3/SearchController" method="post">
					<div class="input-group">
						<input type="text" class="form-control"
							placeholder="Search for products" name="search">
						<div class="input-group-append">
							<button class="input-group-text bg-transparent text-primary"
								type="submit">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-4 col-6 text-right">
				<p class="m-0">Customer Service</p>
				<h5 class="m-0">+0904590933</h5>
			</div>
		</div>
	</div>
	<!-- Topbar End -->

	<!-- Navbar Start -->
	<div class="container-fluid bg-dark mb-30">
		<div class="row px-xl-5">
			<div class="col-lg-12 ">
				<nav
					class="navbar navbar-expand-lg bg-dark navbar-dark py-3 py-lg-0 px-0">
					<a href="${pageContext.request.contextPath}/ListController"
						class="text-decoration-none d-block d-lg-none"> <span
						class="h1 text-uppercase text-dark bg-light px-2">PRJ</span> <span
						class="h1 text-uppercase text-light bg-primary px-2 ml-n1">321x</span>
					</a>
					<button type="button" class="navbar-toggler" data-toggle="collapse"
						data-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-between"
						id="navbarCollapse">
						<div class="navbar-nav mr-auto py-0">
							<a href="#" class="nav-item nav-link active">Home</a> <a href="${pageContext.request.contextPath}/cart.jsp"
								class="nav-item nav-link">My Cart</a> <a href="#"
								class="nav-item nav-link">About Us</a>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- Navbar End -->