
// Main Globals
gMagellan = gMagellan || {
	
};

function setTitle(newTitle)
{
	document.getElementById("title").innerHTML=newTitle;
}

function mainLoad()
{
alert("Page Load");
setTitle("Hello Ben");
}

function mainUnLoad()
{
alert("Page UnLoad")
}

