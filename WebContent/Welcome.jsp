<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<META http-equiv="refresh" URL="Login.jsp">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
</head>
<body>

    <!-- Page Content -->
<div class="container">
      <div class="row">
      <%
      	if(session.getAttribute("uname") == null){
      		response.sendRedirect("Home.jsp");
      	}
      %>
        <div class="col-lg-3">
        <%
        	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //HTTP 1.1
        
        	response.setHeader("Pragma", "no-cache"); //HTTP 1.0
        	
        	response.setHeader("Expires", "0"); //Proxies
        
        %>
          <% String name; %>
        <form action="LogoutServlet">
		<input class = "btn" type="submit" value="logout"><br>
		</form>
		
		<form action="SearchServlet">
		<input class = "btn" type="submit" value="My Account">
		</form>
          <%
		if(!session.isNew()){
		name = (String)session.getAttribute("uname");
		%>
		<h1>Welcome <%=name %>!</h1><br>
		<%
		}
		else{
			response.sendRedirect("Home.jsp");
		}
		%>
		
		
        </div>
        <!-- /.col-lg-3 -->
        <div class="col-lg-9">

          <!-- <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
            <ol class="carousel-indicators">
              <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
              <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
            </ol>
            <div class="carousel-inner" role="listbox">
              <div class="carousel-item active">
                <img class="d-block img-fluid" src="cover1.jpg" alt="First slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="cover2.jpg" alt="Second slide">
              </div>
              <div class="carousel-item">
                <img class="d-block img-fluid" src="cover3.png" alt="Third slide">
              </div>
            </div>
            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="sr-only">Next</span>
            </a>
          </div>-->
          <center><h1 class="my-4">Book Store</h1></center>

			<%
			int book1 = 2000;
			int book2 = 2000;
			int book3 = 500;
			int book4 = 1500;
			int book5 = 700;
			int book6 = 1800;
			%>
          <div class="row">

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="images/cover1.jpg" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">A song of ice and fire</a>
                  </h4>
                  <h5>George R R Martin</h5>
                  <h5>Rs. <%=book1 %></h5>
                  <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                  <form action="BuyServlet">
                  	<input class="btn" type="submit" value="Buy Now">
                  </form>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="images/cover2.jpg" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">Harry Potter</a>
                  </h4>
                  <h5>J K Rowling</h5>
                  <h5>Rs. <%=book2 %></h5>
                  <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
				<form action="BuyServlet">
                  	<input class="btn" type="submit" value="Buy Now">
                </form>
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="images/cover3.jpg" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">The fault in our stars</a>
                  </h4>
                  <h5>John Green</h5>
                  <h5>Rs. <%=book3 %></h5>
                  <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                  <input class="btn" type="button" value="Buy Now">
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="images/cover4.jpg" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">The immortals of meluha</a>
                  </h4>
                  <h5>Amish Tripathi</h5>
                  <h5>Rs. <%=book4 %></h5>
                  <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                  <input class="btn" type="button" value="Buy Now">
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="images/cover5.jpg" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">The Haunting of Hill House</a>
                  </h4>
                  <h5>Shirley Jackson</h5>
                  <h5>Rs. <%=book5 %></h5>
                  <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur! Lorem ipsum dolor sit amet.</p>
                  <input class="btn" type="button" value="Buy Now">
                </div>
              </div>
            </div>

            <div class="col-lg-4 col-md-6 mb-4">
              <div class="card h-100">
                <a href="#"><img class="card-img-top" src="images/cover6.jpg" alt=""></a>
                <div class="card-body">
                  <h4 class="card-title">
                    <a href="#">Sherlock Holmes - All parts</a>
                  </h4>
                  <h5>Arthur Conan Doyle</h5>
                  <h5>Rs. <%=book6 %></h5>
                  <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Amet numquam aspernatur!</p>
                  <input class="btn" type="button" value="Buy Now">  
              </div>
              </div>
            </div>

          </div>
          <!-- /.row -->

        </div>
        <!-- /.col-lg-9 -->

      </div>
      <!-- /.row -->

    </div>
    <!-- /.container -->


</body>
</html>