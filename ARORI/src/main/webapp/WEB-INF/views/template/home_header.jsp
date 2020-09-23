<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Arori | 당신의 지식</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
	<!-- Ajax -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.19.2/axios.min.js" integrity="sha512-VZ6m0F78+yo3sbu48gElK4irv2dzPoep8oo9LEjxviigcnnnNvnTOJRSrIhuFk68FMLOpiNz+T77nNY89rnWDg==" crossorigin="anonymous"></script>
	<!-- Firebase -->
	<script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-app.js"></script>
	<!-- Firebase > 사용하고자 하는 app -->
	<script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-auth.js"></script>
	<script src="https://www.gstatic.com/firebasejs/6.2.0/firebase-firestore.js"></script>
	<!-- Firebase 클라이언트 -->
	<script src="${pageContext.request.contextPath }/resources/js/member/firebase_client.js"></script>
	<!-- Firebase Style js / css -->
	<script src="https://cdn.firebase.com/libs/firebaseui/3.5.2/firebaseui.js"></script>
	<link type="text/css" rel="stylesheet" href="https://cdn.firebase.com/libs/firebaseui/3.5.2/firebaseui.css" />
	<!-- 로그인 JavaScript -->
	<script src="${pageContext.request.contextPath }/resources/js/member/login.js" charset="UTF-8"></script>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/login.css">
	<!-- Find ID/PW -->
	<script src="${pageContext.request.contextPath }/resources/js/member/find.js" type="text/javascript" charset="UTF-8"></script>
	<!-- font -->
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: rgb(74, 112, 223);
        }
        .login-header {
            color: white;
        }
        .logo {
            width: 80px;
            height: 80px;
        }

        .title {
            font-size: 4rem; 
        }
        .sub-title {
            font-weight: bold;
        }
        .login-box {
            height: 730px;
            border-radius: 25px;
            background-color: white;
        }
        .findPw {
            display: none;
        }
        #findId,
        #findPw {
            display: none;
        }
        #tabfindId,
        #tabfindPw {
            cursor: pointer;
            border-radius: 5px;
        }
        
        /* 흰박스 안에 내용 */
        .row {
        padding-top : 5px
        }
    </style>
</head>
<body>
   <!--로그인실패시  나오는 모달  -->
	<div class="modal fade" tabindex="-1" id="loginFail">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">로그인 실패</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>아이디 혹은 비밀번호를 확인해주세요.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
	      </div>
	    </div>
	  </div>
	</div>
	<div class="modal fade" tabindex="-1" id="loginStop">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">로그인 실패</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>현재 회원님은 일시 정지 상태입니다.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	  <!-- 아이디 찾기모달  -->
	<div class="modal fade" tabindex="-1" id="findIdModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Find ID</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p id="idResult"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 비번 찾기모달  -->
	<div class="modal fade" tabindex="-1" id="findPwModal">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">Find PW</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p id="pwResult"></p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- 회원가입 실패 모달  -->
	<div class="modal" tabindex="-1" id="JoinFail">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title">회원가입실패</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>회원가입 조건이 맞는지 다시한번 확인해주새요 </p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <!-- <button type="button" class="btn btn-primary">Save changes</button> -->
	      </div>
	    </div>
	  </div>
	</div>
	
    <div class="container-fluid">
    	<div class="row position-fixed w-100 mt-4" style="z-index: 1;">
    		<div class="col-12 d-flex justify-content-end">
    			<form id="testAroriForm">
    				<input type="hidden" name="member_id" value="tester">
    				<input type="hidden" name="member_pw" value="tester">
		    			<button type="button" class="btn btn-md btn-success font-weight-bold mr-3 shadow-lg" id="testArori">아로리 회원 테스트</button>
    			</form>
    			<form id="testAdminForm">
					<input type="hidden" name="member_id" value="admin">
					<input type="hidden" name="member_pw" value="admin">    			
		    			<button type="button" class="btn btn-md btn-danger font-weight-bold shadow-lg" id="testAdmin">관리자 테스트</button>
    			</form>
    		</div>
    	</div>
    	<div class="row position-fixed w-100 mt-5 pt-5" style="z-index: 1;">
    		<div class="col-12 d-flex justify-content-end">
    			<script>
					$(function () {
						$('[data-toggle="tooltip"]').tooltip()
					})
				</script>
				<a href="${pageContext.request.contextPath }/swagger-ui.html">
					<img src="${pageContext.request.contextPath }/resources/img/swagger_icon.svg" class="header-icon" style="width: 40px; height: 40px;"  data-toggle="tooltip" data-placement="bottom" title="Go Swagger2!"></img>
				</a>
				<a href="${pageContext.request.contextPath }/portfolio" class="btn btn-md btn-warning font-weight-bold ml-3 shadow-lg text-white">포트폴리오</a>
    		</div>
    	</div>
        <div class="row login-header">
            <div class="col-sm-12 offset-md-2 col-md-8">
                <div class="row mt-5">
                    <div class="offset-1 col-10 offset-md-2 col-md-8">
                        <div class="row d-flex justify-content-around">
                            <div class="col-md-5 col-4">
                                <a href="/arori"><img class="logo float-right" alt="arori" src="${pageContext.request.contextPath }/resources/img/arori_logo.png"></a>
                            </div>
                            <div class="col-md-7 col-8">
                                <span class="title font-weight-bolder">ARORI</span>
                                <span class="sub-title font-weight-bold font-italic"> 당신의 지식</span>
                            </div>
                        </div>
                    </div>                        
                </div>
            </div>
        </div>
        <div class="row mb-5">
         