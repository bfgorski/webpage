
/**
 * Set the given elements value as the Date()
 */
function setDate(elemId) {
	document.getElementById(elemId).innerHTML=Date();
}

function showAlert(message) {
	alert(message);
}

function setTime(elemId) {
	document.getElementById(elemId).innerHTML=Date.getTime();
}

function setElementHTML(elemId, html) {
	document.getElementyById(elemtId).innerHTML=html;
}