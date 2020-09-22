<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<style>
/* 차트 스타일 */
	#chart {
		margin-top: 70px;
		margin-left: 15px;
	}
	
	#chart2 {
		margin-top: 70px;
	}
	
	#chart3 {
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
		<!-- 회원가입, 클래스 제목 -->
		<div class="row mt-5">
			<div class="col-12 mt-5">
				<h1 class="font-weight-bold">${userinfo.member_nick } 님, 환영합니다!</h1>
			</div>
		</div>
		<br><hr class="mb-5"><br class="mb-5">
		<div class="row mt-2">
			<div class="col-lg-4 col-md-12 mt-5 title">
				<div class="row">
					<div class="col-7 text-center">
						<h4 class="ml-5 font-weight-bold"> 회원 수 현황 </h4>
					</div>
					<div class="col-5 text-left">					
						<span>
							<input type="month" name="memberChart">
						</span>
					</div>
				</div>
				<div class="row d-flex justify-content-center" >
					<div class="memberChart col-lg-12 col-md-10 offset-md-1 d-flex justify-content-center ml-0 h-100">
						<canvas id="chart" class="w-100 h-100">	 </canvas>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-12 mt-5 title">
				<div class="row">
					<div class="col-7 text-center">
						<h4 class="ml-5 font-weight-bold"> 클래스 수 현황 </h4>
					</div>
					<div class="col-5 text-left">					
						<span>
							<input type="month" name="classesChart">
						</span>
					</div>
				</div>
				<div class="row d-flex justify-content-center">
					<div class="classChart col-lg-12 col-md-10 offset-md-1 d-flex justify-content-center ml-0 h-100">
						<canvas id="chart2" class="w-100 h-100">	 </canvas>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-12 mt-5 title">
				<div class="row">
					<div class="col-12 text-center">
						<h4 class="ml-lg-5 font-weight-bold"> 오늘의 아로리 </h4>
					</div>
				</div>
				<div class="row d-flex justify-content-center">
					<div class="col-lg-12 col-md-10 offset-md-1 d-flex justify-content-center ml-0 h-100">
						<canvas id="chart3" class="w-100 h-100"></canvas>
					</div>
				</div>
			</div>
		</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.28.0/moment.min.js" integrity="sha512-Q1f3TS3vSt1jQ8AwP2OuenztnLU6LwxgyyYOG1jgMW/cbEMHps/3wjvnl1P3WTrF3chJUWEoxDUEjMxDV8pujg==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.28.0/locale/ko.min.js" integrity="sha512-3kMAxw/DoCOkS6yQGfQsRY1FWknTEzdiz8DOwWoqf+eGRN45AmjS2Lggql50nCe9Q6m5su5dDZylflBY2YjABQ==" crossorigin="anonymous"></script>

<!-- 해당 페이지 첫 진입 시, Model 로 받아온 값 JSTL 변수화 -->
<!-- 회원 통계 -->
<c:set var="memberWhen" value="${memberMap['when'] }"></c:set>
<c:set var="memberCount" value="${memberMap['count'] }"></c:set> 
<!-- 클래스 통계 -->
<c:set var="classesWhen" value="${classesMap['when'] }"></c:set>
<c:set var="classesCount" value="${classesMap['count'] }"></c:set>

