console.log("Hello!");

var thePic = document.getElementById("pointerPic");
var secondPic = thePic.cloneNode(false);
var theDiv = document.getElementById("theDiv");
theDiv.appendChild(secondPic);