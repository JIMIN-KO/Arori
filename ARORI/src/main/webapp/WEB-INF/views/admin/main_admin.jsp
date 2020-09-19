<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>

<style>
/* 차트 스타일 */
	#chart {
		width: 650px;
		margin-top: 70px;
		margin-left: 15px;
	}
	
	#chart2 {
		width: 650px;
		margin-top: 70px;
	}
	
	#chart3 {
		width: 800px;
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
				<div class="row">
					<div class="col-7 text-center">
						<span class="title-text ml-5 h4"> 회원 수 현황 </span>
					</div>
					<div class="col-5 text-left">					
						<span>
							<input type="month" name="memberChart">
						</span>
					</div>
				</div>
			</div>
			<div class="col-6 mt-5 title">
				<div class="row">
					<div class="col-7 text-center">
						<span class="title-text ml-5 h4"> 클래스 수 현황 </span>
					</div>
					<div class="col-5 text-left">					
						<span>
							<input type="month" name="classesChart">
						</span>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row">
		<!-- 회원가입 차트 -->
			<div class="memberChart col-6 d-flex justify-content-center">
				<canvas id="chart">	 
			</canvas>
		<!--  클래스 차트 -->
			</div>
			<div class="classChart col-6 d-flex justify-content-center">
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
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.28.0/moment.min.js" integrity="sha512-Q1f3TS3vSt1jQ8AwP2OuenztnLU6LwxgyyYOG1jgMW/cbEMHps/3wjvnl1P3WTrF3chJUWEoxDUEjMxDV8pujg==" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.28.0/locale/ko.min.js" integrity="sha512-3kMAxw/DoCOkS6yQGfQsRY1FWknTEzdiz8DOwWoqf+eGRN45AmjS2Lggql50nCe9Q6m5su5dDZylflBY2YjABQ==" crossorigin="anonymous"></script>

<script>

	$(function(){
		 var max_date = moment().format().slice (0,7);
		 console.log(max_date)
		 $("input[name=memberChart]").attr("max",max_date)
		 $("input[name=classesChart]").attr("max",max_date)
		 
		// 멤버 차트
		$("input[name=memberChart]").on("change",function(){
			console.log($(this).val())
			
			// 전달할 데이터 json화
			var chartDto = {
				col:"member_join",
				table_name:"member",
				period:$(this).val()
			}
			console.log($(chartDto))
			 axios.post("/arori/chartAjax/totalChart", JSON.stringify(chartDto), {
				 	headers:{
						'content-type':'application/json',
				 	}
			 }) .then(resp=>{
				console.log(resp)
			})
		})
		
		// 클래스 차트
		$("input[name=classesChart]").on("change",function(){
			console.log($(this).val())
			
			// 전달할 데이터 json화
			var chartDto = {
				col:"c_when",
				table_name:"classes",
				period:$(this).val()
			}
			console.log($(chartDto))
			 axios.post("/arori/chartAjax/totalChart", JSON.stringify(chartDto), {
				 	headers:{
						'content-type':'application/json',
				 	}
			 }) .then(resp=>{
				console.log(resp)
				for(var i = 0; i < $(resp.data).size; i++) {
					console.log("hello")
					console.log(resp.data[i])
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
				        labels: ['5월', '6월', '7월', '8월', '9월'],
				        
				        // 실제 데이터
				        datasets: [{
				            label: 'Total',
				            backgroundColor: 'rgba(0, 0, 0, 0)',
				            borderColor: '#ED6D85',
				            data: [0, 10, 40, 45, 20, 50],
				        	borderWidth:4
				        }]
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
		})
	})

	$(function(){
		
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
		        labels: ['5월', '6월', '7월', '8월', '9월'],
		        
		        // 실제 데이터
		        datasets: [{
		            label: 'Total',
		            backgroundColor: 'rgba(0, 0, 0, 0)',
		            borderColor: '#ED6D85',
		            data: [0, 10, 40, 45, 20, 50],
		        	borderWidth:4
		        }, {
		        	label: 'ARORI',
		            backgroundColor: 'rgba(0, 0, 0, 0)',
		            borderColor: '#4A70F6',
		            data: [0, 10, 5, 2, 20, 30],
		        	borderWidth:2       	
		        }, {
		        	label: 'SICIAL',
		            backgroundColor: 'rgba(0, 0, 0, 0)',
		            borderColor: '#F5C159',
		            data: [0, 6, 10, 2, 10, 30],
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
			       labels: ['회원가입', '클래스', '퀴즈', 'Q&A', '신고'],
		
			        
			        // 실제 데이터
			        datasets: [{
			        	label: 'Today New',
			            backgroundColor: 'rgba(0, 0, 0, 0)',
			            borderColor: '#C2C5BF',
			            data: [${count[0]}, ${count[1]}, ${count[2]}, ${count[3]}, ${count[4]}],
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

<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>

