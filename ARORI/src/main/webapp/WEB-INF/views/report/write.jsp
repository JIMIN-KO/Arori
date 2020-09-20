<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Arori | 불량 회원 신고하기</title>
<!-- Bootstrap -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
</head>
<body>
	<div class="card mt-3 mb-3 ml-3 mr-3">
         <div class="card-header h3 bg-danger text-white">불량 회원 신고하기</div>
         <div class="card-body">
            <blockquote class="mb-0">
               <p>건전한 운영을 위해 회원아이디로 운영되고 있습니다.</p>
               <p>게시판 취지와 관련이 없는 글 등은 관리자에 의해 통보없이 삭제되거나 관리자에 의해 접수됩니다.</p>
            </blockquote>
         </div>
      </div>


      <form action="${pageContext.request.contextPath }/report/write" method="post" id="report" class="ml-3 mr-3">
         <table class="table table-hover">
            <tbody>
               <tr>
                  <th scope="col">REPORT_MEMBER</th>
                  <td><input type="text" name="report_member"
                     class="form-control" value="${userinfo.member_id}" readonly="readonly"></td>
               </tr>
               <tr>
                  <th scope="col">REPORT TYPE</th>
                  <td><select name="report_type" required="required"
                     class="custom-select">
                        <option value="유언비어" selected="selected">유언비어</option>
                        <option value="욕설">욕설</option>
                        <option value="불법 광고">불법 광고</option>
                        <option value="저작권">저작권</option>
                        <option value="기타">기타</option>
                  </select></td>
               </tr>

               <tr>
                  <th scope="col">REPORT CONTENT</th>
                  <td ><textarea name="report_content"
                     
                        placeholder="게시판의 취지와 부합하지 않는 상업성 광고, 정치적 목적,

특정기관·단체·특정인에 대한 비난이나 비방, 반복적 게시물, 기타 불건전한 내용 등은 관리자에 의해 통보 없이 삭제될 수 있습니다." style="height:300px"
                        class="form-control"></textarea></td>
               </tr>

               <tr>
                  <th scope="col">REPORT CRIMI MEMBER</th>
                  <td>
                  		<input type="text" name="report_crimi" class="form-control" placeholder="신고할 아이디" value="${memberDto.member_id }" readonly="readonly">
                   </td>
               </tr>

               <tr>
                  <td colspan="2" class="text-center">
                  <input type="submit" class="btn btn-warning btn-lg font-weight-bold ml-3 mr-3 text-white" value="신고접수" id="ok">
                  	<input type="button" class="btn btn-primary btn-lg font-weight-bold ml-3 mr-3" value="취소하기" onclick="javascript:window.close()">
                  </td>
               </tr>
            </tbody>
         </table>
      </form>
</body>
</html>