    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
        integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    <link rel="stylesheet" href="css/style.css"> 
        <div class="header">
            <div class="link-item-h">
            	<a href="${pageContext.request.contextPath}">
                	<img src="images/Scholarguild.jpeg">
                </a>
            </div>
            <div class="middle-item">
                <div class="link-item-h">
                	<a href="${pageContext.request.contextPath}">Activity</a>
                </div>
                <div class="link-item-h">
                    <a href="#">Members</a>
                </div>
                <div class="link-item-h">
                    <a href="#">Group</a>
                </div>
                <div class="link-item-h">
                    <a href="#">Forum</a>
                </div>
                <div class="link-item-h">
                    <a href="#">Blog</a>
                </div>
                <div class="link-item-h">
                    <a href="#">Integration</a>
                </div>
            </div>
            <div class="link-item-h user-cont">
            <c:if test="${loggedScholar!=null }">
            	<c:if test="${profilepic!=null }">
            	<img src="data:image/jpeg;base64,${profilepic}" alt="Avatar" style="width:60px;height:50px;border-radius:50%"/>
            	</c:if>
            	<c:if test="${profilepic==null }">
            		<div class="user-icon"><a class="fa-solid fa-user"></a></div>
            	</c:if>
                <a href="view_profile">Welcome, ${loggedScholar.fullname } </a>
                <i><a href="logout"> <span>Logout</span></a></i>
            </c:if>
            <c:if test="${loggedScholar==null }">
            	<a href="login">Sign In</a>
            	<a href="register">Scholar Register</a>
            </c:if>
            </div>
            <div class="right-item">
                <div class="link-item-h margin-left-3">
                   <a class="fa-solid fa-magnifying-glass"></a>
                </div>
                <div class="link-item-h margin-left-3">
                   <a class="fa-solid fa-inbox"></a>
                </div>
                <div class="link-item-h margin-left-3">
                   <a class="fa-solid fa-bell"></a>
                </div>
                <div class="link-item-h margin-left-3">
                   <a class="fa-solid fa-cart-shopping"></a>
                </div>
            </div>

        </div>
        <div class="sidebar">
            <div class="link-item-s">
                <a class="fa fa-bars"></a>
            </div>
            <div class="link-item-s item-margin-2">
                <a class="fa-solid fa-user"></a>
            </div>
            <div class="link-item-s">
                <a class="fa-solid fa-user-group"></a>
            </div>
            <div class="link-item-s">
                <a class="fa-solid fa-inbox"></a>
            </div>
            <div class="link-item-s">
                <a class="fa-solid fa-image"></a>
            </div>
            <div class="link-item-s">
                <a class="fa-solid fa-graduation-cap"></a>
            </div>
            <div class="link-item-s">
                <a class="fa-solid fa-comments"></a>
            </div>
            <div class="link-item-s">
                <a class="fa-brands fa-facebook"></a>
            </div>
            <div class="link-item-s">
                <a class="fa-brands fa-instagram-square"></a>
            </div>
            <div class="link-item-s">
                <a class="fa-brands fa-linkedin"></a>
            </div>
            <div class="link-item-s item-last">
            	<a class="fa-solid fa-gear"></a>
            </div>

        </div>

