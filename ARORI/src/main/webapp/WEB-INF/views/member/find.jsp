<jsp:include page="/WEB-INF/views/template/main_header.jsp"></jsp:include>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row mt-5">
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
                        <form action="findId" method="post">
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
                                <input type="text" class="form-control" placeholder="ANSWER">
                            </div>
                            <div class="form-group">
                                <div style="height: 50px;"></div>
                                <button type="submit" class="btn btn-warning btn-block text-white">Find ID</button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="row mt-5 findPw" id="selectfindPw">
                    <div class="offset-1 col-10">
                        <form action="findPw" method="post">
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
                                <input type="text" class="form-control" placeholder="ANSWER">
                            </div>
                            <div class="form-group">
                                <div style="height: 50px;"></div>
                                <button type="submit" class="btn btn-warning btn-block text-white">Find PW</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>