<script>
	$(function(){

		 var max_date = moment().format().slice (0,7);
		 $("input[name=memberChart]").attr("max",max_date)
		 $("input[name=classesChart]").attr("max",max_date)
		 
		// 멤버 차트
		$("input[name=memberChart]").on("change",function(){
			
			// 전달할 데이터 json화
			var chartDto = {
				col:"member_join",
				table_name:"member",
				period:$(this).val()
			}
			 axios.post("/arori/chartAjax/totalChart", JSON.stringify(chartDto), {
				 	headers:{
						'content-type':'application/json',
				 	}
			 }) .then(resp=>{
				
				var when = []
				var count = []
				for(var i = 0; i < resp.data.length; i++) {
					when[i] = resp.data[i].when
					count[i] = resp.data[i].count
				}
				
				// 2D그리기 도구를 ctx라는 이름으로 저장
 				var ctx = document.getElementById('chart').getContext('2d'); 
				
				// 멤버 차트
				// 차트 생성 코드
				var chart = new Chart(ctx, {
				    // The type of chart we want to create
				    type: 'line',
				    
				    // 실제 차트를 구성하는 데이터
				    data: {
				    	// 축에 표시될 라벨 정보
				        labels: when,
				        
				        // 실제 데이터
				        datasets: [{
				            label: 'Total',
				            backgroundColor: 'rgba(0, 0, 0, 0)',
				            borderColor: '#fdc23e',
				            data: count,
				        	borderWidth:3
				        }]
				    },

				    // 기타 제어용 옵션
				    options: {
				    	responsive: true,
				    	scales: {
				            xAxes: [{
				                display: true,
				                ticks:{
				                   	fontSize : 14,
				                   	fontColor : 'rgba(12, 13, 13, 1)'
				                },
				                scaleLabel: {
				                    display: true,
				                    labelString: 'Date',
				                	fontSize : 12,
				           		  fontColor : 'rgba(12, 13, 13, 1)'
				                }
				            }],
				            yAxes: [{
				                display: true,
				                ticks: {
				                  	stepSize : 20,
				                    fontSize :14,
				                    fontColor : 'rgba(12, 13, 13, 1)'
				                },
				                scaleLabel: {
				                    display: true,
				                    labelString: 'Count',
				                    fontSize : 12,
				                    fontColor : 'rgba(12, 13, 13, 1)',
				                }
				            }]
				        }
				    }
				});
			})
		})
		
		// 클래스 차트
		$("input[name=classesChart]").on("change",function(){
			
			// 전달할 데이터 json화
			var chartDto = {
				col:"c_when",
				table_name:"classes",
				period:$(this).val()
			}
			 axios.post("/arori/chartAjax/totalChart", JSON.stringify(chartDto), {
				 	headers:{
						'content-type':'application/json',
				 	}
			 }) .then(resp=>{
				 	var when = []
					var count = []
					
					for(var i = 0; i < resp.data.length; i++) {
						when[i] = resp.data[i].when
						count[i] = resp.data[i].count
					}
				
				// 2D그리기 도구를 ctx라는 이름으로 저장
				var ctx = document.getElementById('chart2').getContext('2d');
				
				// 멤버 차트
				// 차트 생성 코드
				var chart = new Chart(ctx, {
				    // The type of chart we want to create
				    type: 'line',
				    
				    // 실제 차트를 구성하는 데이터
				    data: {
				    	// 축에 표시될 라벨 정보
				        labels: when,
				        
				        // 실제 데이터
				        datasets: [{
				            label: 'Total',
				            backgroundColor: 'rgba(0, 0, 0, 0)',
				            borderColor: 'rgb(74, 112, 223)',
				            data: count,
				        	borderWidth:3
				        }]
				    },

				    // 기타 제어용 옵션
				    options: {
				    	responsive: true,
				    	scales: {
				            xAxes: [{
				                display: true,
				                ticks:{
				                   	fontSize : 14,
				                   	fontColor : 'rgba(12, 13, 13, 1)'
				                },
				                scaleLabel: {
				                    display: true,
				                    labelString: 'Date',
				                	fontSize : 12,
				           		  fontColor : 'rgba(12, 13, 13, 1)'
				                }
				            }],
				            yAxes: [{
				                display: true,
				                ticks: {
				                  	stepSize : 20,
				                    fontSize :14,
				                    fontColor : 'rgba(12, 13, 13, 1)'
								
								
				                },
				                scaleLabel: {
				                    display: true,
				                    labelString: 'Count',
				                    fontSize : 12,
				                    fontColor : 'rgba(12, 13, 13, 1)',

				                  
				                }
				            }]
				        }
				    	
				    }
				});
			})
		})
	})

	$(function(){

		// 페이지 첫 진입 시 받아온 데이터 배열화 (JSTL 사용)
		var memberWhen = ['${memberWhen[0]}','${memberWhen[1]}','${memberWhen[2]}','${memberWhen[3]}']
		var memberCount = ['${memberCount[0]}','${memberCount[1]}','${memberCount[2]}','${memberCount[3]}']
		
		// 2D그리기 도구를 ctx라는 이름으로 저장
		var ctx = document.getElementById('chart').getContext('2d');
		
		// 멤버 차트
		// 차트 생성 코드
		var chart = new Chart(ctx, {
		    // The type of chart we want to create
		    type: 'line',
		    
		    // 실제 차트를 구성하는 데이터
		    data: {
		    	// 축에 표시될 라벨 정보
		        labels: memberWhen,
		        
		        // 실제 데이터
		        datasets: [{
		            label: 'Total',
		            backgroundColor: 'rgba(0, 0, 0, 0)',
		            borderColor: '#fdc23e',
		            data: memberCount,
		        	borderWidth:3
		        }]
		    },

		    // 기타 제어용 옵션
		    options: {
		    	responsive: true,
		    	scales: {
		            xAxes: [{
		                display: true,
		                ticks:{
		                   	fontSize : 14,
		                   	fontColor : 'rgba(12, 13, 13, 1)'
		                },
		                scaleLabel: {
		                    display: true,
		                    labelString: 'Date',
		                	fontSize : 12,
		           		  fontColor : 'rgba(12, 13, 13, 1)'
		                }
		            }],
		            yAxes: [{
		                display: true,
		                ticks: {
		                  	stepSize : 20,
		                    fontSize :14,
		                    fontColor : 'rgba(12, 13, 13, 1)'
						
						
		                },
		                scaleLabel: {
		                    display: true,
		                    labelString: 'Count',
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

		var classesWhen = ['${classesWhen[0]}','${classesWhen[1]}','${classesWhen[2]}','${classesWhen[3]}'];
		var classesCount = ['${classesCount[0]}','${classesCount[1]}','${classesCount[2]}','${classesCount[3]}'];
		
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
			       labels: classesWhen,
			        
			        // 실제 데이터
			        datasets: [{
			            label: 'Total',
			            backgroundColor: 'rgba(0, 0, 0, 0)',
			            borderColor: 'rgb(74, 112, 223)',
			            data: classesCount,
			        	borderWidth:3
			        }]
			    },

			    // 기타 제어용 옵션
			    options: {
			    	responsive: true,
			    	scales: {
			            xAxes: [{
			                display: true,
			                ticks:{
			                   	fontSize : 14,
			                   	fontColor : 'rgba(12, 13, 13, 1)'
			                },
			                scaleLabel: {
			                    display: true,
			                    labelString: 'Date',
			                	fontSize : 12,
			           		  fontColor : 'rgba(12, 13, 13, 1)'
			                }
			            }],
			            yAxes: [{
			                display: true,
			                ticks: {
			                  	stepSize : 20,
			                    fontSize :14,
			                    fontColor : 'rgba(12, 13, 13, 1)'
							
							
			                },
			                scaleLabel: {
			                    display: true,
			                    labelString: 'Count',
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
			       labels: ['회원가입', '클래스', '퀴즈', 'Q&A', '신고'],
		
			        
			        // 실제 데이터
			        datasets: [{
			        	label: 'Today New',
			            backgroundColor: 'rgba(0, 0, 0, 0)',
			            borderColor: '#dc3545',
			            data: [${count[0]}, ${count[1]}, ${count[2]}, ${count[3]}, ${count[4]}],
			        	borderWidth:2       	
			        }
			        
			        ]
			    },

			    // 기타 제어용 옵션
			    options: {
			    	responsive: true,
			    	scales: {
			            xAxes: [{
			                display: true,
			                ticks:{
			                   	fontSize : 14,
			                   	fontColor : 'rgba(12, 13, 13, 1)'
			                },
			                scaleLabel: {
			                    display: true,
			                    labelString: '분류 ',
			                	fontSize : 12,
			           		  fontColor : 'rgba(12, 13, 13, 1)'
			                }
			            }],
			            yAxes: [{
			                display: true,
			                ticks: {
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

<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>

