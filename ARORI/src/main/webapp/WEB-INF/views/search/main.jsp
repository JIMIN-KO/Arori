<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:choose>
   <c:when test="${userinfo.member_auth eq 1 }">
      <jsp:include page="/WEB-INF/views/template/admin/main_admin_nav_header.jsp"></jsp:include>   
   </c:when>
   <c:otherwise>
      <jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
   </c:otherwise>
</c:choose>   
<style>
	/* 전체 카드 */
	.card-deck {
		padding-bottom: 40px;
		margin-top: 35px;
	}
	
   /* 이미지 사이즈 */
   .card-img {
   height: 200px;
   width: 100%;
   }
   
   /* 드롭다운 */
   #searchOption, .select-down{
      margin-top: 10px;
      width: 100px;
      height: 35px;
      font-size: 15px;
      color: #999;
      border: 2px solid #ddd;
      appearance: none;
      -webkit-appearance: none;
      text-align-last: center;
   }
    #keyword {
      margin-top: 10px;
      width: 200px;
      height: 35px;
      font-size: 15px;
      color: #999;
      border: 2px solid #ddd;
      appearance: none;
      -webkit-appearance: none;
      text-align-last: center;
    }
   /* 버튼 */
   #search {
      width:70px;
      height: 35px;
      background-color: #F5C159;
      border: 2px solid #F5C159;
      color: #fff;
   }
   
   /* 검색 아웃라인 지우기 */
   #searchOption:focus {
   outline: none;
   }
   #keyword:focus {
   outline:none;
   }
   
   .select-down {
   outline: none;
   }
   
   /* 클래스 제목 링크 색상 제거 */
   a {
   text-decoration: none;
   }
   .btn a {
   text-decoration: none;
   color:#ffffff;
   }
   
   /* 클래스 타이틀 */
   .title {
   text-decoration: none;
   color:black;
   }
   
   /* 클래스 정보 */
   .card-info {
   max-height:4.5em;
   white-space: nowrap;
   overflow: hidden;
   text-overflow: ellipsis;
   display: -webkit-box;
   -webkit-line-clamp: 3;
   -webkit-box-orient: vertical;
   text-decoration: none;
   color:#3e3e3e;
   }
   
   /* 카드 버튼 */
   .btn {
   display:inline-block;
   font-size:15px;
   margin-bottom:0px;
   margin-top:0px;
   }
   .card-btn {
   text-align:center;
   }
   
   /* 수정 버튼 */
   .editClass {
   width: 120px;
    left: 40px;
    bottom: 15px;
   }
   
   /* 삭제버튼 */
   .delete {
   width: 120px;
    bottom: 15px;
   }
   
