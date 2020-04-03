<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="_index" value="active" />

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Users</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <meta name="description" content="Your page description here" />
  <meta name="author" content="" />

  <!-- css -->
  <link href="https://fonts.googleapis.com/css?family=Handlee|Open+Sans:300,400,600,700,800" rel="stylesheet">
  <link href="static/css/bootstrap.css" rel="stylesheet" />
  <link href="static/css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="static/css/flexslider.css" rel="stylesheet" />
  <link href="static/css/prettyPhoto.css" rel="stylesheet" />
  <link href="static/css/camera.css" rel="stylesheet" />
  <link href="static/css/jquery.bxslider.css" rel="stylesheet" />
  <link href="static/css/style.css" rel="stylesheet" />

  <!-- Theme skin -->
  <link href="static/color/default.css" rel="stylesheet" />

  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="ico/favicon.png" />

</head>

<body>

  <div id="wrapper">

    <!-- start header -->
    <jsp:include page="header.jsp"/>
    <!-- end header -->

    <section id="inner-headline">
      <div class="container">
        <div class="row">
          <div class="span12">
            <div class="inner-heading">
              <ul class="breadcrumb">
                <li><a href="index">Home</a> <i class="icon-angle-right"></i></li>
                <li class="active">Users</li>
              </ul>
              <h2>Users</h2>
              
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="content">
      <div class="container">
        <div class="row">

          <div class="span3">
            <aside class="left-sidebar">
              <div class="widget">				
                <h5 class="widgetheading">
                <spring:message code="text.links"/>
                </h5>`					
                <ul class="cat">
                  <li><i class="icon-angle-right"></i> <a href="index">Home</a>
                  <i class="icon-home"></i>
                  </li>
                  <li><i class="icon-angle-right"></i> <a href="contact">Contact Us</a>
                  <i class="icon-envelope"></i>
                  </li>
                  <li><i class="icon-angle-right"></i> <a href="about">About</a>
                  <i class="icon-cog"></i>
                  </li>
                  <li><i class="icon-angle-right"></i> <a href="services">Services</a>
                  <i class="icon-wrench"></i>
                  </li>
                  <li><i class="icon-angle-right"></i> <a href="login">
                  Login</a>
                  <i class="icon-unlock"></i>
                  </li>
                </ul>
              </div>
    </aside>
          </div>

          <div class="span9">
            <article>
              <div class="row">

                <div class="span9">
                  <div class="post-image">
                    <div class="post-heading">
                      <h3>${users.size()} 
                      <a href="#">${msg} ${success} </a>
		             </h3>
                    </div>
                    
		             <form class="float-right" action="search" method="post">
	                  <div class="input-append">
	                    <input id="searchnow" class="span2" type="text" name="name" placeholder="Search here">
	                    <button class="btn btn-theme" type="submit">Search</button>
	                  </div>
	                 </form>
		                                
                    <table class="table table-bordered">
					 <tr class="text-success">
					 <th>#</th>
					 <th>
					 Image <i class="icon-camera"></i>
					 </th>
					 <th>User <i class="icon-user"></i></th>
					 <th>Contact <i class="icon-map-marker"></i></th>
					 <th>Products </th>
					 <c:if test="${loggedInuser.role eq 'ADMIN'}">
					 <th>Roles</th>
					 <th>Edit</th>
					 </c:if>
					 </tr>
					 <tbody>
					 <c:forEach var="item" items="${users}" >
					 <tr>
					 <td>${users.indexOf(item)+1}</td>
					 <td>
					 <c:if test="${not empty item.image}">
					 <img src="static/img/users/${item.id}/profile/${item.image}" 
						 alt="${item.fname} ${item.lname}" style="width: 50px; height: 45px; border-radius: 50%;">
					 </c:if>
					 <c:if test="${empty item.image}">
					 <p>No Image</p>
					 </c:if>
					 </td>
					 <td>${item.fname} ${item.lname}
					 <c:if test="${not empty item.comment}">
					 <a href="#" data-toggle="modal" data-target="#cmt${item.id}" 
                     class="icon-comment-alt"></a>
                     </c:if>
                     <div class="modal fade" id="cmt${item.id}">
					    <div class="modal-dialog modal-lg">
						<div class="modal-content">	      
						<!-- Modal body -->
						<div class="modal-body">			    		
			    		 <p class="text-success">
			    		 ${item.fname} ${item.lname} Says
			    		 </p>
                            ${item.comment}
	                     </div>
					    </div>	        
					    <div class="modal-footer">
					   <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
					  </div>
				      </div>
					  </div>
                     
					 </td>
					 <td>
					 <c:choose>
					 <c:when test="${not empty item.getAddress()}">
					 <a  href="#" data-toggle="modal" data-target="#adrr${item.id}" 
                     class="btn btn-success">Contact</a>
                     </c:when>
					 <c:otherwise>
					 No Contact
					 </c:otherwise>
					 </c:choose>
					 
					 <div class="modal fade" id="adrr${item.id}">
					    <div class="modal-dialog modal-lg">
						<div class="modal-content">	      
						<!-- Modal body -->
						<div class="modal-body">			    		
			    		 <h4>Contact</h4>
			    		  <div >				            
				             <i class=" icon-home text-success"> </i>
				             ${item.getAddress().street},
							 ${item.getAddress().city},
							 ${item.getAddress().state}<br>
							 <i class="icon-envelope-alt"></i> ${item.email}<br>
							 <c:forEach var="fone" items="${item.getPhoneBook()}">
				    		 <i class=" icon-phone-sign text-success"> </i>
				    		 <span> ${fone.tel} </span> 
				    	     </c:forEach>
					 
				          </div>
				          
				         
	                     </div>
					    </div>	        
					    <div class="modal-footer">
					   <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
					  </div>
				      </div>
					  </div>
					 </td>
					 <td>
					 <c:choose>
					 <c:when test="${not empty item.getProducts()}">
					 <a  href="#" data-toggle="modal" data-target="#show${item.id}" 
                     class="btn btn-info">Product</a>
                     </c:when>
					 <c:otherwise>
					 No Product
					 </c:otherwise>
					 </c:choose>
					 <div class="modal fade" id="show${item.id}">
					    <div class="modal-dialog modal-lg">
						<div class="modal-content">	      
						<!-- Modal body -->
						<div class="modal-body">
			    		<c:choose>
			    		<c:when test="${empty item.getProducts()}">
			    		No Products
			    		</c:when>
			    		<c:otherwise>
			    		 <h4>Products</h4>
			    		 <table class="table ">
					 <tr class="text-success">
					 <th>#</th>
					 <th>Product</th>
					 <th>Price</th>
					 <th>Type/Color</th>
					 </tr>
					 <tbody>
                    <c:set var="count" value="0"/>
                    <c:forEach var="pi" items="${item.getProducts()}">
				    <c:set var="count" value="${count+1}"/>
				     <tr>
				       <td> ${count}.</td>
				       <td> ${pi.name}</td>
				       <td>
				        $ ${pi.price}
				       </td>
				       <td>
				       ${pi.color} ${pi.type}
				       </td>				       		              
				     </tr>
				    </c:forEach>
				    </tbody> 
				    </table>
			    	</c:otherwise>
			    	</c:choose>
			    		
	                     </div>
					    </div>	        
					    <div class="modal-footer">
					   <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
					  </div>
				      </div>
					  </div>
                     </td>
					 <c:if test="${loggedInuser.role eq 'ADMIN'}">
					 <td>
	                 <form method="POST" action="editrole" >		    									
							<input type="hidden" name="id" value="${item.id}" />		    	 
							<select onchange="this.form.submit()" name="role" class="form-control">
							<option value="${item.role}">${item.role}</option>
							<option value="USER">USER </option>
							<option value="DBA">DBA</option>
							<option value="ADMIN">ADMIN</option>												  
						 </select>												
					   </form>
	                 </td>
                     <td>
                     <a href="delete?id=${item.id}" onclick="confirmed(); return false;" > <i class="icon-trash"></i></a>
                     </td>
					 </c:if>
					 </tr>
					 </c:forEach>
					 </tbody>
					 
					 </table>
				
                   </div>
                  
                  
                </div>
              </div>
            </article>
          </div>
        </div>
      </div>
    </section>

    <jsp:include page="footer.jsp"/>
  </div>
  <a href="#" class="scrollup"><i class="icon-angle-up icon-square icon-bglight icon-2x active"></i></a>

  <!-- javascript
    ================================================== -->
  <!-- Placed at the end of the document so the pages load faster -->
  <script src="static/js/jquery.js"></script>
  <script src="static/js/jquery.easing.1.3.js"></script>
  <script src="static/js/bootstrap.js"></script>

  <script src="static/js/modernizr.custom.js"></script>
  <script src="static/js/toucheffects.js"></script>
  <script src="static/js/google-code-prettify/prettify.js"></script>
  <script src="static/js/jquery.bxslider.min.js"></script>

  <script src="static/js/jquery.prettyPhoto.js"></script>
  <script src="static/js/portfolio/jquery.quicksand.js"></script>
  <script src="static/js/portfolio/setting.js"></script>

  <script src="static/js/jquery.flexslider.js"></script>
  <script src="static/js/animate.js"></script>
  <script src="static/js/inview.js"></script>

  <!-- Template Custom JavaScript File -->
  <script src="static/js/custom.js"></script>
  <script>
	    function confirmed(){
            if (confirm('You are about to delete, Do you want to proceed?')) {
                  document.getElementById("del").submit();
                  return true;
	            } else {
	               return false;
	            }
	         }
        	    
	    $("#searchnow").keyup(function () {
	        var value = this.value.toLowerCase().trim();

	        $("table tr").each(function (index) {
	            if (!index) return;
	            $(this).find("td").each(function () {
	                var id = $(this).text().toLowerCase().trim();
	                var not_found = (id.indexOf(value) == -1);
	                $(this).closest('tr').toggle(!not_found);
	                return not_found;
	            });
	        });
	    });
	    </script>

</body>

</html>
