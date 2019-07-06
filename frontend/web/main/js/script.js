var dark=false;
function changeTheme(){
	if(!dark){
		document.getElementById("body").classList.add("dark");
		dark=true;
	}else{
		document.getElementById("body").classList.remove("dark");
		dark=false;
	}
}