function switchDetails(buchungsid){
	detail = document.getElementById("detail" + buchungsid);
	if(detail.className == "unsichtbar"){
		detail.className = "";
	}else{
		detail.className ="unsichtbar";
	}
}