<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
                <div class="row h-25">
                    <div class="col-6" style="background-color: bisque;">
                        Text block 1 > .h-25 적용
                    </div>
                    <div class="col-6" style="background-color: rgb(124, 185, 196);">
                        Text block 2 > .h-25 적용
                    </div>
                </div>
                <div class="row h-50">
                    <div class="col-10" style="background-color: rgb(255, 169, 129);">
                        Text block 3 > .h-50 적용
                    </div>
                    <div class="col-1 offset-1" style="background-color: whitesmoke;">
                        Text block 1 > .h-50 / .offset-1 > 적용
                    </div>
                </div>
                부모 col-11 > .main-body 
                <h1>로그인 정보</h1>
                id : ${userinfo.member_id }
                nick : ${userinfo.member_nick }
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>
