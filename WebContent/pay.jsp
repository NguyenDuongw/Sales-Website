<%@page import="model.Orders"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%--  Import a parameter from hom.jsp to header.jsp --%>
<c:import url="header.jsp">
	<c:param name="tittle" value="Web Shop"></c:param>
</c:import>


<!-- Get Attribute from PayController -->
<% Orders orders = (Orders)request.getAttribute("order"); %>
<% pageContext.setAttribute("orders", orders); %>


<div class="text-center">
  <img src="img/moving.gif" class="rounded mb-5" style="width:500px;height:auto;">
  <h3>Transporting to ${orders.getAddress()} through ${orders.getUserMail()}....</h3>
</div>


<c:import url="footer.jsp"></c:import>
