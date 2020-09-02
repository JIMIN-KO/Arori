<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/member/main_member_nav_header.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_header.jsp"></jsp:include>
                    <div class="offset-1 null-side null-side2"></div>                        
                    <div class="col-9 overflow-auto" style="border-right: 1px solid rgba(190, 190, 190, 0.493);">
                    	<br>
                        <div class="d-flex">
	                        <h1 class="font-weight-bold mt-4" style="flex:18;">Notice</h1>
							<a href="${pageContext.request.contextPath }/classes/notice/create/${c_no}">
					            <button class="btn btn-link mt-4" style="flex:0.3; color: gray;">
						            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-pencil-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
										<path fill-rule="evenodd" d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708l-3-3zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207l6.5-6.5zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.499.499 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11l.178-.178z"/>
									</svg>
					            </button>
			                </a>
                        </div>
                    	<hr><br>
                    	<!-- 본문 내용 -->
                    	<div class="ml-3 mr-3">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col" class="font-weight-bold">No</th>
                                        <th scope="col" class="font-weight-bold">Title</th>
                                        <th scope="col" class="font-weight-bold">Date</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th scope="row">1</th>
                                        <td>
                                            <label for="title1">
                                                정보처리기사 필기 시험 족보 공지 안내
                                            </label>
                                            <input type="radio" name="title" id="title1">
                                        </td>
                                        <td>2020.09.01</td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <div class="viewer"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">2</th>
                                        <td>
                                            <label for="title2">
                                                정보처리기사 필기 시험 족보 공지 안내
                                            </label>
                                            <input type="radio" name="title" id="title2">
                                        </td>
                                        <td>2020.09.01</td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <div class="viewer"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">3</th>
                                        <td>
                                            <label for="title3">
                                                정보처리기사 필기 시험 족보 공지 안내
                                            </label>
                                            <input type="radio" name="title" id="title3">
                                        </td>
                                        <td>2020.09.01</td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <div class="viewer"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">4</th>
                                        <td>
                                            <label for="title4">
                                                정보처리기사 필기 시험 족보 공지 안내
                                            </label>
                                            <input type="radio" name="title" id="title4">
                                        </td>
                                        <td>2020.09.01</td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <div class="viewer"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">5</th>
                                        <td>
                                            <label for="title5">
                                                정보처리기사 필기 시험 족보 공지 안내
                                            </label>
                                            <input type="radio" name="title" id="title5">
                                        </td>
                                        <td>2020.09.01</td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <div class="viewer"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">6</th>
                                        <td>
                                            <label for="title6">
                                                정보처리기사 필기 시험 족보 공지 안내
                                            </label>
                                            <input type="radio" name="title" id="title6">
                                        </td>
                                        <td>2020.09.01</td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <div class="viewer"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">7</th>
                                        <td>
                                            <label for="title7">
                                                정보처리기사 필기 시험 족보 공지 안내
                                            </label>
                                            <input type="radio" name="title" id="title7">
                                        </td>
                                        <td>2020.09.01</td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <div class="viewer"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">8</th>
                                        <td>
                                            <label for="title8">
                                                정보처리기사 필기 시험 족보 공지 안내
                                            </label>
                                            <input type="radio" name="title" id="title8">
                                        </td>
                                        <td>2020.09.01</td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <div class="viewer"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">9</th>
                                        <td>
                                            <label for="title9">
                                                정보처리기사 필기 시험 족보 공지 안내
                                            </label>
                                            <input type="radio" name="title" id="title9">
                                        </td>
                                        <td>2020.09.01</td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <div class="viewer"></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">10</th>
                                        <td>
                                            <label for="title10">
                                                정보처리기사 필기 시험 족보 공지 안내
                                            </label>
                                            <input type="radio" name="title" id="title10">
                                        </td>
                                        <td>2020.09.01</td>
                                    </tr>
                                    <tr>
                                        <td colspan="5">
                                            <div class="viewer"></div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                  <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Previous">
                                      <span aria-hidden="true">&laquo;</span>
                                    </a>
                                  </li>
                                  <li class="page-item"><a class="page-link" href="#">1</a></li>
                                  <li class="page-item"><a class="page-link" href="#">2</a></li>
                                  <li class="page-item"><a class="page-link" href="#">3</a></li>
                                  <li class="page-item">
                                    <a class="page-link" href="#" aria-label="Next">
                                      <span aria-hidden="true">&raquo;</span>
                                    </a>
                                  </li>
                                </ul>
                              </nav>
                        </div>
                    </div>
<jsp:include page="/WEB-INF/views/template/member/member_classes_viewer_footer.jsp"></jsp:include>
<script>
	const content = ['# 첫 번째 공지사항','## 중요사항이니 모두들 읽어주세요!','### 안읽는 당신! 뭐하는건가!','#### 웃기는 짬뽕 아가씨~','','![image](https://pbs.twimg.com/profile_images/1147451112082907136/vFrE8I5p.png)','','## 오늘의 해야할 일!','* [ ] 공지 게시글 작성 기능','* [ ] 공지 게시판 리스트 긁어오기','* [ ] 페이지 네이션','* [ ] 공지 게시글 수정'].join('\n')
	var viewers = document.querySelectorAll(".viewer")
	for(var i = 0; i < viewers.length; i++) {
	    console.log(viewers[i])
	    const viewer = toastui.Editor.factory({
	        el: viewers[i],
	        viewer: true,
	        height: '1000px',
	        initialValue: content,
	        initialEditType: 'markdown'
	    });
	}
	
	// 공지사항 내용 띄우기
	$(function(){
	    // 라디오 숨김
	    $("input[type=radio]").css("display","none")
	    // 공지 제목 커서 변경
	    $("input[type=radio]").prev().css("cursor","pointer")
	    // 공지 게시물 본문 숨김
	    $("input[type=radio]").parent().parent().next().css("display","none")
	    // 공지 게시물 id 삭제
	    $("input[type=radio]").parent().parent().next().children().children().removeAttr("class")
	
	    $("input[type=radio]").change(function(){
	        $("input[type=radio]").parent().parent().next().css("display","none")
	        $("input[type=radio]").parent().parent().next().children().children().removeAttr("class")
	                        
	        $(this).parent().parent().next().css("display","table-row")
	        $(this).parent().parent().next().children().children().attr("class","viewer")
	    })
	})
</script>
<jsp:include page="/WEB-INF/views/template/member/member_classes_nav_footer.jsp"></jsp:include>