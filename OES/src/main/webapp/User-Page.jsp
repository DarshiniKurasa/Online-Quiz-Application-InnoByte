<%@page import="com.helper.*"%>
<%@page import="com.entity.*"%>
<%@page import="jakarta.servlet.http.Part"%>

<%@page import="java.util.List"%>
<%
DatabaseClass DAO = new DatabaseClass();
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>OES</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/nav.css">
    <script src="https://kit.fontawesome.com/908f7da306.js" crossorigin="anonymous"></script>
    <link rel="stylesheet"
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
    <link rel="stylesheet" href="css/form.css">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="img/logo2.png">
</head>

<body>
 <!-- ---------------------nav bar-------------------------- -->
    <nav class="main-nav flex-div">
        <div class="main-nav-left flex-div">
            <i class="fa fa-bars" aria-hidden="true" id="menu-icon"></i>
            <a href="" class="nav-logo">Online Examination System</a>
        </div>
        <div class="main-nav-right flex-div" id="showprofilemenu">
            <%if(session.getAttribute("UserStatus")!=null){
            	if(session.getAttribute("UserStatus").equals("1")){ 
            		String id = (String) session.getAttribute("UserId");
                	User user=DAO.getUserDetails(id);
             %>
               <p class="user-name" ><%=user.getUsername() %></p><span class="material-symbols-outlined">
                arrow_drop_down
                </span>
                <span class="material-symbols-outlined ">
                    account_circle
                </span>
                 <%--  <%
            	}else{
            		response.sendRedirect("User-Login.jsp"); 
            	}
            }else{
            	response.sendRedirect("User-Login.jsp"); 
            }
            %> --%>
        </div>
        <!-- -----------------------profile---------------------- -->
        <div class="settings-menu" >
            <div class="setting-inner">
                <div class="setting-inner-1">
                    <span class="material-symbols-outlined ">
                        account_circle
                        </span>
                </div>
                <%--  <%if(session.getAttribute("UserStatus")!=null){
            			if(session.getAttribute("UserStatus").equals("1")){ 
            				String id = (String) session.getAttribute("UserId");
                			User user=DAO.getUserDetails(id);
             	%> --%>
                <div class="setting-profile flex-div">
                    <p>Username:</p>
                    <p><%=user.getUsername() %></p>
                </div>
                <hr>
                <div class="setting-profile flex-div">
                    <p>Email-Id:</p>
                    <p><%=user.getEmail() %></p>
                </div>
                <hr>
                <div class="setting-profile flex-div">
                    <p>Phone No.:</p>
                    <p><%=user.getPhone_no() %></p>
                </div>
	                <%--  <%
	            	}else{
	            		response.sendRedirect("User-Login.jsp"); 
	            	}
	            }else{
	            	response.sendRedirect("User-Login.jsp"); 
	            } --%>
	            
	            
                <hr>
                <div class="setting-profile-1 flex-div">
                    <button class="user-Edit-btn" onclick="openForm()" >Edit</button>
                    <a href="Controller.jsp?page=logout1"><button class="user-Edit-btn">Logout</button></a>
                    <button class="user-Edit-btn" id="showprofilemenu1" href="">Close</button>
                </div>
            </div>
        </div>
    </nav>

    <!-- ------------------------sidebar-------------------------------- -->
    <div class="main-sidebar">
        <div class="main-sidebar-links">
            <a href="User-Page.jsp?pg=1" class="sidebar-links sidebar-links-1"><i class="fa fa-home" aria-hidden="true"></i>
                <p>Dashboard</p>
            </a>
            <a href="User-Page.jsp?pg=2" class="sidebar-links active"><i class="fa fa-user-o" aria-hidden="true"></i>
                <p>Student</p>
            </a>
            <a href="User-Page.jsp?pg=3" class="sidebar-links"><i class="fa fa-graduation-cap" aria-hidden="true"></i>
                <p>Exam</p>
            </a>
            <a href="User-Page.jsp?pg=4" class="sidebar-links"><i class="fa fa-question-circle" aria-hidden="true"></i>
                <p>Question</p>
            </a>
            <a href="User-Page.jsp?pg=5" class="sidebar-links"><i class="fa fa-sticky-note-o" aria-hidden="true"></i>
                <p>Enroll</p>
            </a>
            <a href="User-Page.jsp?pg=6" class="sidebar-links"><i class="fa fa-list-alt" aria-hidden="true"></i>
                <p>Result</p>
            </a>
            <a href="User-Page.jsp?pg=7" class="sidebar-links"><i class="fa fa-list" aria-hidden="true"></i>
                <p>Notice</p>
            </a>
            <a href="" class="sidebar-links"><i class="fa fa-info-circle" aria-hidden="true"></i>
                <p>Help</p>
            </a>
        </div>
    </div>
    <!-- --------------------------main body ---------------------------------------------->
    <%
    /* if(session.getAttribute("UserStatus")!=null){
		if(session.getAttribute("UserStatus").equals("1")){  */
			if(request.getParameter("pg").equals("1")) { 
    %>
    			<jsp:include page="User-Dashboard.jsp" />
    <%
			}else if(request.getParameter("pg").equals("2")) { 
    %>
    			<jsp:include page="Manage-Student.jsp" />
    <%
			}else if(request.getParameter("pg").equals("3")) { 
    %>
    			<jsp:include page="Manage-Exam.jsp" />
    <%
			}else if(request.getParameter("pg").equals("4")) { 
    %>
    			<jsp:include page="Manage-Question.jsp" />
    <%
			}else if(request.getParameter("pg").equals("5")) { 
    %>
    			<jsp:include page="enroll.jsp" />
    <%	
    		}else if(request.getParameter("pg").equals("6")) { 
    %>
				<jsp:include page="Result-Page.jsp" />
	<%			
    		}else if(request.getParameter("pg").equals("7")) { 
   	%>
    			<jsp:include page="Instruction-Page.jsp" />
    <%
			}else{    
    %>
    			<jsp:include page="User-Dashboard.jsp" />
    <%		}
    	}else 
    		response.sendRedirect("User-Login.jsp?msg=1"); 
   	}else 
   		response.sendRedirect("User-Login.jsp?msg=1"); 
    
    %>
   
   
   <!--  <div class="main-body">
        <div class="main-containt">
            <div class="small-containers">
                <div class="dash-board container-padding">
                    <div class="flex-div-center">
                        <span class="material-symbols-outlined">dashboard</span>
                        <span>Dashboard</span>
                    </div>
                    <a href="">Today is
                        <span id="day">day</span>,
                        <span id="daynum">00</span>
                        <span id="month">month</span>
                        <span id="year">0000</span>
                        <span class="display-time"></span>
                    </a>
                </div>
                <hr>
            </div> -->
