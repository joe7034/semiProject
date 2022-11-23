<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="vo.Sell_ItemVO"%>
<%@page import="dao.Sell_ItemDAO"%>
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
            <a class="navbar-brand ps-3" href="index.jsp">관리자 페이지</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                </div>
            <div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					 <li class="nav-item active"><a class="nav-link" href="../main/main.jsp">Main으로 돌아가기</a></li> 
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
                            
                            <div class="sb-sidenav-menu-heading">매출</div>
                            <a class="nav-link" href="SaleManage.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                매출관리
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                    <%
	                    LocalDate now = LocalDate.now();
	                    
	                    // 포맷 정의
	                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yy/MM/dd");
	             
	                    // 포맷 적용
	                    String formatedNow = now.format(formatter);
	                    
						Object obj = session.getAttribute("vo");     
						if(obj!=null){            
						UsersVO vo = (UsersVO)obj;
						
					%>
                        <div class="small">Logged in as:<%=vo.getId() %></div>
                <%
						}
                %>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">매출정보</h1>
                        
                        
                        
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                판매완료상품
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>상품번호</th>
                                            <th>판매날짜</th>
                                            <th>개수</th>
                                            <th>개별가격</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Name</th>
                                            <th>Position</th>
                                            <th>Office</th>
                                            <th>ffice</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <%
                                    int totalprice = 0;
                                    int dayprice = 0;
                                    Sell_ItemDAO dao = new Sell_ItemDAO();
									ArrayList<Sell_ItemVO> list = dao.selectAll();
									for (Sell_ItemVO vo : list) {
									%>
                                        <tr>
                                            <td><%=vo.getPno() %></td>
                                            <td><%=vo.getSell_date() %></td>
                                            <td><%=vo.getQty() %></td>
                                            <td><%=vo.getPrice() %></td>
                                        </tr>
                                        
                                        <%
                                        totalprice += (vo.getPrice()*vo.getQty());
                                         if(vo.getSell_date().equals(formatedNow)) {
                                        	 dayprice = (vo.getPrice()*vo.getQty());
                                         }
											}
									String str1 = String.format("$%,d", totalprice);
									String str2 = String.format("$%,d", dayprice);
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <%
	                        String month9 = "%/09/%";
	                    	int monthprice9=0;
	                        Sell_ItemDAO dao1 = new Sell_ItemDAO();
							ArrayList<Sell_ItemVO> list1 = dao1.selectMonth(month9);
							for (Sell_ItemVO vo1 : list1) {
								 monthprice9 += (vo1.getPrice()*vo1.getQty()); 
							}
								 String str3 = String.format("$%,d", monthprice9);  
                        %> 
                        <%
                       		 String month10 = "%/10/%";
                        	int monthprice10=0;
	                        Sell_ItemDAO dao2 = new Sell_ItemDAO();
							ArrayList<Sell_ItemVO> list2 = dao2.selectMonth(month10);
							for (Sell_ItemVO vo2 : list2) {
								 monthprice10 += (vo2.getPrice()*vo2.getQty()); 
							}
								 String str4 = String.format("$%,d", monthprice10); 
                        %> 
                        <%
                       		 String month11 = "%/11/%";
                        	int monthprice11=0;
	                        Sell_ItemDAO dao3 = new Sell_ItemDAO();
							ArrayList<Sell_ItemVO> list3 = dao3.selectMonth(month11);
							for (Sell_ItemVO vo3 : list3) {
								 monthprice11 += (vo3.getPrice()*vo3.getQty()); 
							}
								 String str5 = String.format("$%,d", monthprice11); 
                        %> 
					<table class="table table-sm">
					<h1>누적판매량</h1>
						<br />
						<tr>
							<td>총 누적 판매량</td>
							<td><%=str1%>원</td>
						</tr>
						<tr>
							<td>금일 판매량</td>
							<td><%=str2%>원</td>
						</tr>
					</table>
					<br />
					<br />
					<br />
					<table class="table table-sm">
					<h1>월간판매량</h1>
						<tr>
							<th>9월 판매량</th>
							<th>10월 판매량</th>
							<th>11월 판매량</th>
						</tr>
						<tr>
							<td><%=str3%>원</td>
							<td><%=str4%>원</td>
							<td><%=str5%>원</td>
						</tr>
					</table>
				</div>
				<div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-area me-1"></i>
                                월별 매출액 추이
                            </div>
                            <div class="card-body"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>
                            <div class="card-footer small text-muted">Updated yesterday at 11:59 PM</div>
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
        <script src="../assets/demo/chart-area-demo3.js"></script>
        <script src="../assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="../js/datatables-simple-demo.js"></script>
    </body>
</html>