        function clickTab(tag) {
            var id = tag.id;
            // console.log(id);
            var selectTag = document.getElementById("icon" + id);
            var selectLi = document.getElementById(id);
            var thisTap = document.querySelector(".click2");

            if(id != "click2") {
                thisTap.classList.remove("fadeInLeft");
                thisTap.classList.add("fadeOutLeft");
            }

            for(var i = 1; i <= 3; i++) {
                var clickTab = document.getElementById("iconclick" + i);
                var clickLi = document.getElementById("click" + i);
                clickTab.classList.remove("menu-images-2");
                clickLi.classList.remove("li-background");
            }

            selectTag.classList.add("menu-images-2");
            selectLi.classList.add("li-background");
            
            if(id === "click2") {
                thisTap.classList.add("fadeInLeft");
                thisTap.classList.remove("off");
                thisTap.classList.remove("fadeOutLeft");
            }
        }

        $(function(){
            $(".hamburger").click(function(){
                // console.log("안녕!")
                $(".main-nav-container").toggleClass("active")
                $(".sub-nav").removeClass("fadeOutLeft")
                $(".sub-nav").removeClass("fadeInLeft")
                $(".sub-nav").addClass("off")
                $(".hamburger").toggleClass("active")
                $(".backbtn").toggleClass("active")
            })

            $(".backbtn").click(function(){
                $(".main-nav-container").toggleClass("active")
                $(".sub-nav").addClass("fadeOutLeft")
                $(".sub-nav").removeClass("fadeInLeft")
                $(".hamburger").toggleClass("active")
                $(".backbtn").toggleClass("active")
            })
		$(window).click(function(){
            	if($(window).width()>992){
            		$(".main-nav-container").removeClass("active")
            		$(".hamburger").removeClass("active")
            		$(".backbtn").removeClass("active")
            		setTimeout(function(){
            			$(".main-body").removeClass("transition")
            		}, 300)
            	} else {
            		setTimeout(function(){
            			$(".main-body").addClass("transition")
            		}, 300)
                }
            })
        })