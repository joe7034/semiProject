<%@page import="java.util.ArrayList"%>
<%@page import="vo.ProductsVO"%>
<%@page import="dao.ProductsDAO"%>
<%@page import="vo.UsersVO"%>
<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>관리자페이지</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="../css/admin_styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
    				
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="">회원관리</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                </div>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item active"><a class="nav-link"
						href="../main/main.jsp">Main으로 돌아가기</a></li>
				</ul>
			</div>
		</form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        
                        <li><a class="dropdown-item" href="../main/Logout.jsp">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">통합</div>
                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                종합정보
                            </a>
                            <div class="sb-sidenav-menu-heading">제품,회원관리</div>
                            <a class="nav-link" href="ItemService.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                상품등록
                            </a>
                            
                            <a class="nav-link" href="StockManage.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                재고관리
                            </a>
                            
                            <a class="nav-link" href="MemManage.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                회원관리
                            </a>
                            
                            <div class="sb-sidenav-menu-heading">제품상세</div>
                            <a class="nav-link" href="charts.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="tables.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                    <%
						Object obj = session.getAttribute("vo");     
						if(obj!=null){            
						UsersVO vo = (UsersVO)obj;
						
					%>
                        <div class="small">Logged in as:<%=vo.getId() %></div>
                        Start Bootstrap
                <%
						}
                %>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                	<div class="container">
		
				<table class="table table-striped">
					<tr>
						<th>아이디</th>
						<th>이름</th>
						<th>이메일</th>
						<th>핸드폰번호</th>
						<th>성별</th>
						<th>선호음식</th>
						<th>탈퇴여부</th>
						<th>회원가입날짜</th>
						<th>주문횟수</th>
						<th>포인트</th>
						<th>권한등급(2-관리자)</th>
						<th>개별수정</th>
					</tr>
					<%
					UsersDAO dao =new UsersDAO();
					ArrayList<UsersVO> list = dao.selectAll();
					for(UsersVO vo:list){
					
					%>
					
					<tr>
						<form action="MemManageOK.jsp" method="get">
							<td><%=vo.getId() %></td>
							<td><%=vo.getName() %></td>
							<td><%=vo.getEmail() %></td>
							<td><%=vo.getPhone() %></td>
							<td><%=vo.getGender() %></td>
							<td><%=vo.getPfood() %></td>
							<td><%=vo.getUseyn() %></td>
							<td><%=vo.getRgdate() %></td>
							<td><%=vo.getBuy() %></td>
							<td><%=vo.getPoint() %></td>
							<td>현재권한=<%=vo.getGrade() %>
							<input type="hidden" value="<%=vo.getId() %>" name="id"/>
							<select name="grade">
							    <option value="1">1</option>
							    <option value="2">2</option>
							</select>
							</td>
							<%-- <td><select name="role">
		                            <option value="grade0"><%= vo.getGrade() %></option>
		                            <option value="grade1"><% if(vo.getGrade()==1){
		                            		
		                            %>0</option>
		                            <%
		                            }else{%>
		                            	<option value="grade1">1</option>
		                            <% 	
		                            }
		                            %>
		                            
		                        </select></td> --%>
		                     <td>
		                         <div class="d-grid gap-2">
			                         <button class="btn btn-primary" type="submit" onclick="upd();" id="btn1">
			                             update
			                         </button>
								</div>
		                     </td>
				        </form>
					</tr>
					<%
						}
					%>
				</table>
	</div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="../js/admin_scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="../assets/demo/chart-area-demo2.js"></script>
        <script src="../assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="../js/datatables-simple-demo.js"></script>
    </body>
</html>