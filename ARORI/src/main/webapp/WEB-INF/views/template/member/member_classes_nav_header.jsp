<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
				<div class="row">
                    <div class="col-12 readmerow class-menu2 active mt-5 position-fixed" style="border-bottom: 1px solid rgba(190, 190, 190, 0.493); z-index: 100; background-color: white;">
                        <ul class="nav w-100 text-center">
                            <li class="nav-item"><button class="btn btn-link font-weight-bold"><a href="${pageContext.request.contextPath }/classes/readme/${c_no}">Read Me</a></button></li>
                            <li class="nav-item"><button class="btn btn-link font-weight-bold"><a href="${pageContext.request.contextPath }/classes/notice/${c_no}/1">Notice</a></button></li>
                            <li class="nav-item"><button class="btn btn-link font-weight-bold"><a href="${pageContext.request.contextPath }/classes/quiz/${c_no}/1">Quiz</a></button></li>
                            <li class="nav-item"><button class="btn btn-link font-weight-bold"><a href="/">Q & A</a></button></li>
                        </ul>
                    </div>
                </div>
                <div class="row content-top mt-5 h-100">
                    <div class="col-1 h-100 class-menu1">
                        <ul class="nav flex-column h-100 text-center position-fixed" style="border-right: 1px solid rgba(190, 190, 190, 0.493); z-index: 5;">
                            <li class="nav-item"><button class="btn btn-link font-weight-bold mt-5 mb-5"><a href="${pageContext.request.contextPath }/classes/readme/${c_no}">Read Me</a></button></li>
                            <li class="nav-item"><button class="btn btn-link font-weight-bold mt-5 mb-5"><a href="${pageContext.request.contextPath }/classes/notice/${c_no}/1">Notice</a></button></li>
                            <li class="nav-item"><button class="btn btn-link font-weight-bold mt-5 mb-5"><a href="${pageContext.request.contextPath }/classes/quiz/${c_no}/1">Quiz</a></button></li>
                            <li class="nav-item"><button class="btn btn-link font-weight-bold mt-5 mb-5"><a href="/">Q & A</a></button></li>
                        </ul>
                    </div>