</style>
<div class="row content-top mt-5 h-100">
   <div class="col-12 overflow-auto p-0">
      <!-- 본문 내용 -->
      <div class="ml-3 mr-3 mt-5">
         <!-- 검색창 -->
         <div class="row searchBox">
            <div class="col-12" style="text-align:center">
               <!-- 검색 분류 -->
               <select name="searchOption" id="searchOption">
                  <option value="member_nick">작성자</option>
                  <option value="c_title">클래스</option>
               </select>
   
               <!-- 검색어 -->
               <input type="text" name="keyword" id="keyword">
   
               <!--검색 버튼 -->
               
               <input type="button" value="Search" id="search" > 
   
               <select name="col"  id="colSelector" class="select-down">
                  <option value="c_when">최신순</option>
                  <option value="c_when_old">등록순</option>
                  <option value="c_subscribe">인기순</option>
               </select>
            </div>
         </div>
         
         <!--  클론 시작 -->
            <div class="col-sm-12 col-md-6 col-lg-3 cardList" style="display: none;">
                  <div class="card-deck">
                       <div class="card">
                          <a>
                           <img class="card-img">      
                        </a>
                        		<div class="row">
								<div class="col-12 d-flex justify-content-end position-absolute p-0 ml-2" style="top: 35%; right: 3%;">
									<a data-target="#imgEdit" class="imgEdit" data-cno="">
										<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-gear-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="width:30px; height:30px; color: lightgray;">
										  <path fill-rule="evenodd" d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 0 0-5.86 2.929 2.929 0 0 0 0 5.858z"/>
										</svg>
									</a>
								</div>
							</div> 
                           <div class="card-body pb-0">
                              <input type="hidden" class="card-no">
                              <div class="title h4">
                                 <span class="card-title font-weight-bold title h4" style="font-size: 21px;!important"></span>
                                 <span class="badge badge-pill badge-success ml-2 mb-1"></span>
                              </div>
                              	<hr>
                              <p class="card-info mt-4"></p>
                              <p class="card-nick mb-0 font-weight-bold">
                                 
                              </p>
                              <p class="card-when mb-0">
                                 <small class="text-muted">
                              </small>
                           </p>
                          </div> 
                          		<form method="post" class="mb-3 blockForm" style="display:none; !important">
                                    <span class="d-flex justify-content-center">
                                       <input type="button" class="btn btn-link btn-md" style="font-size:14px; cursor: default; margin:0px;">   
                                    </span>
                                 </form> 
                             <div class="row mt-5">
                              <div class="col-6">
                                 <button type="button" class="btn btn-primary btn-sm editClass btn-block" data-target="#classEdit" style="font-size:14px">EDIT</button>
                              </div>
                              <div class="col-6">
                                 <a class="btn btn-warning btn-sm btn-block delete" style="font-size:14px">DELETE</a>
                              </div>
                           </div>
                             <form method="post" class="d-flex justify-content-center mb-3 mt-3 blockSub">
                              <span class="card-btn d-flex justify-content-center">
                                 <input type="hidden" name="c_no" class="subC_no">
                                 <input type="button" class="btn btn-primary btn-md subBtn" value="구독" style="font-size:14px">   
                              </span>
                           </form>                  
                          </div>
                      </div>
                  </div>
               <!--  여기까지 클론 -->
               
         <div class="row classCard w-100 m-0">
            <c:forEach var="MCIDto" items="${MCIDto}">
               <div class="col-sm-12 col-md-6 col-lg-3 cardList">
                  <div class="card-deck">
                       <div class="card">
                          <a href="${pageContext.request.contextPath }/classes/readme/${MCIDto.c_no}">
                           <c:choose>
                              <c:when test="${MCIDto.ai_no > 0}">
                                 <img src="${pageContext.request.contextPath }/imgAjax/classes/download/${MCIDto.ai_no }" class="card-img">
                              </c:when>
                              <c:otherwise>
                                 <img src="${pageContext.request.contextPath }/imgAjax/classes/download/57" class="card-img">
                              </c:otherwise>
                           </c:choose>            
                        </a>
                        		<c:if test="${userinfo.member_auth eq 1 }">
                        		<div class="row">
								<div class="col-12 d-flex justify-content-end position-absolute p-0 ml-2" style="top: 35%; right: 3%;">
									<a data-target="#imgEdit" class="imgEdit" data-cno="${MCIDto.c_no }">
										<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-gear-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="width:30px; height:30px; color: lightgray;">
										  <path fill-rule="evenodd" d="M9.405 1.05c-.413-1.4-2.397-1.4-2.81 0l-.1.34a1.464 1.464 0 0 1-2.105.872l-.31-.17c-1.283-.698-2.686.705-1.987 1.987l.169.311c.446.82.023 1.841-.872 2.105l-.34.1c-1.4.413-1.4 2.397 0 2.81l.34.1a1.464 1.464 0 0 1 .872 2.105l-.17.31c-.698 1.283.705 2.686 1.987 1.987l.311-.169a1.464 1.464 0 0 1 2.105.872l.1.34c.413 1.4 2.397 1.4 2.81 0l.1-.34a1.464 1.464 0 0 1 2.105-.872l.31.17c1.283.698 2.686-.705 1.987-1.987l-.169-.311a1.464 1.464 0 0 1 .872-2.105l.34-.1c1.4-.413 1.4-2.397 0-2.81l-.34-.1a1.464 1.464 0 0 1-.872-2.105l.17-.31c.698-1.283-.705-2.686-1.987-1.987l-.311.169a1.464 1.464 0 0 1-2.105-.872l-.1-.34zM8 10.93a2.929 2.929 0 1 0 0-5.86 2.929 2.929 0 0 0 0 5.858z"/>
										</svg>
									</a>
								</div>
							</div>
							</c:if>
                           <div class="card-body pb-0">
                              <input type="hidden" value="${MCIDto.c_no}" class="card-no">
                              <div class="title h4">
                                 <span style="font-size: 21px;!important" class="card-title h4 title font-weight-bold" >${MCIDto.c_title}</span>
                                 <span class="badge badge-pill badge-success ml-2 mb-1">${MCIDto.c_subscribe }</span>
                              </div>
                              	<hr>
                              <p class="card-info mt-4">${MCIDto.c_info}</p>
                              <p class="card-nick mb-0 font-weight-bold">
                                 <c:choose>
                                    <c:when test="${MCIDto.member_nick eq 'null'}">
                                       소셜 회원
                                    </c:when>
                                    <c:otherwise>
                                       ${MCIDto.member_nick}                                
                                    </c:otherwise>
                                 </c:choose>
                              </p>
                              <p class="card-when mb-0">
                                 <small class="text-muted">
                                    <fmt:parseDate value="${MCIDto.c_when}" var="time" pattern="yyyy-MM-dd HH:mm:ss"/>
                                 <fmt:formatDate value="${time}" pattern="yyyy-MM-dd"/>
                              </small>
                           </p>
                          </div>
                          	<c:if test="${MCIDto.member_no == userinfo.member_no}">
                          		<form method="post" class="d-flex justify-content-center mb-3 mt-3">
                                    <span class="d-flex justify-content-center">
                                       <input type="button" class="btn btn-link btn-md" style="font-size:14px; cursor: default; margin:0px;">   
                                    </span>
                                 </form>
                          	</c:if>
                        <c:choose>                  
                           <c:when test="${userinfo.member_auth eq 1 }">
                              <div class="row mt-5">
                                 <div class="col-6">
                                    <button type="button" class="btn btn-primary btn-sm editClass btn-block" data-target="#classEdit" style="font-size:14px">EDIT</button>
                                 </div>
                                 <div class="col-6">
                                    <a href="${pageContext.request.contextPath}/classes/delete/${MCIDto.c_no}" class="btn btn-warning btn-sm btn-block delete" style="font-size:14px">DELETE</a>
                                 </div>
                              </div>                              
                           </c:when>               
                           <c:when test="${MCIDto.member_no != userinfo.member_no}">
                                 <form method="post" class="d-flex justify-content-center mb-3 mt-3 blockSub">
                                    <span class="card-btn d-flex justify-content-center">
                                       <input type="hidden" name="c_no" class="subC_no" value="${MCIDto.c_no }">
                                       <input type="button" class="btn btn-primary btn-md subBtn" value="구독" style="font-size:14px" data-target="#subModal">   
                                    </span>
                                 </form>
                           </c:when>
                        </c:choose>
                       </div>
                   </div>
               </div>
            </c:forEach>
         </div>
      </div>
   </div>
