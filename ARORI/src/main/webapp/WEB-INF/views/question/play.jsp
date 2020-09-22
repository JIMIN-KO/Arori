<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                    	<br>
                        <div class="d-flex">
	                        <h1 class="font-weight-bold mt-4" style="flex:18;">Quiz | ${quizDto.q_title }</h1>
                        </div>
                    	<hr><br>
                    	<!-- 본문 내용 -->
                    	<c:set var="index" value="1"></c:set>
                    	<c:forEach var="thisQuizDto" items="${thisQuizDto }">
                    	<div class="card m-5 question qt_${thisQuizDto.qt_no }">
                    	<input type="hidden" value="${thisQuizDto.question_no }">
						  <div class="card-header h3 bg-warning text-white">Question ${index }</div>
						  <c:set var="index" value="${index + 1 }"></c:set>
						  <div class="card-body">
						    <div class="viewer"></div>
						    <input type="hidden" value="${thisQuizDto.aq_content }" class="aq_content">
						    <hr class="mt-5 mb-5">
						    <p class="card-text">
						    		<c:choose>
						    			<c:when test="${thisQuizDto.qt_no == 1 }">
						    			<!-- OX 문제 영역 -->
						    				<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <div class="input-group-text">
										      <input type="radio" value="0"  name="${thisQuizDto.question_no }" id="o_${thisQuizDto.question_no }">
										    </div>
										  </div>
										  <label for="o_${thisQuizDto.question_no }" class="form-control h-auto">
										  	<span class="h5">${thisQuizDto.o_content }</span>
										  </label>
										</div>
						    				<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <div class="input-group-text">
										      <input type="radio" value="1" name="${thisQuizDto.question_no }" id="x_${thisQuizDto.question_no }">
										    </div>
										  </div>
										  <label for="x_${thisQuizDto.question_no }" class="form-control h-auto">
										 	<span class="h5">${thisQuizDto.x_content }</span>
										  </label>
										</div>
						    			</c:when>
						    			<c:when test="${thisQuizDto.qt_no == 2 }">
						    				<!-- 선다형 문제 영역 -->
						    				<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <div class="input-group-text">
										      <input type="radio" value="1"  name="${thisQuizDto.question_no }" id="one_${thisQuizDto.question_no }">
										    </div>
										  </div>
										  <label for="one_${thisQuizDto.question_no }" class="form-control h-auto">
										  	<span class="h5">${thisQuizDto.multiple_one }</span>
										  </label>
										</div>
						    				<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <div class="input-group-text">
										      <input type="radio" value="2" name="${thisQuizDto.question_no }" id="two_${thisQuizDto.question_no }">
										    </div>
										  </div>
										  <label for="two_${thisQuizDto.question_no }" class="form-control h-auto">
										 	<span class="h5">${thisQuizDto.multiple_two }</span>
										  </label>
										</div>
										<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <div class="input-group-text">
										      <input type="radio" value="3"  name="${thisQuizDto.question_no }" id="three_${thisQuizDto.question_no }">
										    </div>
										  </div>
										  <label for="three_${thisQuizDto.question_no }" class="form-control h-auto">
										  	<span class="h5">${thisQuizDto.multiple_three }</span>
										  </label>
										</div>
						    				<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <div class="input-group-text">
										      <input type="radio" value="4" name="${thisQuizDto.question_no }" id="four_${thisQuizDto.question_no }">
										    </div>
										  </div>
										  <label for="four_${thisQuizDto.question_no }" class="form-control h-auto">
										 	<span class="h5">${thisQuizDto.multiple_four }</span>
										  </label>
										</div>
						    			</c:when>
						    			<c:when test="${thisQuizDto.qt_no == 3 }">
						    				<!-- 단답형 문제 영역 -->
						    				<div class="input-group mt-3 mb-3">
										  <div class="input-group-prepend">
										    <span class="input-group-text">정답을 입력해주세요!</span>
										  </div>
										  <textarea class="form-control" name="${thisQuizDto.question_no }"></textarea>
										</div>
						    			</c:when>
						    		</c:choose>
						    </p>
						  </div>
						</div>
						</c:forEach>
						<div class="row mt-5 mr-4">
							<div class="col-12 d-flex justify-content-end">
								<a href="${pageContext.request.contextPath }/classes/quiz/detail/${quizDto.c_no }/${quizDto.q_no}" class="btn btn-lg btn-warning font-weight-bold">제출</a>
								<button class="btn btn-lg btn-primary font-weight-bold deleteMyAnswer"  data-target="#deleteMyAnswer">취소</button>
							</div>
						</div>
                    </div>
					<div class="row position-fixed w-75 mt-5">
						<div class="col-12 text-right font-weight-bold timer time mt-5 pt-5">
							<span class="rounded-lg h3 bg-success shadow-lg pt-2 pb-2 pl-4 pr-4 text-white timeBox">
								<span class="h3">
									<svg width="1.4em" height="1.4em" viewBox="0 0 16 16" class="bi bi-alarm-fill mb-2 mr-1" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd" d="M6 .5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1H9v1.07a7.001 7.001 0 0 1 3.274 12.474l.601.602a.5.5 0 0 1-.707.708l-.746-.746A6.97 6.97 0 0 1 8 16a6.97 6.97 0 0 1-3.422-.892l-.746.746a.5.5 0 0 1-.707-.708l.602-.602A7.001 7.001 0 0 1 7 2.07V1h-.5A.5.5 0 0 1 6 .5zM.86 5.387A2.5 2.5 0 1 1 4.387 1.86 8.035 8.035 0 0 0 .86 5.387zM11.613 1.86a2.5 2.5 0 1 1 3.527 3.527 8.035 8.035 0 0 0-3.527-3.527zM8.5 5.5a.5.5 0 0 0-1 0v3.362l-1.429 2.38a.5.5 0 1 0 .858.515l1.5-2.5A.5.5 0 0 0 8.5 9V5.5z"/>
								</svg>
								</span>
								<span class="hr h3">
									<c:choose>
										<c:when test="${quizDto.q_runtime / 60 eq 0 }">
											0 :
										</c:when>
										<c:when test="${(quizDto.q_runtime / 60) > 0 and (quizDto.q_runtime / 60) < 10}">
											<fmt:parseNumber var="hr" value="${quizDto.q_runtime / 60}" integerOnly="true"></fmt:parseNumber>
											${hr } :
										</c:when>
										<c:when test="${quizDto.q_runtime eq 60 }">
											1 :
										</c:when>
										<c:otherwise>
											<fmt:parseNumber var="hr2" value="${quizDto.q_runtime / 60}" integerOnly="true"></fmt:parseNumber>
												${hr2 } :
										</c:otherwise>
									</c:choose>
								</span>
								<span class="min h3">
									<c:choose>
										<c:when test="${quizDto.q_runtime > 60 && (quizDto.q_runtime % 60) < 10}">
											0${quizDto.q_runtime % 60 }
										</c:when>
										<c:when test="${quizDto.q_runtime > 60 && (quizDto.q_runtime % 60) > 9 }">
											${quizDto.q_runtime % 60 }
										</c:when>
										<c:when test="${quizDto.q_runtime eq 60 }">
											00
										</c:when>
										<c:otherwise>
											${quizDto.q_runtime}
										</c:otherwise>
									</c:choose>
								</span> : 
								<span class="sec h3">00</span>
							</span>
						</div>
                		</div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_viewer_footer.jsp"></jsp:include>
