<%@page import="model.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<%--  Import a parameter from hom.jsp to header.jsp --%>
<c:import url="header.jsp">
	<c:param name="tittle" value="Web Shop"></c:param>
</c:import>

<!-- Get Attribute from SearchController -->
<% Product product = (Product)request.getAttribute("products"); %>
<% pageContext.setAttribute("product", product); %>

<!-- If user have add to cart -->
<c:if test="${not empty messeger}">
  <script>alert("Product added to cart");</script>
</c:if>

<!-- Shop Detail Start -->
<div class="container-fluid pb-5">
	<div class="row px-xl-5">
		<div class="col-lg-5 mb-30">
			<div id="product-carousel" class="carousel slide"
				data-ride="carousel">
				<div class="bg-light">
					<img class="w-100 h-100" src="${product.getSrc()}" alt="Image">
				</div>
			</div>
		</div>

		<div class="col-lg-7 h-auto mb-30">
			<div class="h-100 bg-light p-30">
				<h3>${product.getName()}</h3>
				<h3 class="font-weight-semi-bold mb-4">${product.getPrice()}$</h3>
				<p class="mb-4">${product.getDescription()}</p>
				<div class="d-flex mb-3">
					<strong class="text-dark mr-3">Sizes:</strong>
					<form>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="size-1"
								name="size"> <label class="custom-control-label"
								for="size-1">XS</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="size-2"
								name="size"> <label class="custom-control-label"
								for="size-2">S</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="size-3"
								name="size"> <label class="custom-control-label"
								for="size-3">M</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="size-4"
								name="size"> <label class="custom-control-label"
								for="size-4">L</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="size-5"
								name="size"> <label class="custom-control-label"
								for="size-5">XL</label>
						</div>
					</form>
				</div>
				<div class="d-flex mb-4">
					<strong class="text-dark mr-3">Colors:</strong>
					<form>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="color-1"
								name="color"> <label class="custom-control-label"
								for="color-1">Black</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="color-2"
								name="color"> <label class="custom-control-label"
								for="color-2">White</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="color-3"
								name="color"> <label class="custom-control-label"
								for="color-3">Red</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="color-4"
								name="color"> <label class="custom-control-label"
								for="color-4">Blue</label>
						</div>
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="color-5"
								name="color"> <label class="custom-control-label"
								for="color-5">Green</label>
						</div>
					</form>
				</div>
				<div class="d-flex align-items-center mb-4 pt-2">
					<div class="input-group quantity mr-3" style="width: 130px;">
						<div class="input-group-btn">
							<button class="btn btn-primary btn-minus">
								<i class="fa fa-minus"></i>
							</button>
						</div>
						<input type="text"
							class="form-control bg-secondary border-0 text-center" value="1">
						<div class="input-group-btn">
							<button class="btn btn-primary btn-plus">
								<i class="fa fa-plus"></i>
							</button>
						</div>
					</div>
					<a href="${pageContext.request.contextPath}/AddToCartController?action=add&id=${product.getId()}" class="btn btn-primary px-3">
						<i class="fa fa-shopping-cart mr-1"></i> Add To Cart
					</a>
				</div>
				<div class="d-flex pt-2">
					<strong class="text-dark mr-2">Share on:</strong>
					<div class="d-inline-flex">
						<a class="text-dark px-2" href=""> <i
							class="fab fa-facebook-f"></i>
						</a> <a class="text-dark px-2" href=""> <i class="fab fa-twitter"></i>
						</a> <a class="text-dark px-2" href=""> <i
							class="fab fa-linkedin-in"></i>
						</a> <a class="text-dark px-2" href=""> <i
							class="fab fa-pinterest"></i>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>
<!-- Shop Detail End -->


<c:import url="footer.jsp"></c:import>