</div>               
<script>
	
   $(function() {
	  $("#subModal").modal("hide") // 모달 수정 모달 숨김
		$("#imgEdit").modal("hide") // 이미지 수정 모달 숨김
		
		// 이미지 수정 모달 띄우기
		$(document).on("click",".imgEdit",function(){
			$("#imgEdit").modal("show"); // 클래스 수정 모달 띄우기
			var c_no = $(this).data("cno")
			$("#imgEditC_no").val(c_no)
		})
		
		// 이미지 수정하기
		$("#goimgEdit").click(function(){
			var form = document.querySelector("#addImg")
			var file = document.querySelector("input[name=req]")
			
			if(file.value) {
				$(form).submit()
			} else {
				alert("현재 이미지가 없거나 등록할 수 없습니다. 다시 확인해주세요.")
			}
		})
	  
      // 구독 기능
      $(document).on("click",".subBtn",function(){
         var subDto = {
               member_no:${userinfo.member_no},
               c_no:$(this).parents(".card-btn").children("input[name=c_no]").val()
         }
         var path = $(this).parents(".card").children(".card-body").children(".title").children(".badge")
         	
         axios.post("/arori/subAjax/subscribe", JSON.stringify(subDto), {
             headers:{
               'content-type':'application/json',
             }
          }).then(resp=>{
			var msg
			if($(path).text() < resp.data) {
				msg = '구독이 완료되었습니다.'
			} else {
				msg = '구독이 취소되었습니다.'
			}
             $(path).text(resp.data)
                $(".subModalBody").text(msg)
             $("#subModal").modal("show") // 모달 수정 모달 숨김
			})
      })
      
      var backup = $(".cardList").first().clone()
      $("#search").click(function() {
         searchClass(backup)
      })
      
      $(".select-down").on("change",function(){
         searchClass(backup)
      })
      
   })
   
   function searchClass(backup) {
      var keyword = $("#keyword").val()
      var searchOption = $("#searchOption").val()
      var select = $(".select-down").val()
      var list = document.querySelector(".card")
      axios({
         url : '${pageContext.request.contextPath}/searchAjax/search?keyword=' + keyword + '&searchOption=' + searchOption + "&col=" + select,
         method : 'get'
      }).then(function(resp) {
         // 기존에 있던 카드 삭제
         document.querySelector(".classCard").innerHTML = "";
         
         // 검색된 데이터만큼 카드 생성
         for (var i = 0; i < resp.data.length; i++) {
            var clone = backup.clone() // 클론을 검색된 데이터 길이만큼 복제
            $(clone).css("display","block") // 복제한 데이터 디스플레이 block
            
            // 검색된 클래스 만큼 반복 및 카드 생성
            $(".classCard").append(clone)
            
            addCard(resp, i)            
         }
      })
   }
   
   function addCard(resp, i) {
      var cardList = document.querySelectorAll(".cardList")
      
      // 이미지
      var img = $(cardList[i+1]).children(".card-deck").children(".card").children("a").children("img")
      var path = "/arori/imgAjax/classes/download/" + resp.data[i].ai_no
      
      if(resp.data[i].ai_no == 0) {
         path = "/arori/imgAjax/classes/download/57"
      }
      
      $(img).attr("src",path)
      
      // classesURL
      var classesURL = $(cardList[i+1]).children(".card-deck").children(".card").children("a")
      var imgPath = "${pageContext.request.contextPath }/classes/readme/" + resp.data[i].c_no
      $(classesURL).attr("href",imgPath)
      
      // c_no
      var c_no = $(cardList[i+1]).children(".card-deck").children(".card").children(".card-body").children(".card-no")
      $(c_no).val(resp.data[i].c_no)
      $(cardList[i+1]).find(".imgEdit").data("cno",resp.data[i].c_no)
      
      // title
      var title = $(cardList[i+1]).children(".card-deck").children(".card").children(".card-body").children(".title").children(".card-title")
      $(title).text(resp.data[i].c_title)
      
      // subscribe
      var sub = $(cardList[i+1]).children(".card-deck").children(".card").children(".card-body").children(".title").children(".badge")
      $(sub).text(resp.data[i].c_subscribe)
      
      // info
      var info = $(cardList[i+1]).children(".card-deck").children(".card").children(".card-body").children(".card-info")
      $(info).text(resp.data[i].c_info)
   
      // nick
      var nick = $(cardList[i+1]).children(".card-deck").children(".card").children(".card-body").children(".card-nick")
      $(nick).text(resp.data[i].member_nick)
      
      // when
      var when = $(cardList[i+1]).children(".card-deck").children(".card").children(".card-body").children(".card-when").children(".text-muted")
      var c_when = resp.data[i].c_when.substring(0,10)
      $(when).text(c_when)
      
      // 구독 button
      var subbuttonVal = $(cardList[i+1]).children(".card-deck").children(".card").children("form").children(".card-btn").children(".subC_no")
      var subbutton = $(cardList[i+1]).children(".card-deck").children(".card").children("form").children(".card-btn").children("span").children(".subBtn")
      var member_no = ${userinfo.member_no}

      
      // 수정 삭제 button
      var editbutton = $(cardList[i+1]).children(".card-deck").children(".card").children(".row").children(".col-6").children(".editClass")
      var deletebutton = $(cardList[i+1]).children(".card-deck").children(".card").children(".row").children(".col-6").children(".delete")
    
     	 $(editbutton).css("display","none")
         $(deletebutton).css("display","none")
      	$(subbutton).css("display","none")
      	
      	// 구독 버튼
      if((member_no != resp.data[i].member_no) && (${userinfo.member_auth == 0})) {
         $(subbutton).css("display","block")
         $(subbuttonVal).val(resp.data[i].c_no)
         $(cardList[i+1]).children(".card-deck").children(".card").children(".row").css("display","none")
       }

      // 삭제 수정 버튼
      if(${userinfo.member_auth == 1}) {
         $(editbutton).css("display","block")
         $(deletebutton).css("display","block")
         $(".blockSub").removeClass("mb-3").removeClass("mt-3")
         $(".blockForm").css("display","none")
      }
   }
   
   $(function() {
      $("#classEdit").modal("hide") // 클래스 수정 모달 숨김
      $(document).on("click",".editClass", function(){
         $("#classEdit").modal("show"); // 클래스 수정 모달 띄우기
         var c_no = $(this).parents(".card").children(".card-body").children(".card-no").val()
         var c_title = $(this).parents(".card").children(".card-body").children(".title").children(".card-title").text()
         var c_info = $(this).parents(".card").children(".card-body").children(".card-info").text()

         $("input[name=c_no]").val(c_no)
         $("input[name=c_title]").val(c_title) // 모달에 타이틀 데이터 던지기
         $("textarea[name=c_info]").val(c_info) // 모달에 인포 데이터 던지기   
      })
      
      // 수정하기 버튼을 누르면 수정이 되도록 한다!
      $("#goEdit").click(function() {
         var form = document.querySelector("#editForm")
         form.submit()
      })
   
   })
   
