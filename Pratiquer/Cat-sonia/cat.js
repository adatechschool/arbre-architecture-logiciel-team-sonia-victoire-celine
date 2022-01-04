let pics = [
    "imgs/max1.jpg",
    "imgs/max2.jpg",
    "imgs/max3.jpg",
    "imgs/max4.jpg",
    "imgs/max5.jpg",
    "imgs/max6.jpg",
    "imgs/max7.jpeg",
    "imgs/max8.jpg"
];

let btn = document.querySelector("button");
let img = document.querySelector("img");
let counter = 1;

btn.addEventListener("click", function(){
    if(counter === 8){
        counter = 0;
    }
   img.src =  pics[counter]
   counter = counter + 1;
});