<!--    ============= ==============================Profile Edit============================ -->
       <%--     <jsp:include page="EditUserProfile.jsp" /> --%>
           
            <%-- <div class="UserProfile " id="EditProfile" >
                <div>
                    <span class="stud-head-style flex-div-center">Edit Profile</span>
                </div>
                <div class="UserProfile1">
                
                    <form action="Controller.jsp" method="post" class="signup">
                     <input type="hidden" name="page" value="EditUserDetail">
                        <hr>
                        <%if(session.getAttribute("UserStatus")!=null){
            				if(session.getAttribute("UserStatus").equals("1")){ 
            					String id = (String) session.getAttribute("UserId");
                				User user=DAO.getUserDetails(id);
             			%>
             			<input type="hidden" name="id" value="<%=user.getId()%>">
                        <div class="row flex-div-center">
                            <div class="col-25">
                                <label for="fname">Username</label>
                            </div>
                            <div class="col-75 ">
                                <input type="text" value="<%=user.getUsername() %>"  id="fname" name="username" placeholder="Username..">
                            </div>
                        </div>
                        <div class="row flex-div-center">
                            <div class="col-25">
                                <label for="lname">Email-Id</label>
                            </div>
                            <div class="col-75">
                                <input type="email" value="<%=user.getEmail() %>" readonly id="lname" name="email" placeholder="Email-Id..">
                            </div>
                        </div>
                        <div class="row flex-div-center">
                            <div class="col-25">
                                <label for="lname">Password</label>
                            </div>
                            <div class="col-75">
                                <input type="password" value="<%=user.getPassword() %>" id="lname" name="password" placeholder="Password..">
                            </div>
                        </div>
                        <div class="row flex-div-center">
                            <div class="col-25">
                                <label for="lname">Phone Number</label>
                            </div>
                            <div class="col-75">
                                <input type="text" value="<%=user.getPhone_no() %>" id="lname" name="phone_no" placeholder="Phone No..">
                            </div>
                        </div>
                          <%
	            			}
	            		}%>
                          <hr>        
                        <div class="row flex-div-center">
                            <input type="submit" value="Update">
                            <input type="button" value="Close" onclick="closeForm()">
                        </div>
                    </form>
                   
                </div>
            </div> --%>
