
<%@page import="vo.UsersVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UsersDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>my page</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="../css/main.css" />
        <script type="text/javascript">
        /* window.onload = function() {
    		var btn1 = document.getElementById("withdraw");
    		btn1.onclick = function() {

    			var frm = document.frm; //이동하는코드

    			frm.action = "LoginOK.jsp";
    			frm.method = "get";
    			frm.submit();
    		} */
        </script>
    </head>
    <body>
    	<div id="container">
			<jsp:include page="header.jsp"></jsp:include>
		
		</div>
        <div class="d-flex" id="wrapper">
            <!-- Sidebar-->
            <div class="border-end bg-white" id="sidebar-wrapper">
                <div class="sidebar-heading border-bottom bg-light">마이페이지</div>
                <div class="list-group list-group-flush">
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="Mypage_Point.jsp">포인트</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">정보수정</a>
                    <a class="list-group-item list-group-item-action list-group-item-light p-3" href="#!">회원탈퇴</a>
                </div>
            </div>
            <!-- Page content wrapper-->
            <div id="page-content-wrapper">
                <!-- Top navigation-->
                <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom">
                    <div class="container-fluid">
                        <button class="btn btn-primary" id="sidebarToggle">Toggle Menu</button>
                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ms-auto mt-2 mt-lg-0">
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                                    <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#!">Action</a>
                                        <a class="dropdown-item" href="#!">Another action</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item" href="#!">Something else here</a>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </nav>
                <!-- Page content-->
                <div class="container-fluid">
                	<%
						Object obj = session.getAttribute("vo");     
						if(obj!=null){            
							UsersVO vo = (UsersVO)obj;
						
					%>
						
                    <p style="text-align: center; font-weight: bold;" >
                        가입된 회원정보가 모두 삭제됩니다. 작성하신 게시물은 삭제되지 않습니다. <br>
                        탈퇴 후 같은 계정으로 재가입 시 기존에 가지고 있던 적립금은 복원되지 않으며. 사용 및 다운로드 했던 쿠폰도 사용 불가능 합니다.<br>
                        회원 탈퇴를 진행하시려면 id와 회원탈퇴를 입력해주세요.
                    </p>
                    <form action="withdraw.jsp" method="get">
	                   <!--  <div class="form-floating mb-3">
						  <input type="text" class="form-control" id="floatingInput" placeholder="name@example.com">
						  <label for="floatingInput">ID</label>
						</div>
						<input type="text" class="form-control" id="floatingInput" placeholder="회원탈퇴"><br /> -->
						<!-- <input type="text" class="form-control" name="id" placeholder="id">
						<input type="text" class="form-control" name="withd" placeholder="회원탈퇴"><br /> -->
	                    <div style="text-align: center;">
	                    <button type="button" class="btn btn-light">취소</button>
						<button type="submit" class="btn btn-dark" id="withdraw">탈퇴</button>
						</div>
					</form>
                    <%
						}
                    %>
                </div>
            </div>
        </div>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="../js/scripts.js"></script>
        <jsp:include page="footer.jsp"></jsp:include>
    </body>
</html>