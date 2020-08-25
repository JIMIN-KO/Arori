function clickTab(tag) {
            var id = tag.id;
            console.log(id);
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