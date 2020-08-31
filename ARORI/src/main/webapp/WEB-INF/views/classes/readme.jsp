<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9" style="border-right: 1px solid rgba(190, 190, 190, 0.493)">
                        <br>
                        <h1 class="font-weight-bold mt-4">Read Me</h1>
                        <hr><br>
                        <div id="editor"></div>
                        <div class="float-right mt-5">
                        	<button class="btn btn-primary btn-lg font-weight-bold">취소하기</button>
                        	<button class="btn btn-warning btn-lg font-weight-bold">작성하기</button>
                        </div>
                    </div>
                    <div class="col-sm-3 col-md-3 col-lg-2 calendar-nav">
                        <br>
                        <h3 class="font-weight-bold">Calendar</h3>
                        <div id="menu">
                            <span id="menu-navi">
                            </span>
                            <span id="renderRange" class="render-range"></span>
                        </div>
                      
                        <div id="calendar" class="w-100"></div>
                    </div>
                </div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>