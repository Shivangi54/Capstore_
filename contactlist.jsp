<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>CapStore | Customer Registration</title>

    <!-- Favicon  -->
    <link rel="icon" href="../resources/img/core-img/favicon.ico">

    <!-- Core Style CSS -->
    <link rel="stylesheet" href="../resources/css/core-style.css">
    <link rel="stylesheet" href="../resources/style.css">

</head>
<body>

<!-- Form Validation Script-->

<script type="text/javascript">
  function checkPassword(str)
  {
    var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
    return re.test(str);
  }
//   function getFormData($form)
//   {
// 	    var unindexed_array = $form.serializeArray();
// 	    var indexed_array = {};
// 	    $.map(unindexed_array, function(n, i){
// 	        indexed_array[n['name']] = n['value'];
// 	    });
// 	    return indexed_array;
//   }
  function checkForm(form)
  {
    if(form.password1.value != "" && form.password1.value == form.password2.value) {
      if(!checkPassword(form.password1.value)) {
        alert("The password you have entered is not valid!");
        form.password1.focus();
        return false;
      }
    } else {
      alert("ERROR: Please MAKE SURE your passwords MATCH!!");
      form.password1.focus();
      return false;
    }
//     var $form = $("#cust_register");
//     var formData = getFormData($form);
	//alert("Password has been changed");
     var formData = JSON.stringify($("#cust_register").serializeArray());
    $.ajax({
  	  type: "POST",
  	  url: "http://localhost:4496/registerCustomer",
  	  data: formData,
  	  success: function(){},
  	  dataType: "json",
  	  contentType : "application/json"
  	});
  }
     
</script>


    <!-- ##### Header Area Start ##### -->
    <header class="header_area">
        <div class="classy-nav-container breakpoint-off d-flex align-items-center justify-content-between">
            <!-- Classy Menu -->
            <nav class="classy-navbar" id="essenceNav">
                <!-- Logo -->
                <a class="nav-brand" href="index.html">CapStore</a>
                <!-- Navbar Toggler -->
                <div class="classy-navbar-toggler">
                    <span class="navbarToggler"><span></span><span></span><span></span></span>
                </div>
                <!-- Menu -->
               
            </nav>

            <!-- Header Meta Data -->
            <div class="header-meta d-flex clearfix justify-content-end">
                <!-- Search Area -->
                <div class="search-area">
                    <form action="searchProduct" method="post">
                        <input type="search" name="searchProduct" id="headerSearch" placeholder="Type for search">
                        <button type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
                    </form>
                </div>
                <!-- Favourite Area -->
                <div class="favourite-area">
                  <a href="#" data-toggle="modal" data-target="#registerModal">Register</a>
                </div>
                <!-- User Login Info -->
                <div class="user-login-info">
                    <a href="getLogin">Sign In</a>
                </div>
            </div>

        </div>
    </header>
    <!-- ##### Header Area End ##### -->
<div class="checkout_area section-padding-80">
	    <div class="container">
		
		
		<!-- Modal -->
			  <div class="modal fade" id="registerModal" role="dialog">
				<div class="modal-dialog modal-lg">
				
				  <!-- Modal content-->
				  <div class="modal-content">
					
					<div class="modal-body">
					  <div class="merchantBtn pull-right">
						<a href="#" class="btn essence-btn">Register as Merchant</a>
					  </div>
					  <div class="customerBtn pull-left">
						<a href="#" class="btn essence-btn">Register as Customer</a>
					  </div>
					</div>
					<div class="modal-footer">
					  <button type="button" class="btn essence-btn" data-dismiss="modal">Close</button>
					</div>
				  </div>
				  
				</div>
			  </div>
		
		
		<h3>Register</h3>
		<div><br></div>
            <div class="row">
				<div class="col-md-6">
			<form name="cust_register" id="cust_register" class="form-horizontal" onsubmit="return checkForm(this);" action="registerCustomer" method="POST">
              <div class="box-body">
			  <div class="form-group">
                  <label for="Name" class="col-sm-6 control-label"> Name</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="Name" placeholder="Enter Your Name" required>
                  </div>
                </div>
				
				<div class="form-group">
                  <label for="email" class="col-sm-6 control-label">Email</label>

                  <div class="col-sm-10">
                    <input type="email" class="form-control" name="email" placeholder="Enter Your Email" required>
                  </div>
                </div>
                <div class="form-group">
                  <label for="mobileNo" class="col-sm-6 control-label">Mobile Number</label>

                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="mobileNo" pattern="^([0|\+[0-9]{1,5})?([7-9][0-9]{9})$" placeholder="Enter Your Mobile Number" required>
                  </div>
                </div>
               

			<div class="form-group">
                  <label for="qyery" class="col-sm-6 control-label">Query</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="query" placeholder="Query" required>
                  </div>
                </div>
				</div>
              </div>
              <!-- /.box-body -->
		
                 
            
		   <div class="row">
		   <div class="col-md-3"></div>
		   <div class="col-md-6">
		    <div id="RegisterBtn" class="box-footer">
                <button type="submit" class="col-sm-10 btn essence-btn">Register</button>
              </div>
			  </form>
			  </div>
			  <div class="col-md-3"></div>
              <!-- /.box-footer -->
		   </div>
		</div>    
     </div>
    <!-- ##### Footer Area Start ##### -->
    <footer class="footer_area clearfix">
        <div class="container">
            <div class="row">
                <!-- Single Widget Area -->
                <div class="col-12 col-md-6">
                    <div class="single_widget_area d-flex mb-30">
                        <!-- Logo -->
                        <div class="footer-logo mr-50">
                            <a href="#">CapStore</a>
                        </div>
                        <!-- Footer Menu -->
                        <div class="footer_menu">
                            <ul>
                                <li><a href="shop.html">Category</a></li>
                                <li><a href="contact.html">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <!-- Single Widget Area -->
                <div class="col-12 col-md-6 text-center">
                    <p>
                       Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | CapStore</a>
                    </p>
                </div>
            </div>

           
            
           
        </div>



    </footer>
    <!-- ##### Footer Area End ##### -->

    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="../resources/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="../resources/js/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="../resources/js/bootstrap.min.js"></script>
    <!-- Plugins js -->
    <script src="../resources/js/plugins.js"></script>
    <!-- Classy Nav js -->
    <script src="../resources/js/classy-nav.min.js"></script>
    <!-- Active js -->
    <script src="../resources/js/active.js"></script>
	<!-- Form Validation -->
	
</body>

</html>