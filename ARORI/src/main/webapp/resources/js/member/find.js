	function findAccount(tag) {
            var id = tag.id;
            // console.log(id);

            var tag1 = document.querySelector("#tabfindId");
            var tag2 = document.querySelector("#tabfindPw");
            tag1.classList.remove("bg-warning");
            tag1.classList.remove("text-white");
            tag2.classList.remove("bg-warning");
            tag2.classList.remove("text-white");
            var selectRadio = document.getElementById("tab" + id);
            selectRadio.classList.add("bg-warning");
            selectRadio.classList.add("text-white");
            // selectRadio.setAttribute("class","btn-warning");

            var findId = document.querySelector(".findId");
            var findPw = document.querySelector(".findPw");
            findId.style.display = "none";
            findPw.style.display = "none";

            var viewFind = document.getElementById("select" + id);
            // console.log(viewFind);
            viewFind.style.display = "block";
    }
	
	function findId() {
		var formData = $("#goId").serialize();
		console.log(formData);

		axios({
			url: "/arori/nonMemberAjax/findId",
			method: "post",
			data: formData,
			processData: false,
            contentType: false
		}).then(function(resp){
			console.log(resp);
			var idResult = document.querySelector("#idResult");

			idResult.textContent = "";
			
			var h3 = document.createElement("h3");
			h3.textContent = "Your ID > " + resp.data;

			idResult.appendChild(h3);
		})
		
	}

	function findPw() {
		var formData = $("#goPw").serialize();
		console.log(formData);

		axios({
			url: "/arori/nonMemberAjax/findPw",
			method: "post",
			data: formData,
			processData: false,
			contentType: false
		}).then(function(resp) {
			console.log(resp.data);
			var pwResult = document.querySelector("#pwResult");
			pwResult.textContent = "";

			var h3 = document.createElement("h3");
			h3.textContent = "임시 비밀번호 발급 완료";
			var h4 = document.createElement("h4");
			h4.textContent = resp.data + " > 임시 비밀번호를 회원님의 이메일로 발급했습니다.";

			pwResult.appendChild(h3);
			pwResult.appendChild(h4);
		})
	}