<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap"
	rel="stylesheet">

<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="../css/style.css" rel="stylesheet">
</head>
<body>
	<!-- Insert header -->
	<jsp:include page="../header.jsp" />

	<!-- Cart Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-lg-8 table-responsive mb-5">
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">Team Member</span>
				</h5>
				<table
					class="table table-light table-borderless table-hover text-center mb-0">
					<thead class="thead-dark">
						<tr>
							<th>ID</th>
							<th>Name</th>
							<th>Name</th>
							<th>Name</th>
							<th>Name</th>
						</tr>
					</thead>
					<tbody class="align-middle">
						<tr>
							<td class="align-middle">Member Name</td>
							<td class="align-middle">Member Name</td>
							<td class="align-middle">Member Name</td>
							<td class="align-middle">Member Name</td>
							<td class="align-middle">Member Name</td>
						</tr>
						<tr>
							<td class="align-middle">Member Name</td>
							<td class="align-middle">Member Name</td>
							<td class="align-middle">Member Name</td>
							<td class="align-middle">Member Name</td>
							<td class="align-middle">Member Name</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-lg-4">
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">Navigation</span>
				</h5>
				<nav
					class="navbar navbar-vertical navbar-light align-items-start p-0 bg-light"
					id="navbar-vertical" style="width: calc(100% - 30px);">
					<div class="navbar-nav w-100">
						<a href="" class="nav-item nav-link">Show Database</a> <a href=""
							class="nav-item nav-link">Show Chart</a>
					</div>
				</nav>

			</div>
		</div>
	</div>
	<!-- Cart End -->

	<!-- Insert header -->
	<jsp:include page="../footer.jsp" />

	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Template Javascript -->
	<script src="../js/main.js"></script>
</body>
</html>