<!-- ================================content=============================================== -->
           <!--  <div class="small-container ">
                <div class="dashboard  flex-div">
                    <div class="card ">
                        <div class="flex-div">
                            <div class="card-1">
                                <span class="material-symbols-outlined">
                                    person
                                </span><br>
                                <span>
                                    Student List
                                </span>
                            </div>
                            <div class="card-2">
                                <span>Total Students</span><br><br>
                                <span>10</span>
                            </div>
                        </div>
                        <div class="card-3 flex-div">
                            
                            <span>
                                add
                            </span>
                            <span class="material-symbols-outlined">
                                add
                            </span>
                        </div>
                    </div>
                    <div class="card ">
                        <div class="flex-div">
                            <div class="card-1">
                                <span class="material-symbols-outlined">
                                    receipt_long
                                </span><br>
                                <span>&nbsp;
                                    Exam List
                                </span>
                            </div>
                            <div class="card-2">
                                <span>Total Exams</span><br><br>
                                <span>3</span>
                            </div>
                        </div>
                        <div class="card-3 flex-div">
                            
                            <span>
                                add
                            </span>
                            <span class="material-symbols-outlined">
                                add
                            </span>
                        </div>
                    </div>
                    <div class="card">
                        <div class="flex-div">
                            <div class="card-1">
                                <span class="material-symbols-outlined">
                                    quiz
                                </span><br>
                                <span>
                                    Question List
                                </span>
                            </div>
                            <div class="card-2 ">
                                <span>Total Questions</span><br><br>
                                <span>89</span>
                            </div>
                        </div>
                        <div class="card-3 flex-div">
                            
                            <span>
                                add
                            </span>
                            <span class="material-symbols-outlined">
                                add
                            </span>
                        </div>
                    </div>
                    <div class="card">
                        <div class="flex-div">
                            <div class="card-1">
                                <span class="material-symbols-outlined">
                                    list_alt
                                </span><br>
                                <span>&nbsp;
                                    Result List
                                </span>
                            </div>
                            <div class="card-2">
                                <span>Total Results</span><br><br>
                                <span>57</span>
                            </div>
                        </div>
                        <div class="card-3 flex-div">
                            
                            <span>
                                add
                            </span>
                            <span class="material-symbols-outlined">
                                add
                            </span>
                        </div>
                    </div>
                    <div class="card">
                        <div class="flex-div">
                            <div class="card-1">
                                <span class="material-symbols-outlined">
                                    notification_important
                                </span>
                                <br>
                                <span>
                                    Instructions
                                </span>
                            </div>
                            <div class="card-2">
                                <span>Exam Instructions</span><br><br>
                                <span>3</span>
                            </div>
                        </div>
                        <div class="card-3 flex-div">
                            
                            <span>
                                add
                            </span>
                            <span class="material-symbols-outlined">
                                add
                            </span>
                        </div>
                    </div>
                    <div class="card">
                        <div class="flex-div">
                            <div class="card-1">
                                <span class="material-symbols-outlined">
                                    notification_important
                                </span>
                                <br>
                                <span>&nbsp;&nbsp;&nbsp;&nbsp;
                                    Notice
                                </span>
                            </div>
                            <div class="card-2">
                                <span>Notices</span><br><br>
                                <span>1</span>
                            </div>
                        </div>
                        <div class="card-3 flex-div">
                            
                            <span>
                                add
                            </span>
                            <span class="material-symbols-outlined">
                                add
                            </span>
                        </div>
                    </div>
                </div>
            </div> 
        </div>
    </div>  -->
     <script>
        var app = angular.module('myApp', []);
        app.controller('myCtrl', function ($scope) {
            $scope.name = "";
        });
    </script>
    <script src="js/script.js"></script>
</body>
</html>