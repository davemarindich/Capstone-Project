<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <title>Contact</title>
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
	<style>
		.preview {
		 width: 159px; height: 159px; border-radius: 50%;
		}
	
   </style>
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
                <li><a href="#">Profile</a> <i class="icon-angle-right"></i></li>
                <li class="active">${user_account.fname}</li>
              </ul>
              
            </div>
          </div>
        </div>
      </div>
    </section>

    <section id="content">
      <%-- ${user_account} --%>
      <div class="container">
        <div class="row">
          <div class="span8">
            <h4 class="title">
            <strong>Welcome ${user_account.fname} !!
            <a href="#" data-toggle="modal" data-target="#addcmt" 
                     class="icon-comment-alt"></a>
            </strong> 
            
            <a  href="#" data-toggle="modal" data-target="#add-images" class="btn btn-danger">
					<c:if test="${not empty user_account.image}">
					 Change Photo 
					 <i class="icon-camera"></i>
					 <i class="fa fa-pencil"></i>
					</c:if>
					<c:if test="${empty user_account.image}">
					 Add Photo 
					 <i class="icon-camera"></i>
					 <i class="fa fa-plus"></i>
					</c:if>
				</a>
				
				</h4>

            <h4 class="text-success">${msg} </h4>
            <div id="errormessage">${error}</div>
            
            <div class="tabs">
                  <ul class="nav nav-tabs bold">
                    <li class="active"><a href="#one" data-toggle="tab"><i class="icon-user"></i> Update Profile</a></li>
                    <li><a href="#two" data-toggle="tab"><i class="icon-briefcase"></i> My Contact Info</a></li>
                    <c:if test="${loggedInuser.role eq 'ADMIN'}">
                    <li><a href="#three" data-toggle="tab">Add Product</a></li>
                    <c:if test="${not empty user_account.getProducts()}">
                    <li><a href="#four" data-toggle="tab">My Products</a></li>
                    </c:if>
                    </c:if> 
                    <li><a href="#five" data-toggle="tab">Add Credit Card</a></li>
                    
                  </ul>
                  <div class="tab-content">
                    <div class="tab-pane active" id="one">
                    <form:form action="updatecontact" modelAttribute="address" method="post" role="form" class="contactForm">
                    <div class="span5 form-group">                    
                    <form:input type="hidden" path="id" value="${user_account.id}"/>
                    <form:input type="hidden" path="email" value="${user_account.email}"/>
				    <form:input path="phone" value="${user_account.getAddress().phone}" placeholder="Enter phone" />
				    <form:input path="street" value="${user_account.getAddress().street}" placeholder="Enter Address"/>
				   	<form:input path="city" value="${user_account.getAddress().city}" placeholder="Enter City" />				   	
				    <form:select class="select-css span5 form-control lg" path="state" id="state" required="true">
                    <c:choose>
                      <c:when test="${empty user_account.getAddress().state}">
                      <option value="">Select State</option>
                      </c:when>
                      <c:otherwise>
                      <option value="${user_account.getAddress().state}">
                      ${user_account.getAddress().state}
                      </option> 
                      </c:otherwise>
                      </c:choose>                                 
					  <c:forEach items="${states}" var="state">
					  <option value="${state}">${state.id}</option>
					  </c:forEach>
					</form:select>
					
                    <button class="btn btn-theme btn-medium margintop10" type="submit">Update</button>
                  </div>
              
                 </form:form>
                    </div>
                    <div class="tab-pane" id="two">
                     <h5 class="widgetheading">
                     ${user_account.fname} ${user_account.lname}
                     <c:if test="${not empty user_account.image}">
					 <img src="static/img/users/${user_account.id}/profile/${user_account.image}" 
						 alt="Profile Image" style="width: 50px; height: 45px; border-radius: 50%;">
					 </c:if>	
                     </h5>
					 <div class="span4">	
		                <ul class="contact-info">
		                  <li><label>Address :</label> ${user_account.getAddress().street} 
		                  <br> ${user_account.getAddress().city}
		                  ${user_account.getAddress().state}<br /> </li>
		                  <li><label>Phones :</label> 
		                   <c:forEach var="fone" items="${user_account.getPhoneBook()}">
				    		<i class=" icon-phone-sign text-success"> </i>
				    		<span> ${fone.tel} </span> 
				    	   </c:forEach>
		                   </li>
		                  <li><label>Email : </label>${user_account.email}</li>
		                  <li><label>Comment : </label>${user_account.comment}</li>
		                </ul>
		                
		             </div>
		             
		            
		               
		             </div>
                    
                    <c:if test="${loggedInuser.role eq 'ADMIN'}">
                    <div class="tab-pane" id="three">
                    <form:form action="saveproduct" modelAttribute="product" 
                    method="post" role="form" enctype="multipart/form-data" class="contactForm">              
                    <div class="span5 form-group">
                    <form:input type="hidden" path="id" />                    
                    <form:input type="hidden" path="users_id" value="${user_account.id}"/>
                    <form:input path="name" placeholder="product name"/>
                    <form:input path="type" placeholder="product type"/>
                    <form:input path="price" placeholder="product price" />
                    <form:input path="color" placeholder="product color"/>
                    <form:input path="file" type="file"  />					                             
					<form:input path="file" type="file"  />
					<form:input path="file" type="file"  /> 
                    <form:input type="hidden" path="email" value="${loggedInuser.email}" />
                    <button class="btn btn-theme" type="submit">Add </button>
		            </div>
                    </form:form>
                    
                    </div>
                    </c:if>
                    <div class="tab-pane" id="four">
                    <c:if test="${not empty user_account.getProducts()}">
                    <table class="table ">
					 <tr class="text-success">
					 <th>#</th>
					 <th>Product</th>
					 <th>Price</th>
					 <th>Type/Color</th>
					 <th>Action</th>
					 </tr>
					 <tbody>
                    <c:set var="count" value="0"/>
                    <c:forEach var="pi" items="${user_account.getProducts()}">
				    <c:set var="count" value="${count+1}"/>
				     <tr>
				       <td> ${count}.</td>
				       <td> $
				       <img src="static/img/products/${pi.id}/${pi.img}" 
						 alt="Profile Image" style="width: 50px; height: 45px; border-radius: 50%;">
						 {pi.name}</td>
				       <td>
				        $ ${pi.price}
				       </td>
				       <td>
				       ${pi.color} ${pi.type}
				       </td>
				       <td>
				       <a href="deleteproduct?id=${pi.id}" onclick="confirmed(); return false;" > <i class="icon-trash"></i></a>
                      </td>			              
				     </tr>
				    </c:forEach>
				    </tbody> 
				    </table>
				    </c:if>
                    </div>
                    <div class="tab-pane" id="five">
                    <p class="text-right">
                    <a href="#" data-toggle="modal" data-target="#addnew" 
					 class="btn btn-success">Add New Card</a>
                    </p>
                    <c:if test="${not empty user_account.getPaymentMethod()}">
                    <table class="table ">
					 <tr class="text-success">
					 <th>#</th>
					 <th>Card Number</th>
					 <th>Expiry</th>
					 <th>Type</th>
					 </tr>
					 <tbody>
                    <c:set var="count" value="0"/>
                    <c:forEach var="cards" items="${user_account.getPaymentMethod()}">
				    <c:set var="count" value="${count+1}"/>
				     <tr>
				       <td> ${count}.</td>
				       <td> ${cards.cardno}</td>
				       <td>
				        ${cards.expiry}
				        </td>
				       <td> Visa
				       <a href="deletecard?id=${cards.id}" onclick="confirmed(); return false;" > <i class="icon-trash"></i></a>
                     
				       </td>			              
				     </tr>
				    </c:forEach>
				    </tbody> 
				    </table>
				    </c:if>
                    </div>
                  </div>
                </div>
            
          </div>
          <div class="span4">
            <div class="clearfix"></div>
            <aside class="right-sidebar">
			
			<div class="span3">
			<div class="text-center">
			<c:if test="${not empty user_account.image}">
			 <img src="static/img/users/${user_account.id}/profile/${user_account.image}" 
			 alt="Profile Image" style="width: 159px; height: 159px; border-radius: 50%;">
		    </c:if>	
								                      
			 <span class="text-danger text-center">${error}</span>  
				
		   </div>
		    </div>  
		   
              <div class="widget text-center">
                <h5 class="widgetheading">${user_account.fname} ${user_account.lname}<span></span></h5>

                <ul class="contact-info">
                  <li>${user_account.getAddress().street} 
                  <br>${user_account.getAddress().city} ${user_account.getAddress().state}<br /> 
                  ${user_account.email}
                  </li>
                </ul>
                 <a href="#" data-toggle="modal" data-target="#addtel" 
					 class="btn btn-success">Add Phone</a>
                
                <c:if test="${not empty user_account.getPhoneBook()}">
                <label>My Phones 
                  
			    </label>
                    <table class="table ">
					 <tr class="text-success">
					 <th>#</th>
					 <th>Type</th>
					 <th>Phone</th>
					 <th>Action</th>
					 </tr>
					 <tbody>
                    <c:set var="count" value="0"/>
                    <c:forEach var="fone" items="${user_account.getPhoneBook()}">
				    <c:set var="count" value="${count+1}"/>
				     <tr>
				       <td> ${count}.</td>
				       <td> ${fone.type}</td>
				       <td>
				           ${fone.tel}
				       </td>				       
				       <td>
				       <a href="deletephone?id=${fone.id}" onclick="confirmed(); return false;" > <i class="icon-trash"></i></a>
                      </td>			              
				     </tr>
				    </c:forEach>
				    </tbody> 
				    </table>
				    </c:if>

              </div>
            </aside>
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

  <!-- Contact Form JavaScript File -->
  <script src="contactform/contactform.js"></script>

  <!-- Template Custom JavaScript File -->
  <script src="static/js/custom.js"></script>
  <script type="text/javascript">
     function preview_image(event) 
     {
      var reader = new FileReader();
      reader.onload = function()
      {
       var output = document.getElementById('output_image');
       output.classList.add("preview");
       output.src = reader.result;
      }
      reader.readAsDataURL(event.target.files[0]);
     }

     function confirmed(){
         if (confirm('You are about to delete, Do you want to proceed?')) {
               document.getElementById("del").submit();
               return true;
	            } else {
	               return false;
	            }
	         }
     </script>
     
        <div class="modal fade" id="add-images">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">	      
			<!-- Modal Header -->
			<div class="modal-header">
			<h4 class="modal-title">Upload Picture</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>	        
			<!-- Modal body -->
			<div class="modal-body">
		    
			  <form method="POST" action="addimages" enctype="multipart/form-data">                  
			     <img id="output_image" />
			     <div class="control-group">
                    <div class="controls">
                     <input type="file" name="file" onchange="preview_image(event)">					                             
					 <input type="hidden" name="id" value="${user_account.id}">					
                    </div>
                  </div>                  
                  <div class="control-group">
                    <div class="controls">
                      <button type="submit" >Upload</button>
                    </div>                    
                  </div>        
			         </form>
                     </div>
					</div>	        
				   <div class="modal-footer">
					<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
					</div>
				    </div>
					</div> 
					
					<div class="modal fade" id="addnew">
					    <div class="modal-dialog modal-sm">
						<div class="modal-content">	      
						<!-- Modal body -->
						<div class="modal-body">			    		
			    		 <h4>Add new Card</h4>
			    		  <form:form action="addcard" modelAttribute="card" 
		                    method="post" role="form" class="contactForm"> 
		                    <form:input type="hidden" path="id" value="${user_account.id}"/>
		                    <form:input type="number" path="cardno" placeholder="Card Number" min="14" /><br>
		                    <form:input type="number" path="secode" placeholder="Card Security" min="3" /><br>
		                    <form:input type="month" path="expiry" placeholder="Expiry Date"/><br>
		                    <button class="btn btn-danger" type="submit">Add </button>
				            <button type="button" class="btn btn-info" data-dismiss="modal">Cancel</button>
					  
		                   </form:form>
				         
	                     </div>
					    </div>	        
					    <div class="modal-footer">
					   <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
					  </div>
				      </div>
					  </div>
					  
					  <div class="modal fade" id="addcmt">
					    <div class="modal-dialog modal-lg">
						<div class="modal-content">	      
						<!-- Modal body -->
						<div class="modal-body">
									    		
				    	<form action="addcoment" method="post" role="form" class="contactForm">
			              	<h4>Add Comment</h4>	                
			                  <input type="hidden" name="id" value="${user_account.id}">
			                  <textarea name="comment" rows="5" data-rule="required" placeholder="${user_account.comment}" ></textarea>
			                  <div class="text-left">
			                    <button class="btn btn-theme btn-medium margintop10" type="submit">Add </button>
			                  </div>
			                
			            </form>
	                     </div>
					    </div>	        
					    <div class="modal-footer">
					   <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
					  </div>
				      </div>
					  </div>
					  
					  <div class="modal fade" id="addtel">
					    <div class="modal-dialog modal-lg">
						<div class="modal-content">	      
						<!-- Modal body -->
						<div class="modal-body">
									    		
				    	<form action="addphone" method="post" role="form" class="contactForm">
			              	<h4>Add Telephone Number</h4>	                
			                  <input type="hidden" name="id" value="${user_account.id}">
			                  <input type="text" name="tel" class="form-group" placeholder="Phone Number">
			                  <select name="type" class="form-control">
								<option value="Select">Select Type</option>
								<option value="Mobile">Mobile </option>
								<option value="Home">Home</option>
								<option value="Work">Work</option>												  
							 </select>
			                  <div class="text-left">
			                    <button class="btn btn-danger" type="submit">Add </button>
			                  </div>
			                
			            </form>
	                     </div>
					    </div>	        
					    <div class="modal-footer">
					   <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
					  </div>
				      </div>
					  </div>

</body>

</html>
