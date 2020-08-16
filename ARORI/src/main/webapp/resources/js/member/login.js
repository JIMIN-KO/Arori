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
			
			axios({
				url:"${pageContext.request.contextPath}/memberAjax/checkEmail?member_id=" + loginEmail,
				method:"get"
				}).then(function (resp) {
					console.log(resp)
					if(!resp.data) {
						// 소셜 로그인 > 로그아웃 
						this.logout();
						
						// 회원가입 페이지로 이동 
						window.location.href = "joinSocial?emailPath=" + emailPath + "&member_id=" + loginEmail + "&member_nick=" + memberNick;
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
		}).catch(function(error) {
			  // An error happened.
		});
	}
	
	// 정보 가지고 오기
	firebase.auth().onAuthStateChanged(function(user) {

	});