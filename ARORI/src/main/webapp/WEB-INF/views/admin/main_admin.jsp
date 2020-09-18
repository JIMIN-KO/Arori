<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>


<script>

	$(function(){
		
		// 2D그리기 도구를 ctx라는 이름으로 저장
		var ctx = document.getElementById('chart').getContext('2d');
		
		<!-- 멤버 차트-->
		// 차트 생성 코드
		var chart = new Chart(ctx, {
		    // The type of chart we want to create
		    type: 'line',
		    
		    // 실제 차트를 구성하는 데이터
		    data: {
		    	// 축에 표시될 라벨 정보
		        labels: ['1주차', '2주차', '3주차', '4주차', '5주차', '6주차'],
		        
		        // 실제 데이터
		        datasets: [{
		            label: 'Total',
		            backgroundColor: 'rgba(0, 0, 0, 0)',
		            borderColor: '#ED6D85',
		            data: [0, 10, 40, 45, 20, 50, 45],
		        	borderWidth:4
		        }, {
		        	label: 'ARORI',
		            backgroundColor: 'rgba(0, 0, 0, 0)',
		            borderColor: '#4A70F6',
		            data: [0, 10, 5, 2, 20, 30, 45],
		        	borderWidth:2       	
		        }, {
		        	label: 'SICIAL',
		            backgroundColor: 'rgba(0, 0, 0, 0)',
		            borderColor: '#F5C159',
		            data: [0, 6, 10, 2, 10, 30, 23],
		        	borderWidth:2	
		        	
		        }
		        
		        ]
		    },

		    // 기타 제어용 옵션
		    options: {
		    	responsive: false,
		    	scales: {
		            xAxes: [{
		                display: true,
		                ticks:{
		                   	fontSize : 14,
		                   	fontColor : 'rgba(12, 13, 13, 1)'
		                },
		                scaleLabel: {
		                    display: true,
		                    labelString: '기간',
		                	fontSize : 12,
		           		  fontColor : 'rgba(12, 13, 13, 1)'
		                }
		            }],
		            yAxes: [{
		                display: true,
		                ticks: {
		                  	min : 0,
		                  	max:100,
		                  	stepSize : 20,
		                    fontSize :14,
		                    fontColor : 'rgba(12, 13, 13, 1)'
						
						
		                },
		                scaleLabel: {
		                    display: true,
		                    labelString: '명 수',
		                    fontSize : 12,
		                    fontColor : 'rgba(12, 13, 13, 1)',

		                  
		                }
		            }]
		        }
		    	
		    }
		});
	})
	
		<!--클래스 생성 차트-->
	$(function(){
			
		// 2D그리기 도구를 ctx라는 이름으로 저장
		var ctx = document.getElementById('chart2').getContext('2d');
			
		<!-- 멤버 차트-->
		// 차트 생성 코드
		var chart = new Chart(ctx, {
			   // The type of chart we want to create
			   type: 'line',
			    
			   // 실제 차트를 구성하는 데이터
			   data: {
			   	// 축에 표시될 라벨 정보
			       labels: ['1주차', '2주차', '3주차', '4주차', '5주차', '6주차'],
			        
			        // 실제 데이터
			        datasets: [{
			            label: 'Total',
			            backgroundColor: 'rgba(0, 0, 0, 0)',
			            borderColor: '#ED6D85',
			            data: [0, 10, 40, 45, 20, 50, 45],
			        	borderWidth:4
			        }, {
			        	label: 'Week Total',
			            backgroundColor: 'rgba(0, 0, 0, 0)',
			            borderColor: '#C2C5BF',
			            data: [0, 10, 5, 2, 20, 30, 45],
			        	borderWidth:2       	
			        }
			        
			        ]
			    },

			    // 기타 제어용 옵션
			    options: {
			    	responsive: false,
			    	scales: {
			            xAxes: [{
			                display: true,
			                ticks:{
			                   	fontSize : 14,
			                   	fontColor : 'rgba(12, 13, 13, 1)'
			                },
			                scaleLabel: {
			                    display: true,
			                    labelString: '기간',
			                	fontSize : 12,
			           		  fontColor : 'rgba(12, 13, 13, 1)'
			                }
			            }],
			            yAxes: [{
			                display: true,
			                ticks: {
			                  	min : 0,
			                  	max:100,
			                  	stepSize : 20,
			                    fontSize :14,
			                    fontColor : 'rgba(12, 13, 13, 1)'
							
							
			                },
			                scaleLabel: {
			                    display: true,
			                    labelString: '개수',
			                    fontSize : 12,
			                    fontColor : 'rgba(12, 13, 13, 1)',

			                  
			                }
			            }]
			        }
			    	
			    }
			});	
		})

			<!--요약 차트-->
	$(function(){
			
		// 2D그리기 도구를 ctx라는 이름으로 저장
		var ctx = document.getElementById('chart3').getContext('2d');
			
		// 차트 생성 코드
		var chart = new Chart(ctx, {
			   // The type of chart we want to create
			   type: 'bar',
			    
			   // 실제 차트를 구성하는 데이터
			   data: {
			   	// 축에 표시될 라벨 정보
			       labels: ['회원가입', '클래스', '퀴즈', 'Q&A'],
		
			        
			        // 실제 데이터
			        datasets: [{
			        	label: 'Today New',
			            backgroundColor: 'rgba(0, 0, 0, 0)',
			            borderColor: '#C2C5BF',
			            data: [${count[0]}, ${count[1]}, ${count[2]}, ${count[3]}],
			        	borderWidth:2       	
			        }
			        
			        ]
			    },

			    // 기타 제어용 옵션
			    options: {
			    	responsive: false,
			    	scales: {
			            xAxes: [{
			                display: true,
			                ticks:{
			                   	fontSize : 14,
			                   	fontColor : 'rgba(12, 13, 13, 1)'
			                },
			                scaleLabel: {
			                    display: true,
			                    labelString: '기간',
			                	fontSize : 12,
			           		  fontColor : 'rgba(12, 13, 13, 1)'
			                }
			            }],
			            yAxes: [{
			                display: true,
			                ticks: {
			                  	min : 0,
			                  	max: 30,
			                  	stepSize : 5,
			                    fontSize :14,
			                    fontColor : 'rgba(12, 13, 13, 1)'
							
							
			                },
			                scaleLabel: {
			                    display: true,
			                    fontSize : 12,
			                    fontColor : 'rgba(12, 13, 13, 1)',

			                  
			                }
			            }]
			        }
			    	
			    }
			});	
		})
