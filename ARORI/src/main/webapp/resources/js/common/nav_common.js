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
                $("").remo
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