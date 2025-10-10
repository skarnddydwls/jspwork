function inputIdchk() {
	frm.idBtnCheck.value= "idUncheck";
}

function idCheck(id){
	frm.idBtnCheck.value = "idCheck";
	if(id == "") {
		alert("아이디를 입력하세요");
		frm.id.focus();
		return;
	}
	url= "idCheck.jsp?id="+id; // " " 안에 빈칸 있으면 안됨
	window.open(url, "IDCheck", "width=300, height=150");
}

function inputCheck(){
	if(frm.idBtnCheck.value != "idCheck"){
		alert("아이디 중복체크를 해주세요");
		return; 
	}
	if(frm.pwd.value == ""){
		alert("비밀번호를 입력해 주세요");
		frm.pwd.focus();
		return;
	}
	if(frm.repwd.value == ""){
		alert("비밀번호를 한번 더 입력해 주세요");
		frm.repwd.focus();
		return;
	}
	if(frm.pwd.value != frm.repwd.value){
		alert("비밀번호가 일치하지 않습니다");
		return;
	}
	if(frm.name.value ==""){
		alert("이름을 입력해주세요");
		frm.name.focus();
		return;
	}
	frm.submit();
}
