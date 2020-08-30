	$(function(){
		
		$('#findIdModal').modal('hide')
		$('#findPwModal').modal('hide')
	})
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
			// console.log(formData);
	
			axios({
				url: "/arori/nonMemberAjax/findId",
				method: "post",
				data: formData,
				processData: false,
	            contentType: 'application/json; charset=utf-8'
			}).then(function(resp){
				console.log(resp.data);
				var idResult = document.querySelector("#idResult");
	
				idResult.textContent = "";
				
				if(resp.data) {
					var h5 = document.createElement("h5");
					h5.textContent = resp.data;
					idResult.appendChild(h5);
				}
				$('#findIdModal').modal('show')
			})
			
		}
	
		function findPw() {
			var formData = $("#goPw").serialize();
			// console.log(formData);
	
			axios({
				url: "/arori/nonMemberAjax/findPw",
				method: "post",
				data: formData,
				processData: false,
				contentType: 'application/json; charset=utf-8'
			}).then(function(resp) {
				console.log(resp.data);
				var pwResult = document.querySelector("#pwResult");
				pwResult.textContent = "";

				if(resp.data) {
					var h5 = document.createElement("h5");
					h5.textContent = resp.data;
					pwResult.appendChild(h5);
				}
	
				$('#findPwModal').modal('show')
			})
		}