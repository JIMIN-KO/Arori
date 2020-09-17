<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>
 
    <script>
    //모달 가리기
   $(function(){
	  $("#JoinFail").modal("hide")
  })
  //submit전에 회원가입 형식을 검사하는 함수  조건에 걸리면 모달을 보여줘라
  function finalcheck(){
		if(checkID() == false || checkPw() == false || checkEmail()== false || checkNick()== false || checkPhone() == false) {
			$("#JoinFail").modal("show") //회원가입양식 확인 하라는 모달 
			return false
		}  
	}
  	
	
  //아이디 중복 검사  
  function checkID(){
	  var regex = /^[a-zA-Z0-9]{4,12}$/g; //정규식 : 4~12글자의 영어(대,소문자) 숫자만으로 구성가능합니다
	  var input = document.querySelector("input[name=member_id]"); //사용자가 input창에  입력한 값 
	  var span = document.querySelector("input[name=member_id]+span"); 
	  var isValid = regex.test(input.value); //입력한 아이디가 조건식에 맞는지 검사 
	  var member_id = input.value; //사용자가 입력한 값 
	  var prohibition ="admin"; //금지할 단어의 정규식 

	  if(input.value.indexOf(prohibition)!= -1){ //금지단어를가지고 있다면 
		     span.textContent="해당 아이디는 운영자전용임";
	  		return false;
		
	  }else{//금지하는 단어가 없을경우 정규표현식검사  
		  
		  if(isValid){//정상적인 이름인 경우  아이디 중복체크 
			
			  axios({
				  url:"${pageContext.request.contextPath}/nonMemberAjax/checkOverlap?member_id="+member_id,
				 method:"get"  
			  })
			  .then(function(resp){
				  console.log(resp)
				  if(!resp.data){ //결과가 없다면 
					  span.textContent = "사용이가능합니다.";
				  		return true;
				  }else{
					  span.textContent="이미 사용중입니다.";
				  		return false;
				  }	  
			  });
		  }  
	      else{//정규표현식 안맞으면
	    	  span.textContent="4~12글자의 영어(대,소문자) 숫자만 으로 구성가능합니다";
		  		return false;

	      }

	  }
	 }  
	   //비밀번호 조건 검사 
	  	 function checkPw(){
	  var regex = /^[A-Za-z0-9]{6,12}$/;  //6~15글자의 영어(대,소문자) 숫자만으로 구성가능합니다
	  var input = document.querySelector("input[name=member_pw]"); //사용자가 input창에  입력한 값 
	  var span = document.querySelector("input[name=member_pw]+span"); 
	  var isValid = regex.test(input.value); //입력한 pw가 조건식에 맞는지 검사 
	  var member_pw = input.value; //사용자가 입력한 pw값 
	   
	   
	  if(isValid){//입력한 pw가 조건에맞는다면 
		 span.textContent = "좋은 비밀번호입니다.";
			 return true;
			}	  
		   else{//정규표현식 안맞으면
    	  span.textContent="6~15글자의 영어(대,소문자) 숫자만으로 구성가능합니다";
    	  return false;
    	  }
	   }
	  
	  
	 
	 //메일검사
	 
	 
	  function checkEmail(){
		  var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //email체크조건
		  var input = document.querySelector("input[name=member_email]");
		  var span = document.querySelector("input[name=member_email]+span");
		  var isValid = regex.test(input.value); 
		  var member_email = input.value;
		 
		 
		  if(isValid){  //정규표현식 조건에 맞다면 
		 
		  axios({
			  url:"${pageContext.request.contextPath}/nonMemberAjax/checkOverlapMail?member_email="+member_email,
			 method:"get"  
		  })
		  .then(function(resp){
			  if(!resp.data){ //결과가 없다면 
				  span.textContent = "사용이 가능합니다.";
			  		return true;

			  }else{
				  span.textContent="이미 사용중인 이메일입니다.";
			  		return false;

			  }	  
		  });
	  
 	 }
		  else{//정규표현식 안맞으면
		        span.textContent="이메일 주소 형식이 맞는지 확인해주세요";
		            return false;

		    }	  
	 }
	   
	  //닉네임 형식 검사
	  function checkNick(){
	  var regex =/^[가-힣a-zA-Z0-9]{2,10}$/g; //정규식:2~10자 한글,영어,숫자 사용가능 
	  var input = document.querySelector("input[name=member_nick]"); //사용자가 input창에  입력한 값 
	  var span = document.querySelector("input[name=member_nick]+span"); 
	  var isValid = regex.test(input.value); //입력한 아이디가 조건식에 맞는지 검사 
	  var member_nick = input.value; //사용자가 입력한 값 
	  var prohibition ="관리자"; //금지할 단어

	  if(input.value.indexOf(prohibition)!=-1){ //금지단어를가지고 있다면 
		  span.textContent="해당 닉네임은 관리자 전용입니다.";
	  	 }else{//금지하는 단어가 없을경우 정규표현식검사  
		  if(isValid){//정상적인 이름인 경우  아이디 중복체크 
			
			  axios({
				  url:"${pageContext.request.contextPath}/nonMemberAjax/checkOverlapNick?member_nick="+member_nick,
				 method:"get"  
			  })
			  .then(function(resp){
				  console.log(resp)
				  if(!resp.data){ //결과가 없다면 
					  span.textContent = "멋진 닉네임입니다";
				  		return true;

				  }else{
					  span.textContent="이미 사용중인 닉네임입니다.";
				  		return false;

				  }	  
			  });
		  }  
	      else{//정규표현식 안맞으면
	    	  span.textContent="2~10자 한글,영어,숫자만 가능합니다. ";
	    	  	return false;
	      }

	  }
	 }  
	   
	  //핸드폰검사
	  function checkPhone(){
		  
		  
		  var regex = /^[0-9]{10,11}$/g;  //공백없이 숫자 10자또는 11자만 가능         ///^\d{3}-\d{3,4}-\d{4}$/;
		  var input = document.querySelector("input[name=member_phone]");
		  var span = document.querySelector("input[name=member_phone]+span");
		  var isValid = regex.test(input.value); //사용자가 입력한 폰번호가 아이디가 조건식에 맞는지 검사; 
		  var member_phone = input.value; //사용자가 입력한 폰 번호 

		
		  if(isValid){ //정규표현식 맞으면
				
			  axios({
				 url:"${pageContext.request.contextPath}/nonMemberAjax/checkOverlapPhone?member_phone="+member_phone,
				method:"get"  
			  })
			  .then(function(resp){
				  console.log(resp)
				  if(!resp.data){ //결과가 없다면 
					  span.textContent = "사용이가능합니다.";
			    	  	return true;

				  }else{
					  span.textContent="이미 사용중입니다.";
			    	  	return false;

				  }	  
			  });
		  }  
	      else{//정규표현식 안맞으면
	    	  span.textContent="휴대폰 번호는 공백없이 입력해주세요. ";
	    	  	return false;

	      }

	  }
	 
	   
  </script>  
