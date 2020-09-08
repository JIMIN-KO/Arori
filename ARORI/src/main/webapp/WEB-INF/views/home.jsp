<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<jsp:include page="/WEB-INF/views/template/home_header.jsp"></jsp:include>
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
                    <div class="offset-2 col-8">
                        <form action="loginSuccess" method="post" id="aroriLogin">
                            <div class="form-group">
                                <input type="text" name="member_id" class="form-control form-control-lg" placeholder="ID" required="required">
                            </div>
                            <div class="form-group">
                                <input type="password" name="member_pw" class="form-control form-control-lg" placeholder="PW" required="required">
                            </div>
                            <div class="form-group">
                                <div style="height: 50px;"></div>
                                <button type="button" class="btn btn-warning btn-block btn-lg text-white" data-target="#loginFail" id="loginBtn">Sign In</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row">
                    <div class="offset-2 col-8">
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
