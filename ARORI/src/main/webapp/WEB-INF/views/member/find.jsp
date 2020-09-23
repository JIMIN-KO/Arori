<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/home_header.jsp"></jsp:include>
				<div class="offset-1 col-10 offset-lg-3 col-lg-6 mt-4 login-box text-center" style="height: 650px; !important">
				<div class="row mt-3">
					<div class="offset-1 col-10 font-italic font-weight-light text-left">
						<a class="text-link" style="cursor: pointer; color: gray;" href="${pageContext.request.contextPath }">
							&laquo; &#32;Back
						</a>
					</div>
				</div>
				<div class="row">
                    <div class="offset-sm-1 col-sm-10 offset-md-3 col-md-6 h1 font-weight-bolder">Find</div>
                </div>
                <div class="row">
                    <div class="offset-sm-1 col-sm-10 offset-md-3 col-md-6 h5 font-italic text-muted mt-1">Find your ID or PW!</div>
                </div>
                <div class="row">
                    <div class="offset-1 col-10">
                        <div class="row m-3">
                            <div class="col-12"><hr></div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="offset-1 col-10">
                        <div class="row">
                            <div class="offset-1 col-10">
                                <div class="row">
                                    <label for="findId" class="col-6 bg-warning text-white" id="tabfindId">
                                        <input type="radio" name="checkFind" id="findId" onchange="findAccount(this);" checked>
                                        <span>Find ID</span>
                                    </label>
                                    <label for="findPw" class="col-6" id="tabfindPw">
                                        <input type="radio" name="checkFind" id="findPw" onchange="findAccount(this)">
                                        <span>Find PW</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row mt-5 findId" id="selectfindId">
                    <div class="offset-1 col-10">
                        <form action="${pageContext.request.contextPath }/member/findId" method="post" id="goId">
                            <div class="form-group">
                                <input type="text" name="member_phone" class="form-control" placeholder="HP">
                            </div>
                            <div class="form-group">
                                <select name="member_q" class="form-control">
                                    <c:forEach var="passwordQ" items="${passwordQ}">
                                        <option value="${passwordQ.pq_no}">${passwordQ.pq_content}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name ="member_a" placeholder="ANSWER">
                            </div>
                            <div class="form-group">
                                <div style="height: 50px;"></div>
                                <input type="button" class="btn btn-warning btn-block btn-lg text-white" data-target="#findIdModal" value="Find ID" onclick="findId();">
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row mt-5 findPw" id="selectfindPw">
                    <div class="offset-1 col-10">
                        <form action="${pageContext.request.contextPath }/member/findPw" method="post" id="goPw">
                            <div class="form-group">
                                <input type="text" name="member_id" class="form-control" placeholder="ID">
                            </div>
                            <div class="form-group">
                                <select name="member_q" class="form-control">
                                    <c:forEach var="passwordQ" items="${passwordQ}">
                                        <option value="${passwordQ.pq_no}">${passwordQ.pq_content}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <input type="text" class="form-control" name="member_a" placeholder="ANSWER">
                            </div>
                            <div class="form-group">
                                <div style="height: 50px;"></div>
                                <input type="button" class="btn btn-warning btn-block btn-lg text-white" data-target="#findPwModal" value="Find PW" onclick="findPw();">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>