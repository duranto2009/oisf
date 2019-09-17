function activateMenu(menuId,submenuId,submenuId2){
	console.log("main menu: "+ menuId +" submenu1 :" +submenuId +" submenu2: "+ submenuId2)
	if(typeof menuId!=='undefined'&& menuId.trim()){
		$("#"+menuId.trim()).addClass("start active open");
		console.log(menuId +" is activated.." );
	}
	if(typeof submenuId!=='undefined'&& submenuId.trim()){
		$("#"+submenuId.trim()).addClass("start active open");
		console.log(submenuId.trim() +"(submenu1) is activated.." );
	}
	else if(typeof submenuId2!=='undefined'&& submenuId2.trim()){
		$("#"+submenuId2.trim()).addClass("start active open");
		console.log(submenuId2.trim() +"(submenuId2) is activated.." );
	}
}

String.prototype.replaceAt=function(index, character) {
	return this.substr(0, index) + character + this.substr(index+character.length);
}

function getDigitBanglaFromEnglish(builder){
	var banglaDigits = ['০','১','২','৩','৪','৫','৬','৭','৮','৯'];
	if(builder==null)
		return "";
	for(var i=0;i<builder.length;i++){
		if(builder.charAt(i)>='0' && builder.charAt(i)<='9'){
			builder=builder.replaceAt(i,banglaDigits[builder.charCodeAt(i)-48]);
		}
	}
	return builder;
}