</script>

   <jsp:include page="/WEB-INF/views/template/member/main_member_nav_footer.jsp"></jsp:include>
  	
<!-- 클래스 수정 모달 -->
<div class="modal fade" id="classEdit" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">클래스 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath }/classes/edit" method="post" id="editForm">
						<input type="hidden" name="c_no" id="c_no">
						<input type="hidden" name="member_no" value="${userinfo.member_no }"> 
						<div class="form-group">
						    <label for="c_title" class="h5 font-weight-bold">Class Title</label>
						    <input type="text" class="form-control edit-title" id="c_title"  name="c_title">
						    <small id="emailHelp" class="form-text text-muted">클래스 이름은 20자 이내로 작성해주세요.</small>
						  </div>
						  <div class="form-group">
						    <label for="c_info" class="h5 font-weight-bold">Class Info</label>
						    <textarea id="c_info" class="form-control edit-info" name="c_info"></textarea>
						        <small id="emailHelp" class="form-text text-muted">클래스 정보는 한 줄로 간략하게 작성해주세요.</small>
						  </div>			
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning btn-lg font-weight-bold" id="goEdit">수정하기</button>
					<button type="button" class="btn btn-primary btn-lg font-weight-bold" data-dismiss="modal">창 닫기</button>
				</div>
			</div>
		</div>
	</div>


