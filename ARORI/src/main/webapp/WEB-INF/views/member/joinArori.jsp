<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="/WEB-INF/views/template/home_header.jsp"></jsp:include>
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
                        <form action="joinArori" method="post">
                            <div class="form-group">
                                <input type="text" name="member_id" class="form-control form-control-sm" placeholder="ID" required="required">
                            </div>
                            <div class="form-group">
                                <input type="password" name="member_pw" class="form-control form-control-sm" placeholder="PW" required="required">
                            </div>
                            <div class="form-group">
                                <input type="email" name="member_email" class="form-control form-control-sm" placeholder="EMAIL" required="required">
                            </div>
                            <div class="form-group">
                                <input type="text" name="member_nick" class="form-control form-control-sm" placeholder="NICK" required="required">
                            </div>
                            <div class="form-group">
                                <input type="text" name="member_phone" class="form-control form-control-sm" placeholder="HP" required="required">
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
                                <button type="submit" class="btn btn-warning btn-block btn-lg text-white">Sing In</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