<jsp:include page="/WEB-INF/views/template/home_header.jsp"></jsp:include>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/member/joinArori.js"></script>
				<div class="offset-1 col-10 offset-lg-3 col-lg-6 mt-4 login-box text-center">
				<div class="row mt-3">
					<div class="offset-1 col-10 font-italic font-weight-light text-left">
						<a class="text-link" style="cursor: pointer; color: gray;" href="${pageContext.request.contextPath }">
							&laquo; &#32;Back
						</a>
					</div>
				</div>
                <div class="row">
                    <div class="offset-sm-1 col-sm-10 offset-md-3 col-md-6 h1 font-weight-bolder">Sign Up</div>
                </div>
                <div class="row">
                    <div class="offset-sm-1 col-sm-10 offset-md-3 col-md-6 h5 font-italic text-muted mt-1">Come with Arori!</div>
                </div>
                <div class="row">
                    <div class="offset-1 col-10">
                        <div class="row m-3">
                            <div class="col-12"><hr></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="offset-2 col-8">
                        <form action="joinArori" method="post" onSubmit="return finalcheck();">
                            <div class="form-group">
                                <input type="text" name="member_id"  oninput="checkID()" class="form-control form-control-sm" placeholder="ID" required="required"><span></span>
                            </div>
                            <div class="form-group">
                                <input type="password" name="member_pw" oninput="checkPw()" class="form-control form-control-sm" placeholder="PW" required="required"><span></span>
                            </div>
                            <div class="form-group">
                                <input type="email" name="member_email"  oninput="checkEmail()" class="form-control form-control-sm" placeholder="EMAIL" required="required"><span></span>
                            </div>
                            <div class="form-group">
                                <input type="text" name="member_nick"  oninput="checkNick()" class="form-control form-control-sm" placeholder="NICK" required="required"><span></span>
                            </div>
                            <div class="form-group">
                                <input type="text" name="member_phone" oninput="checkPhone()" class="form-control form-control-sm" placeholder="휴대폰 번호는 공백없이 입력해주세요" required="required"><span></span>
                            </div>
                            <div class="form-group">
                                <select name="member_q" class="form-control form-control-sm">
                                    <c:forEach var="passwordQ" items="${passwordQ }">
                                        <option value="${passwordQ.pq_no }">${passwordQ.pq_content }</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" name="member_a" class="form-control form-control-sm" placeholder="ANSWER" required="required">
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-warning btn-block btn-lg text-white" data-target="#JoinFail">Sign In</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>



