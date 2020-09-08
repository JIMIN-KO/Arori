<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.js" integrity="sha512-VGxuOMLdTe8EmBucQ5vYNoYDTGijqUsStF6eM7P3vA/cM1pqOwSBv/uxw94PhhJJn795NlOeKBkECQZ1gIzp6A==" crossorigin="anonymous"></script>


<script>
/* 

	$(document).ready(function(){
	

	$("#update").click(function(){

	if(confirm("수정하시겠습니까?")){
    document.form.action="${path}/member/socialMyPage";
    document.form.submit();

			 }

		});
	
	}); */  
    //모달 가리기
	   $(function(){
		  $("#memberUpdateFail").modal("hide")
	  })
	  //submit전에 회원가입 형식을 검사하는 함수  조건에 걸리면 모달을 보여줘라
	  function finalcheck(){
			if(checkEmail()== false || checkNick()== false || checkPhone() == false) {
				$("#memberUpdateFail").modal("show") //회원가입양식 확인 하라는 모달 
				return false
			}  
		}
	
	
	
//확인질문 불러오기 위해서 필요한 코드 

$(function(){
	document.querySelector("select[name=member_q]").querySelectorAll("option")[${aroriMemberDto.member_q}].selected = true; 
	
	})
	
 
//닉네임 검사코드 

	 function checkNick(){
	  var regex =/^[가-힣a-zA-Z0-9]{2,10}$/g; //정규식:2~10자 한글,영어,숫자 사용가능 
	  var input = document.querySelector("input[name=member_nick]"); //사용자가 input창에  입력한 값 
	  var span = document.querySelector("input[name=member_nick]+span"); 
	  var isValid = regex.test(input.value); //입력한 아이디가 조건식에 맞는지 검사 
	  var member_nick = input.value; //사용자가 입력한 값 
	  var prohibition ="관리자"; //금지할 단어

	  if(input.value==="${memberDto.member_nick}"){ //사용자가 원래 쓰던 닉네임 입력시 
	 	 	span.textContent="멋진닉네임입니다.";	
	 		 return true;
			}else{
	    	 if(input.value.indexOf(prohibition)!=-1){ //금지단어를가지고 있다면 
			  span.textContent="해당 닉네임은 관리자 전용입니다.";
		 		 return false;

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
		    	  span.textContent="2~10자 한글,영어,숫자만  공백없이 사용가능합니다. ";
		    	  	return false;
		      }
			}
		 }   
	   }

//이메일 검사코드
     function checkEmail(){
		  var regex = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i; //email체크조건
		  var input = document.querySelector("input[name=member_email]");
		  var span = document.querySelector("input[name=member_email]+span");
		  var isValid = regex.test(input.value); 
		  var member_email = input.value;
		 
		 
			 
		  if(input.value==="${aroriMemberDto.member_email}"){
			span.textContent = "사용이 가능합니다.";
			 return true;

		  }else{
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
    }

	 
//핸드폰 검사코드  
function checkPhone(){
		  
		  
		  var regex = /^[0-9]{10,11}$/g;  //공백없이 숫자 10자또는 11자만 가능         ///^\d{3}-\d{3,4}-\d{4}$/;
		  var input = document.querySelector("input[name=member_phone]");
		  var span = document.querySelector("input[name=member_phone]+span");
		  var isValid = regex.test(input.value); //사용자가 입력한 폰번호가 아이디가 조건식에 맞는지 검사; 
		  var member_phone = input.value; //사용자가 입력한 폰 번호 

		  if(input.value==="${aroriMemberDto.member_phone}"){
				span.textContent = "사용이 가능합니다.";
			}else{
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
             }

</script>

	<h1>정보수정</h1>
	<div>아이디  ${memberDto.member_id}  </div>
	<form action="updateArori" method="post" onSubmit="return finalcheck();">
	
	<div>nickname <input type="text" name="member_nick"  oninput="checkNick()"  value="${memberDto.member_nick}" ><span></span></div>
 	<div>email <input type="text" name="member_email"   oninput="checkEmail()" value="${aroriMemberDto.member_email}"  ><span></span></div>
 	<div>phone <input type="text" name="member_phone"  oninput="checkPhone()"  value="${aroriMemberDto.member_phone}" ><span></span></div>
 	<div>확인질문  <select name="member_q">
                   <c:forEach var="passwordQ" items="${passwordQ }">
                          <option value="${passwordQ.pq_no }">${passwordQ.pq_content }</option>
                    </c:forEach>
                           </select>
                            </div>
     <div>확인질문답변 <input type="text" name="member_a" id="memberUpdateFail"  value="${aroriMemberDto.member_a}" ><span></span></div>                       
	  <button type="submit"  data-target="#memberUpdateFail">회원정보수정</button>
</form>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>

