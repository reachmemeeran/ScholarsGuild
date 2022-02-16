<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div align="center">
	<div>
		<a href="${pageContext.request.contextPath}/admin/">
			<img src="../images/Scholarguild.jpeg" />
		</a>
	</div>
	<div>
		Welcome, <c:out value="${sessionScope.useremail}"></c:out> | <a href="logout">Logout</a> <br />
		<br />
	</div>
	<div id="headermenu">
		<div>
			<a href="list_users">
				<img src="../images/users.png"/><br/>Users
			</a>
		</div>
		<div>
			<a href="list_category">
				<img src="../images/category.png"/><br/>Categories
			</a>
		</div>
		<div>
			<a href="list_idea">
				<img src="../images/idea.png"/><br/>Idea
			</a>
		</div>
		<div>
			<a href="list_scholar">
				<img src="../images/scholar.png"/><br/>Scholars
			</a>
		</div>
	</div>
</div>