<script>
/* 문제 푼 후 업데이트 영역 */
$(function(){

$('#deleteMyAnswer').modal('hide') // 모달 숨기기 

$(".deleteMyAnswer").click(function(){
	$('#deleteMyAnswer').modal('show') // 모달 띄우기
})

$(".question").on("change",function(){

		// 경로 변수
		var questionNo = $(this).children("input[type=hidden]").val() //  해당 퀘스쳔 번호
		var inputPath = "input[name=" + questionNo + "]" // input 태그 경로
		var textPath = "textarea[name=" + questionNo + "]" // textarea 태그 경로

		// 비동기로 전달할 객체			
		var answerValue
		var inputVal = $(inputPath + ":checked").val()
		var textVal = $(textPath).val()
		
		if(inputVal) {
			answerValue = inputVal
			textVal = ""
		} else if(textVal) {
			answerValue = textVal
			inputVal = ""
		}
		
		var myAnswerDto = {
				member_no:${userinfo.member_no},
				q_no:${quizDto.q_no},
				question_no:questionNo, 
				my_answer:answerValue
		}
		
		if(myAnswerDto[Object.keys(myAnswerDto)[3]]) {
			 axios.post("/arori/answerAjax/update", JSON.stringify(myAnswerDto), {
				 	headers:{
						'content-type':'application/json',
				 	}
			 }).then(resp=>{

			})
		}
})
var originalTime = ${quizDto.q_runtime}
var quizTime = ${quizDto.q_runtime} * 60000 // 퀴즈 제한 시간

var fiveMin = quizTime - 300000 // 5분 전
var oneMin = quizTime - 60000 // 1분 전

var sec1 = 5 // 초 10의 자리
var sec2 = 9 // 초 1의 자리 
var min // 분
var hr // 시

// 분이 60분을 기준으로 넘거나 작을 때!
if(originalTime  > 60) {
	hr = Math.floor(originalTime / 60)
	min = originalTime % 60
	
} else if(originalTime == 60) {
	min = 0
	hr = 1
} else {
	min = originalTime
	hr = 0
}

setTimeout(function(){
	// 처음 시작 시 설정 시간 1초 후 -1
	if( (0 < min < 10) && min != 0) {
		min = min - 1
		$(".min").addClass("h3").text("0" + min)
	} else if(min > 9) {
		min -= 1
		$(".min").addClass("h3").text(min)
	}
	// 만약 min 이 최종 계산 후 0분 이라면 59 분으로 변환
	if(min < 0) {
		min = 59
	$(".min").addClass("h3").text(min)
	}
	console.log(min)
}, 1000)

setInterval(function(){
	// 초 단위 계산
	if(sec1 == -1) {
		sec1 = 5
		if(min == 0) {
			console.log(hr)
			// 시 단위 계산
			if(hr === 0) {
				hr = 0
			}

			if(hr > 0) {
				hr -= 1
			}
			console.log(hr)
			if(hr == 0) {
				$(".hr").addClass("h3").text("")
			} else {
				$(".hr").addClass("h3").text(hr + " :")
			}
			console.log(hr)
		}

		console.log(min)
		// 분 단위 계산
		if(-1 < min < 60) {
			console.log(min)
			min -= 1
			if(min < 0) {
				console.log(min)
				min = 59
			}
		} 
		
		// 4분 59초 남았을 때 주황 알람
		if(min == 4 && hr == 0) {
			$(".timeBox").removeClass("bg-success").addClass("bg-warning")
		}
		// 0분 59초 남았을 때 빨강 알람
		if(min == 0 && hr == 0) {
			$(".timeBox").removeClass("bg-warning").addClass("bg-danger")
		}

		// 만약 분이 10분 미만이라면 min 앞에 "0" 을 붙인다.
		// 분 갱신
		console.log(min)
		if(min < 10) {
			$(".min").addClass("h3").text("0" + min)
		} else {
			$(".min").addClass("h3").text(min)
		}
	}
	// 초 갱신
    $(".sec").addClass("h3").text(sec1 +"" +  sec2)
	
    if(sec2 == 0) {
		sec1 -= 1
    }

	sec2 -= 1
	if(sec2 == -1) {
		sec2 = 9
	}
	
}, 1000)

setTimeout(function(){
	alert("퀴즈 종료 5분 전입니다. 마무리 해주시기 바랍니다.")
}, fiveMin)

setTimeout(function(){
	alert("퀴즈 종료 1분 전입니다. 마무리 해주시기 바랍니다.")
}, oneMin)

setTimeout(function(){
	alert("퀴즈가 종료되었습니다. 현재 답안을 제출합니다!")
	location.href = "/arori/classes/quiz/detail/${quizDto.c_no}/${quizDto.q_no}"
}, quizTime)
	
})


