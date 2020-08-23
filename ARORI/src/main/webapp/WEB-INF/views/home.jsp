<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
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
    </style>
</head>
<body>
    <div class="container-fluid">
        <div class="row login-header mt-5">
            <div class="col-sm-12 offset-md-2 col-md-8">
                <div class="row mt-5">
                    <div class="offset-1 col-10 offset-md-2 col-md-8">
                        <div class="row d-flex justify-content-around">
                            <div class="col-md-5 col-4">
                                <img class="logo float-right" alt="arori" src="${pageContext.request.contextPath }/resources/img/arori_logo.png">
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
        <div class="row">
            <div class="offset-1 col-10 offset-md-3 col-md-6 mt-4 login-box text-center">
                <div class="row mt-5">
                    <div class="offset-sm-1 col-sm-10 offset-md-3 col-md-6 h1 font-weight-bolder">Sign In</div>
                </div>
                <div class="row">
                    <div class="offset-sm-1 col-sm-10 offset-md-3 col-md-6 h5 font-italic text-muted mt-1">with your social Network</div>
                </div>
                <div class="row mt-4">
                    <div class="offset-2 col-8">
                        <div class="row">
                            <div class="col-6">
                                <div onclick="login(this);" id="google" class="firebaseui-idp-button mdl-button mdl-js-button mdl-button--raised firebaseui-idp-google firebaseui-id-idp-button">
                                    <span class="firebaseui-idp-icon-wrapper">
                                        <img src="https://www.gstatic.com/firebasejs/ui/2.0.0/images/auth/google.svg" class="firebaseui-idp-icon">
                                    </span>
                                    <span class="firebaseui-idp-text firebaseui-idp-text-long">Sign in with Google</span>
                                    <span class="firebaseui-idp-text firebaseui-idp-text-short">Google</span>
                                </div>
                            </div>
                            <div class="col-6">
                                <div onclick="login(this);" id="github" class="firebaseui-idp-button mdl-button mdl-js-button mdl-button--raised firebaseui-idp-github firebaseui-id-idp-button">
                                    <span class="firebaseui-idp-icon-wrapper">
                                        <img src="https://www.gstatic.com/firebasejs/ui/2.0.0/images/auth/github.svg" class="firebaseui-idp-icon">
                                    </span>
                                    <span class="firebaseui-idp-text firebaseui-idp-text-long">Sign in with Github</span>
                                    <span class="firebaseui-idp-text firebaseui-idp-text-short">Github</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="offset-1 col-10">
                        <div class="row m-4">
                            <div class="col-5"><hr></div>
                            <div class="col-2 text-muted">or</div>
                            <div class="col-5"><hr></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="offset-1 col-10">
                        <form action="loginSuccess" method="post">
                            <div class="form-group">
                                <input type="text" name="member_id" class="form-control form-control-lg" placeholder="ID">
                            </div>
                            <div class="form-group">
                                <input type="password" name="member_pw" class="form-control form-control-lg" placeholder="PW">
                            </div>
                            <div class="form-group">
                                <div style="height: 50px;"></div>
                                <button type="submit" class="btn btn-warning btn-block btn-lg text-white">Sing In</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="offset-1 col-10">
                        <div class="row">
                            <div class="col-6 text-left text-info"><a href="joinArori"><button class="btn btn-link">Sign Up</button></a></div>
                            <div class="col-6 text-right text-info"><a href="find"><button class="btn btn-link">Find ID/PW</button></a></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
