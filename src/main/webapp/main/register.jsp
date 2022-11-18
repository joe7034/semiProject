<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>3jo.register.jsp</title>
<link rel="stylesheet" href="../css/register.css" />
<link rel="stylesheet" type="text/css" href = "../css/main.css" > 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
/* <회원가입 (닉네임, 생년월일 제외)> 
+회원테이블 만들때는 컬럼 no추가해서 시퀀스랑 연결짓기 + 드래곤페이 포인트 컬럼도 이 테이블에 추가할지도?
1-6까지는 필수로 선택하게 하기(not null) 
1. 아이디(8-15) + 중복확인버튼 primary key
2. 비밀번호 (type=password) + ( 6-15 영문, 숫자, 특수문자 1개이상씩 필수 )
   비밀번호확인 (type=password)
3. 이름(1자이상- 한글가능 )
4. 전화번호 
5. 이메일 select문 써서 daum.net, naver.com 이런거 고를수있도록,
6. 성별 (radio) 
7. 선호하는음식(radio)-> 1개 꼭 체크하도록
--------------------------------------------------------------- */
var check = 0;	
var idPattern = /^[A-Za-z0-9]+$/; // 영문 또는 숫자
	$(function(){		
		$("#btnck").on("click", duplicateCk); // 아이디중복체크
		$("#btnfinck").on("click", finalCk); // 유효성검사
		$("select").on("change", selectEmail); // 이메일도메인
	});
	function duplicateCk(){ 
		var txt = $("#userid").val().trim();
		if( txt == ''){
			alert("아이디를 입력하십시오"); 
			$("#userid").focus();
			return false;
		}else if( txt.length < 8 || txt.length > 16 || !idPattern.test(txt) ){
			alert("아이디를 형식에 맞게 입력하십시오"); 
			$("#userid").focus();
			return false;
		}else {
			$.ajax({
				url : "idCheck.jsp",
				dataType : "html",
				data : {"userid" : txt},
				success : function(response){ 
					var msg = response.trim(); 
					if ( msg == "true" ){
						check = 1; 
						$("#idError").html("아이디가 존재합니다").css('color','red'); 				
					} else {
						check = 2; 
						$("#idError").html("아이디가 사용가능합니다").css('color','green'); 
					}
				},
				error : function(){
					alert("서버요청실패");
				}
			})			
		}		
	}
	function selectEmail(){
		//console.log("클릭"); 
		$("#selectEmail option:selected").each(function () {			
			if($(this).val()== '1'){ 
				$("#email2").val('');
				$("#email2").attr("disabled",false);
			}else{
				$("#email2").val($(this).text());
				$("#email2").attr("disabled",true);
			}
		});
	}
	function finalCk(){
		//console.log("버튼눌림"); 
		var id = $("#userid").val();
		var pwd = $("#userpw").val();
		var repwd = $("#userrepw").val();
		var name = $("#username").val();
		var email1 = $("#email1").val(); 
		var email2 = $("#email2").val();
		var phone1 =$("#phone1").val(); 
		var phone2 =$("#phone2").val(); 
		var phone3 =$("#phone3").val(); 
		var gender = document.querySelector('input[type=radio][name=gender]:checked');
		var pfood = document.querySelector('input[type=radio][name=pfood]:checked');
		
		var pwdPattern = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,15}$/;//6~15자 영문,숫자,특수문자 1개 이상 필수
		
		// 유효성검사 시작
		if ( id ==''){
			alert("아이디를 입력하십시오"); 
			$("#userid").focus();
			return false;
		}else if ( id.length < 8 || id.length > 16 || !idPattern.test(id) ){
			alert("아이디를 형식에 맞게 입력하십시오");
			$("#userid").focus();
			return false;
		}else if ( check == 0){
			//console.log(check);
			alert("아이디 중복을 확인하십시오");
			return false;
		}else if ( check == 1 ){
			console.log(check);
			alert("중복된 아이디입니다 사용가능한 아이디로 바꿔주십시오");
			return false;
		}else if ( pwd =='' ){
			alert("비밀번호를 입력하십시오");
			$("#userpw").focus();
			return false;
		}else if(!pwdPattern.test(pwd)){
			alert("비밀번호를 형식에 맞게 입력하십시오");
			$("#userpw").focus();
			return false;
		}else if ( repwd=='' ){
			alert("확인비밀번호를 입력하십시오"); 
			return false; 
		}else if ( pwd != repwd ){
			console.log(pwd);
			console.log(repwd);
			alert("비밀번호가 일치하지 않습니다"); 
			$("#userrepw").focus();
			return false; 
		}else if ( name == '') {
			alert("이름을 입력하십시오");
			$("#username").focus(); 
			return false; 
		}else if ( email1 == '' || email2 =='') {
			alert("이메일을 입력하십시오");
			return false; 
		}else if ( phone1 == '' || phone2 =='' || phone3 == '') {
			alert("전화번호를 입력하십시오");
			return false; 
		}else if ( gender == null) {
			alert("성별을 선택하십시오"); 
			return false; 
		}else if ( pfood == null) {
			alert("선호식품을 선택하십시오");
			return false; 
		}		
		document.frm.submit(); 
	}