</script>

<style>

	/* 차트 스타일 */
	#chart {
		width: 650px;
		height: 650px;
		margin-top: 70px;
		margin-left: 15px;
	}
	
	#chart2 {
		width: 650px;
		height: 650px;
		margin-top: 70px;
	}
	
	#chart3 {
		width: 800px;
		height: 650px;
		margin-top: 70px;
	}

	/* 제목 div */
	.title {
		text-align: center;
		font-weight: 700;
		padding-top:20px;
	}
	/* 제목 텍스트 */
	.title-text {
		font-size:17px;
	}
</style>

<body>
	<div class="container-fluid">
	
		<!-- 회원가입, 클래스 제목 -->
		<div class="row mt-5">
			<div class="col-6 mt-5 title">
				<span class="title-text"> 회원 수 현황 </span>
			</div>
			<div class="col-6 mt-5 title">
				<span class="title-text" > 클래스 생성 현황 </span>
			</div>
		</div>
		
		<div class="row">
		<!-- 회원가입 차트 -->
			<div class="memberChart col-6">
				<canvas id="chart">	 
			</canvas>
		<!--  클래스 차트 -->
			</div>
			<div class="classChart col-6">
				<canvas id="chart2">	 
			</canvas>
			</div>
		</div>
		
		<div class="row">
		<!-- 요약 제목 -->
			<div class="col-12 mt-5 title" style="text-align:center">
				<span class="title-text"> 오늘의 아로리 </span>
			</div>
			<div class="col-12 mb-5" style="text-align: -webkit-center;">
				<canvas id="chart3"></canvas>
			</div>
			
		</div>
	</div>

</body>


<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>

