<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>
<%@page contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.6.0/Chart.js"></script>
<div class="row mt-5">
	<div class="col-8 offset-2">
		<form action="adminUpdate" method="post" class="mt-3"
			onSubmit="return finalcheck();">
			<h1 class="font-weight-bold mt-4">회원정보 업데이트 페이지(관리자)</h1>
			<table class="table table-hover">
				<tbody>
					<tr>
						<span>변경할 수 있는 정보만 표시됩니다.</span>
					<tr>
						<th scope="col">AUTH</th>
						<td>
							<!-- member_auth = 1이면면서 member_nick에 admin이 포함하면 관리자 --> <c:if
								test="${fn:contains(allMemberDto.member_auth,'1') || fn:contains(allMemberDto.member_nick,'admin')}">
                  관리자               
                  </c:if> <c:if
								test="${fn:contains(allMemberDto.member_auth,'0')}">
                  일반회원            
                  </c:if> <select name="member_auth">
								<option value="0">일반회원</option>
								<option value="1">관리자</option>
						</select>
						</td>
					</tr>

					<tr>
						<th scope="col">ID</th>
						<td><input type="text" class="form-control" name="member_id"
							value="${allMemberDto.member_id}" readonly="readonly"></td>
					</tr>

					<tr>
						<th scope="col">MEMBER</th>
						<td><input type="text" class="form-control"
							name="member_state" value="${allMemberDto.member_state}"
							readonly="readonly"></td>
					</tr>
					
					<!-- --바꿀부분 --- -->
					<tr>
						<th scope="col">NICK</th>
						<td>
							<input type="text" class="form-control" id="nick" oninput="checkNick()" name="member_nick" value="${allMemberDto.member_nick}">
							<div class="text-danger" style="font-size: 14px;"></div>
						</td>
					</tr>
						<!-- --바꿀부분 --- -->
						
					<tr>
						<th scope="col">E-mail</th>
						<td><input type="text" class="form-control"
							value="${allMemberDto.member_email}" readonly="readonly"></td>
					</tr>
					<tr>
						<th scope="col">PHONE</th>
						<td><input type="text" class="form-control"
							value="${allMemberDto.member_phone}" readonly="readonly"></td>
					</tr>
					<tr>
						<th scope="col">JOIN</th>
						<td><input type="text" class="form-control"
							value="${allMemberDto.member_join}" readonly="readonly"></td>
					</tr>
					<tr>
						<th scope="col">LOGIN</th>
						<td><input type="text" class="form-control"
							value="${allMemberDto.member_login}" readonly="readonly"></td>
					<tr>
						<th scope="col">REPORT STATE</th>
						<td><select name="report_state" class="custom-select">
								<option selected="selected" disabled="disabled">${allMemberDto.report_state}</option>
								<option value="정상">정상</option>
								<option value="일시 정지">일시 정지</option>
								<option value="영구 정지">영구 정지</option>
								<option value="탈퇴">탈퇴</option>
						</select></td>
					</tr>
					<tr>
						<th scope="col">SUSPENSION</th>

						<td><input type="text" class="form-control" name="suspension"
							value="${allMemberDto.suspension}" placeholder="ex:2020-01-01">
							<span>변경 예 : 2020-01-01 (yyyy-mm-dd)</span></td>

					</tr>

					<tr>
						<td align="center"><button type="submit"
								data-target="#memberUpdateFail"
								class="btn btn-warning btn-lg font-weight-bold">수정</button>
							<a href="../allList/1"><input type="button" id="input"
								class="btn btn-primary btn-lg font-weight-bold" value="목록으로"></a></td>

					</tr>


				</tbody>
			</table>
		</form>
	</div>
</div>
<script>
	//모달 가리기
	$(function() {
		$("#memberUpdateFail").modal("hide")
	})
	//submit전에 회원가입 형식을 검사하는 함수  조건에 걸리면 모달을 보여줘라
	function finalcheck() {
		if (checkNick() == false) {
			$("#memberUpdateFail").modal("show") //회원가입양식 확인 하라는 모달 
			return false
		}
	}

	//닉네임 검사코드 
	function checkNick() {

		var regex = /^[가-힣a-zA-Z0-9]{2,10}$/g; //정규식:2~10자 한글,영어,숫자 사용가능 
		var input = document.querySelector("input[name=member_nick]"); //사용자가 input창에  입력한 값 
		var span = $("input[name=member_nick]").next()
		var isValid = regex.test(input.value); //입력한 아이디가 조건식에 맞는지 검사 
		var member_nick = input.value; //사용자가 입력한 값 
		var prohibition = "관리자"; //금지할 단어

		if (input.value === "${allmemberDto.member_nick}") { //사용자가 원래 쓰던 닉네임 입력시 
			$(span).text("현재와 동일 닉네임입니다.");
			return true;
		} else {
			if (input.value.indexOf(prohibition) != -1) { //금지단어를가지고 있다면 
				$(span).text("해당 닉네임은 관리자 전용입니다.");
				return false;

			} else {//금지하는 단어가 없을경우 정규표현식검사
				if (isValid) {//정상적인 이름인 경우  아이디 중복체크 

					axios(
							{
								url : "${pageContext.request.contextPath}/nonMemberAjax/checkOverlapNick?member_nick="
										+ member_nick,
								method : "get"
							}).then(function(resp) {
						console.log(resp)
						if (!resp.data) { //결과가 없다면 
							$(span).text("사용가능한 닉네임 입니다.");
							return true;

						} else {
							$(span).text("이미 사용중인 닉네임입니다.");
							return false;

						}
					});
				} else {//정규표현식 안맞으면
					$(span).text("2~10자 한글,영어,숫자만  공백없이 사용가능합니다.");
					return false;
				}
			}
		}
	}
	
	$("[name=report_state]").attr("required",false);
	$("[name=suspension]").attr("required",false);
	$("[name=member_auth]").attr("required",false);
	
</script>
<jsp:include
	page="/WEB-INF/views/template/admin/main_admin_nav_footer.jsp"></jsp:include>
