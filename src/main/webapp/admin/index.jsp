<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="ISO-8859-1">
   <title>Guild Administration</title>
   <link rel="icon" type="image/jpg" href="../images/idea.jpg">
   <link rel="stylesheet" href="../css/style.css">
</head>
<body>
     <jsp:directive.include file="header.jsp" />
     
     <div align="center">
          <h2>Administrative Dashboard</h2>
     </div>
     <div align="center">
     <hr width="60%"/>
         <h2 class="pageheading">Quick Actions:</h2> 
          <b>
          <a href="new_idea">New Idea</a>&nbsp;&nbsp;&nbsp;
          <a href="user_form.jsp">New User</a>&nbsp;&nbsp;&nbsp;
          <a href="category_form.jsp">New Category</a>&nbsp;&nbsp;&nbsp;
          <a href="scholar_form.jsp">New Scholar</a>
          </b>
     </div>
     
     <div align="center">
          <hr width="60%"/>
          <h2 class="pageheading">Statistics</h2>
          <table>
          	<tr>
          		<td><b>Total Users: ${totalAdmins}</b></td>
          		<td><b>Total Idea: ${totalIdea}</b></td>
          		<td><b>Total Scholars: ${totalScholars}</b></td>
          	</tr>
          </table>
     </div>
     
     <jsp:directive.include file="footer.jsp" />
</body>
</html>