/* 토스트 뷰어 영역 */
	var viewers = document.querySelectorAll(".viewer") /* viewer 클래스 생성 */
	var aq_content = document.querySelectorAll(".aq_content") /* String 으로 뭉쳐진 마크다운 코드 받아오기 */

	// Toast Plugin 불러오기 
	const Viewer = toastui.Editor;
    const { codeSyntaxHighlight, colorSyntax, tableMergedCell } = Viewer.plugin;
	// viewer 갯수만큼 반복하기 (최대 10개)
	for(var i = 0; i < viewers.length; i++) {
		
	    // Toast Viewer .viewer 만큼 불러오기 
	    const viewer = toastui.Editor.factory({
	        el: viewers[i],
	        viewer: true,
	        height: '350px',
	        initialValue: aq_content[i].value,
	        initialEditType: 'markdown',
	        plugins: [codeSyntaxHighlight, tableMergedCell]
	    });
	}
</script>
						<div class="modal fade" id="deleteMyAnswer" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
						  <div class="modal-dialog">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalLabel">퀴즈 나가기</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">&times;</span>
						        </button>
						      </div>
						      <div class="modal-body">
						       	지금 풀고 계신 페이지를 벗어나시면 퀴즈가 저장되지 않습니다. 나가시겠습니까?
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="btn btn-secondary" data-dismiss="modal">창 닫기</button>
						        <a href="${pageContext.request.contextPath }/classes/myanswer/delete/${quizDto.c_no}/${quizDto.q_no}" type="button" class="btn btn-primary">퀴즈 나가기</a>
						      </div>
						    </div>
						  </div>
						</div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>