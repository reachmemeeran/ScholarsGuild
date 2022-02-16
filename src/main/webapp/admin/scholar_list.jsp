<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Manage Idea - Guild Administration</title>
	<link rel="stylesheet" href="../css/style.css">
	<script type="text/javascript" src="../js/jquery-3.5.1.min.js"></script>
	<script type="text/javascript" src="../js/jquery.validate.min.js"></script>
</head>
<body>
	<jsp:directive.include file="header.jsp" />
	<div align="center">
		<h2 class="pageheading">Scholar Management</h2>
	</div>

	<div align="center">
		<h3>
			<a href="scholar_form.jsp">Create New Scholar</a>
		</h3>
	</div>

	<c:if test="${message!=null}">
		<div align="center">
			<h4 class="message">
				${message}
			</h4>
		</div>
	</c:if>

	<div align="center">
		<table border="1" cellpadding="5">
			<tr>
				<th>Index</th>
				<th>ID</th>
				<th>E-Mail</th>
				<th>Full Name</th>
				<th>City</th>
				<th>Country</th>
				<th>Registered Date</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="scholar" items="${listScholar}" varStatus="status">
				<tr>
					<td>${status.index+1}</td>
					<td>${scholar.scholarId}</td>
					<td>${scholar.email}</td>
					<td>${scholar.fullname}</td>
					<td>${scholar.city}</td>
					<td>${scholar.country}</td>
					<td><fmt:formatDate pattern='MM/dd/yyyy' value='${scholar.registerDate }'/> </td>
					<td>
						<a href="edit_scholar?id=${scholar.scholarId}">Edit</a> &nbsp; 
						<a href="javascript:void(0);" class="deleteLink" id="${scholar.scholarId}">Delete</a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>


	<jsp:directive.include file="footer.jsp" />

	<script>
	
		$(document).ready(function(){
			$(".deleteLink").each(function(){
				$(this).on("click",function(){
					scholarId=$(this).attr("id");
					if(confirm("Are you sure you want to delete the scholar with ID " + scholarId + " ?")){
						window.location = 'delete_scholar?id='+scholarId;
					}
				});
			});
		});
	</script>
</body>
</html>