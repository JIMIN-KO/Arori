<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_myPage_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                        <br>
                        <div class="d-flex">
	                        <h1 class="font-weight-bold mt-4" style="flex:18;">My Info | Arori</h1>
                        </div>
                        <hr><br>
						<div class="card m-5">
						  <div class="row no-gutters">
						    <div class="col-md-4">
						      <img src="${pageContext.request.contextPath}/imgAjax/readme/download/22" class="card-img" alt="...">
						    </div>
						    <div class="col-md-8">
						      <div class="card-body pb-0">
						      <div class="row d-flex justify-content-end mr-5 mb-3">
						      	<h3 class="d-inline-block">${memberDto.member_nick }</h3>
						      	<h4 class="d-inline-block ml-3">님, 환영합니다!</h4>
						      </div>
						        <div class="row">
						        	<div class="col-12">
							        	<div class="card-group mt-3">
							        		<div class="row w-100">
							        			 <div class="card shadow-none col-sm-12 col-md-12 col-lg-4">
												    <div class="card-body text-center">
												      <h5 class="card-title">푼 퀴즈 개수</h5>
												      	<span class="card-text font-weight-bolder" style="font-size: 3rem;">
															<c:choose>
																<c:when test="${not empty memberScore }">
																	${memberScore.get(0) }
																</c:when>
																<c:otherwise>
																	0
																</c:otherwise>
															</c:choose>
														</span>
												      <span class="card-text ml-2 font-weight-bolder" style="font-size: 1rem;">개</span>
												    </div>
										  		</div>
							        			<div class="card shadow-none col-sm-12 col-md-12 col-lg-4">
												    <div class="card-body text-center">
												      <h5 class="card-title">평균 점수</h5>
												      <span class="card-text font-weight-bolder" style="font-size: 3rem;">
												      	<c:choose>
																<c:when test="${not empty memberScore }">
																	${memberScore.get(1) }
																</c:when>
																<c:otherwise>
																	0
																</c:otherwise>
															</c:choose>
												      </span>
												      <span class="card-text ml-2 font-weight-bolder" style="font-size: 1rem;">점</span>
												    </div>
										  		</div>
							        			<div class="card shadow-none col-sm-12 col-md-12 col-lg-4">
												    <div class="card-body text-center">
												      <h5 class="card-title">평균 정답률</h5>
												      <span class="card-text font-weight-bolder" style="font-size: 3rem;">
												      	<c:choose>
																<c:when test="${not empty memberScore }">
																	${memberScore.get(2) }
																</c:when>
																<c:otherwise>
																	0
																</c:otherwise>
															</c:choose>
												      </span>
												      <span class="card-text ml-2 font-weight-bolder" style="font-size: 1rem;">%</span>
												    </div>
										  		</div>
										  	</div>	
										</div>
									</div>
						        </div>
						      </div>
						    </div>
						  </div>
						</div>
						<!-- 차트 영역 -->
						<!-- 월별 퀴즈 푼 평균 -->
						<canvas id="myChart"></canvas>
						<!-- 월별 정답률 -->
						<canvas id="myChart2"></canvas>
                    </div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_viewer_footer.jsp"></jsp:include>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script>
var ctx = document.getElementById('myChart').getContext('2d');
var chart = new Chart(ctx, {
    // The type of chart we want to create
    type: 'line',

    // The data for our dataset
    data: {
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
        datasets: [{
            label: 'My First dataset',
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: [0, 10, 5, 2, 20, 30, 45]
        }]
    },

    // Configuration options go here
    options: {}
});

var ctx2 = document.getElementById('myChart2').getContext('2d');
var chart2 = new Chart(ctx2, {
    // The type of chart we want to create
    type: 'line',

    // The data for our dataset
    data: {
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
        datasets: [{
            label: 'My First dataset',
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: [0, 10, 5, 2, 20, 30, 45]
        }]
    },

    // Configuration options go here
    options: {}
});
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>