<!-- 구독 모달 -->
<div class="modal fade" id="subModal" tabindex="-1" aria-hidden="true">
   <div class="modal-dialog">
      <div class="modal-content">
         <div class="modal-header">
            <h5 class="modal-title font-weight-bold" id="exampleModalLabel">구독</h5>
            <button type="button" class="close" data-dismiss="modal"
               aria-label="Close">
               <span aria-hidden="true">&times;</span>
            </button>
         </div>
         <div class="modal-body subModalBody">
         </div>            
         <div class="modal-footer">
            <button type="button" class="btn btn-primary" data-dismiss="modal">창 닫기</button>
         </div>
      </div>
   </div>
</div>

<!-- 이미지 수정 모달 -->
<div class="modal fade" id="imgEdit" tabindex="-1" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">클래스 이미지 수정</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form action="${pageContext.request.contextPath }/classes/img/setting" method="post" enctype="multipart/form-data" id="addImg">
						<input type="hidden" name="c_no" id="imgEditC_no">
						<input type="file" accept=".jpg, .png, .jpeg" name="req">
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning btn-lg font-weight-bold" id="goimgEdit">수정하기</button>
					<button type="button" class="btn btn-primary btn-lg font-weight-bold" data-dismiss="modal">창 닫기</button>
				</div>
			</div>
		</div>
</div>