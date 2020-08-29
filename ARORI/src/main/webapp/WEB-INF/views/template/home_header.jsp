<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<script src="${pageContext.request.contextPath }/resources/js/member/login.js"></script>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/member/login.css">
	<!-- Find ID/PW -->
	<script src="${pageContext.request.contextPath }/resources/js/member/find.js" type="text/javascript"></script>
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
            height: 620px;
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
    </style>
</head>
<body>
	<div class="modal" tabindex="-1" id="loginFail">
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
    <div class="container-fluid">
        <div class="row login-header mt-5">
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
            <div class="offset-1 col-10 offset-lg-3 col-lg-6 mt-4 login-box text-center">