console.log("Hello!");

var thePic = document.getElementById("pointerPic");
var secondPic = thePic.cloneNode(false);
var theDiv = document.getElementById("theDiv");
theDiv.appendChild(secondPic);

function switchPar(event){
	var hip1 = document.getElementById("hip1");
	var hip2 = document.getElementById("hip2");
	theDiv.insertBefore(hip2, hip1);
}

thePic.addEventListener("click", switchPar);