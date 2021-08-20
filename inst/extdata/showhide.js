function showClass(theClass) {
	var classElements = document.getElementsByClassName(theClass)
	for(var i=0; i< classElements.length; i++) {
		classElements[i].style.display = "inline"
	}
}

function hideClass(theClass) {
	var classElements = document.getElementsByClassName(theClass)
	for(var i=0; i< classElements.length; i++) {
		classElements[i].style.display = "none"
	}
}
