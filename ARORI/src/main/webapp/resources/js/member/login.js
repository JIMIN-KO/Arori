// 참고 사이트
	// > http://blog.naver.com/PostView.nhn?blogId=wj8606&logNo=221206395970
		// 로그인
		function login(tag) {
	
			var tag = tag.id;
			var provider;
			
			if(tag == "google") {
				provider = new firebase.auth.GoogleAuthProvider();
			} else if(tag == "github") {
				provider = new firebase.auth.GithubAuthProvider();
			} else {
				window.location.href = "joinArori";
			}
			//인증서비스 제공업체설정
			
			//로그인창 호출
			firebase.auth().signInWithPopup(provider);
			
			//공식API 활용 예제
			firebase.auth().signInWithPopup(provider).then(function(result) {
				
				var emailPath = result.additionalUserInfo.providerId;
				var memberNick = result.user.displayName;
				var loginEmail = result.user.email;
				
				if(tag == "github") {
					var backup = loginEmail.indexOf("@")
					memberNick = loginEmail.substring(0,backup)
				}
				console.log(result); //
				
				axios({
					url:"/arori/nonMemberAjax/checkEmail?member_id=" + loginEmail,
					method:"get"
					}).then(function (resp) {

						if(resp.data === false) {

							// 회원가입 페이지로 이동

							window.location.href = "joinSocial?emailPath=" + emailPath + "&member_id=" + loginEmail + "&member_nick=" + memberNick;
							// 소셜 로그인 > 로그아웃 
							firebase.auth().signOut().then(function() {});
						} else {
							// 해당 소셜 아이디가 있을 경우 > 홈으로 
							window.location.href = "loginSuccess?member_id=" + loginEmail;
						}
					})
				  
			  var token = result.credential.accessToken;
			  var user = result.user;
	
			}).catch(function(error) {
			  var errorCode = error.code;
			  var errorMessage = error.message;
			  var email = error.email;
			  var credential = error.credential;
			});	
		}
		
		// 로그아웃
		function logout() {
			firebase.auth().signOut().then(function() {
				  // Sign-out successful.
				  console.log("로그아웃 성공")
				  window.location.href = "member/logout";
			}).catch(function(error) {
				  // An error happened.
			});
		}
		
		// 정보 가지고 오기
		firebase.auth().onAuthStateChanged(function(user) {
	
		});
	$(function(){
		// 아로리 회원 로그인 (비동기)
		$('#loginFail').modal('hide') // 모달 숨기기 
		$("#loginBtn").click(function(){
			var formData = $("#aroriLogin").serialize();
			
			axios({
				url: "/arori/nonMemberAjax/loginSuccess",
				method: "post",
				data: formData,
				processData: false,
	            contentType: false
			}).then(function(resp){
				if(!resp.data) {
					// console.log("로그인 실패!")
					$('#loginFail').modal('show') // 로그인 실패 시 모달 띄우기 
				} else {
					// console.log("로그인 성공!")
					if(resp.data.member_auth === 1) {
						window.location.href = "member/myPage";
					} else {
						window.location.href = "admin/main";
					}
					
					
				}
			})
		})
	})