<%@page import="model.Product"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%--  Import a parameter from hom.jsp to header.jsp --%>
<c:import url="header.jsp">
	<c:param name="tittle" value="Web Shop"></c:param>
</c:import>

<!-- Get Attribute from SearchController -->
<% ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("products"); %>
<% pageContext.setAttribute("products", products); %>

<!-- Products Start -->
<div class="container-fluid pt-5 pb-3">
	<div class="row px-xl-5">
	
	<!-- Loop start -->
	<c:forEach var="product" items="${products}">
	
		<div class="col-lg-3 col-md-4 col-sm-6 pb-1">
			<div class="product-item bg-light mb-4">
				<div class="product-img position-relative overflow-hidden">
					<img class="img-fluid w-100" src="${product.getSrc()}" alt="">					
				</div>
				<div class="text-center py-4">
					<a class="h6 text-decoration-none text-truncate" href="<c:url value="/InformationProductController?id=${product.getId()}"/> ">${product.getName()}</a>
					<div class="d-flex align-items-center justify-content-center mt-2">
						<h5>${product.getPrice()}$</h5>						
					</div>
					<div class="d-flex align-items-center justify-content-center mb-1">
						<small class="fa fa-star text-primary mr-1"></small> <small
							class="fa fa-star text-primary mr-1"></small> <small
							class="fa fa-star text-primary mr-1"></small> <small
							class="fa fa-star text-primary mr-1"></small> <small
							class="fa fa-star text-primary mr-1"></small> <small>(99)</small>
					</div>
				</div>
			</div>
		</div>
			
	</c:forEach>
	<!-- Loop end -->
	
	</div>
</div>
<!-- Products End -->

<c:import url="footer.jsp"></c:import>