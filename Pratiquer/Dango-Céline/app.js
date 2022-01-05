// Write your JS in here
var pics = [
	"imgs/dango_cook.jpeg",
	"imgs/dango_hamac.jpeg", 
	"imgs/dango_poubelle.jpeg",
	"imgs/dango_rayure.jpeg",
	"imgs/dango_sleep.jpeg",
	"imgs/dango_tako.jpeg"
]

var btn = document.querySelector("button");
var img = document.querySelector("img");
var counter = 1;

btn.addEventListener("click", function(){
	img.src = pics[counter]
	counter += 1
	if (counter == 6) {
		counter = 0
	}
});