<%@page import="model.Product"%>
<%@page import="model.Cart"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%--  Import a parameter from hom.jsp to header.jsp --%>
<c:import url="header.jsp">
	<c:param name="tittle" value="Web Shop"></c:param>
</c:import>

<!-- Get Cart from SearchController -->
<% Cart c = (Cart) session.getAttribute("cart"); %>
<% pageContext.setAttribute("c", c); %>

<!-- Popup alert if cart empty -->
<c:if test="${not empty messeger}">
  <script>alert("Cart is empty");</script>
</c:if>

<!-- Cart Start -->
<div class="container-fluid">
	<div class="row px-xl-5">
		<div class="col-lg-8 table-responsive mb-5">
			<table
				class="table table-light table-borderless table-hover text-center mb-0">
				<thead class="thead-dark">
					<tr>
						<th>Products</th>
						<th>Price</th>
						<th>Quantity</th>
						<th>Total</th>
						<th>Remove</th>
					</tr>
				</thead>
				<tbody class="align-middle">

					<!-- Loop Start -->
					<c:forEach var="product" items="${c.getItems()}">
						<tr>
							<td class="align-middle"><img src="${product.getSrc()}"
								alt="" style="width: 60px;"> ${product.getName()}</td>
							<td class="align-middle">${product.getPrice()}$</td>
							<td class="align-middle">
								<div class="input-group quantity mx-auto" style="width: 100px;">
									<div class="input-group-btn">
										<button class="btn btn-sm btn-primary btn-minus">
											<i class="fa fa-minus"></i>
										</button>
									</div>
									<input type="text"
										class="form-control form-control-sm bg-secondary border-0 text-center"
										value="1">
									<div class="input-group-btn">
										<button class="btn btn-sm btn-primary btn-plus">
											<i class="fa fa-plus"></i>
										</button>
									</div>
								</div>
							</td>
							<td class="align-middle">${product.getPrice()}$</td>
							<td class="align-middle"><a class="btn btn-sm btn-danger"
								href="${pageContext.request.contextPath}/AddToCartController?action=delete&id=${product.getId()}">
									<i class="fa fa-times"></i>
							</a></td>
						</tr>

					</c:forEach>
					<!-- Loop end -->

				</tbody>
			</table>
		</div>
		<div class="col-lg-4">
			<form id="cartform" class="mb-30" action="${pageContext.request.contextPath}/PayController" method="post">
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">Order Information</span>
				</h5>

				<div class="bg-light p-30 mb-5">
					<div class="pb-2">
						<div class="form-group">
							<label for="exampleMail"><h6>Customer Mail</h6></label> <input
								type="text" class="form-control" id="exampleMail"
								placeholder="example@gmail.com" value="duong@gmail.com"
								name="usermail">
						</div>

						<div class="form-group">
							<label for="exampleAddress"><h6>Customer Address</h6></label> <input
								type="text" class="form-control" id="exampleAddress"
								placeholder="Ha Noi, Ho Chi Minh,..." value="Ha Noi"
								name="address">
						</div>
					</div>
				</div>

				<div class="input-group mb-5">
					<input type="text" class="form-control border-0 p-4" value="FLC"
						id="exampleCouple" placeholder="Coupon Code" name="discount">
					<div class="input-group-append">
						<button class="btn btn-primary">Apply Coupon</button>
					</div>
				</div>

				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">Cart Summary</span>
				</h5>

				<div class="bg-light p-30 mb-5">
					<div class="border-bottom pb-2">
						<div class="d-flex justify-content-between mb-3">
							<h6>Subtotal</h6>
							<h6>$150</h6>
						</div>
						<div class="d-flex justify-content-between">
							<h6 class="font-weight-medium">Shipping</h6>
							<h6 class="font-weight-medium">$10</h6>
						</div>
					</div>
					<div class="pt-2">
						<div class="d-flex justify-content-between mt-2">
							<h5>Total</h5>
							<h5>$160</h5>
						</div>
						<button type="submit"
							class="btn btn-block btn-primary font-weight-bold my-3 py-3">Proceed
							To Checkout</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<!-- Cart End -->

<c:import url="footer.jsp"></c:import>