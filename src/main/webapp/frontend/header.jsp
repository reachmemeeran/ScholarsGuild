<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="center">
	<div>
		<a href="${pageContext.request.contextPath}">
			<img src="images/Scholarguild.jpeg" />
		</a>
	</div>

	<div>
		<form action="search" method="get">
			<input type="text" name="keyword" size="50" /> 
			<input type="submit" value="Search" /> 
		
		
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			
			<c:if test="${loggedScholar==null }">
				<a href="login">Sign In</a> | 
				<a href="register">Register</a> | 
			</c:if>
			<c:if test="${loggedScholar!=null }">
				<a href="view_profile">Welcome, ${loggedScholar.fullname }</a> | 
				<a href="view_orders">My Orders</a> |
				<a href="logout">Logout</a> | 
			</c:if>
			
			<a href="view_cart">Cart</a>
		</form>
	</div>
</div>