</script>
</head>
<body>
	<div id="header">
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div class="wrapper" id="div1">
		<div class="registerTitle"><h1 style="font-size: 30px;">회원가입</h1></div>
		<form action="registerOk.jsp" name="frm"  method="post">
		<div id="registerInfo">
			<div id="div2" class="pad">
	            <label>아이디*</label>
				<input type="text" name="userid" id="userid" placeholder="8~15자 영문 또는 숫자만 사용 가능"/>
				<input type="button" id="btnck" class="btn" value="중복확인" />
				<div id="idError" class="error"></div>
			</div>
			<div id="div3" class="pad">
				<label>비밀번호*</label>
				<input type="password" class="sameInput" name="userpw" id="userpw" placeholder="6~15자 영문,숫자,특수문자 1개 이상 필수"/>
			</div>
			<div id="div4" class="pad">
				<label>비밀번호 확인*</label>
				<input type="password" class="sameInput" name="userrepw" id="userrepw" placeholder="비밀번호 확인"/>
			</div>
			<div id="div5" class="pad">
				<label>이름*</label>
				<input type="text" class="sameInput" name="username" id="username" placeholder="이름"/>
			</div>
			<div id="div6" class="pad">
				<label>이메일*</label>
				<input type="text" name="email1" id="email1" placeholder="이메일" /> @
				<input type="text" name="email2" id="email2" placeholder="이메일도메인" />
				<select name="selectEmail" id="selectEmail">
					<option value="1" selected>직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="daum.net">daum.net</option>
					<option value="gmail.com">gmail.com</option>
					<option value="nate.com">nate.com</option>
					<option value="yahoo.co.kr">yahoo.co.kr</option>
					<option value="korea.com">korea.com</option>
					<option value="hotmail.com">hotmail.com</option>
				</select>
			</div>
			<div id="div7" class="pad">
				<label>전화번호*</label>
				<input type="text" name="phone1" id="phone1" placeholder="앞자리"/> 
				<input type="text" name="phone2" id="phone2" placeholder="가운데자리"/> 
				<input type="text" name="phone3" id="phone3" placeholder="뒷자리"/>						
			</div>
			<div id="div8" class="pad">
				<label for="gender">성별*</label>
				<input type="radio" name="gender" id="male" value="male" />남&nbsp;
	            <input type="radio" name="gender" id="female" value="female" />여&nbsp;
			</div>
			<div id="div9" class="pad">
				<label for="pfood" style="float:left">선호식품*</label>
				<div id="bestCk" style="float:left">
				<input type="radio" name="pfood" id="pfood1" value="salad" />샐러드&nbsp;
				<input type="radio" name="pfood" id="pfood2" value="chicken" />닭가슴살&nbsp;
				<input type="radio" name="pfood" id="pfood3" value="dosirak" />다이어트도시락<br />
				<input type="radio" name="pfood" id="pfood4" value="gonyak" />곤약식품 
				<input type="radio" name="pfood" id="pfood5" value="shake" />단백질쉐이크&nbsp;
				<input type="radio" name="pfood" id="pfood6" value="snack" />다이어트스낵&nbsp;
				<input type="radio" name="pfood" id="pfood7" value="yogurt" />유제품&nbsp;
				</div>	
			</div>
			<div id="div10" style="clear:both; padding-top: 10px; box-sizing: border-box;">
				<input type="button" id="btnfinck" class="btn" value="회원가입"/>
			</div>
			</div>
		</form>
	</div>
</body>
</html>