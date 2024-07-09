var randomText = "";

	$(function(){
		
		$("#findID").click(function(){
			$("#pw").hide();
			$("#id").show();
		});
		
		$("#findPW").click(function(){
			$("#id").hide();
			$("#pw").show();
		});
		
		$("#idFindBtn").click(function(){
			if(chkData()){
				chkInputData();
			}
		});
		
		$("#pwFindBtn").click(function(){
			if(chkPwData()){
				chkInputDataPW();
			}
		});
		
		$("#chkNumBtn").click(function(){
			var inputText = $("#code").val();
			
			if(inputText != randomText){
				alert("인증문자가 일치하지 않습니다");
				return;
			}else if(inputText == randomText){
				$("#findIdFrm").submit();
			}
		});
		
		$("#chkNumBtn_pw").click(function(){
			var inputText = $("#code_pw").val();
			
			if(inputText != randomText){
				alert("인증문자가 일치하지 않습니다");
				return;
			}else if(inputText == randomText){
				$("#findPwFrm").submit();
			}
		});
		
		
	});//ready
	
	function chkInputData(){
		var name = $("#nameID").val();
		var email_id = $("#email_id").val();
		var email_domain = $("#email_domain").val();
		var email = email_id + "@" + email_domain;
		
		$.ajax({
			url: "http://localhost/meonggae_prj/My/acount/dataChk.do",
			type: "POST",
			data: {
				name : name,
				email : email
				},
			dataType: "JSON",
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			success: function(data){
				if(data.result == "true"){
					alert("이메일로 인증번호가 전송되었습니다.");
					$("#codeDiv").show();
					$("#chkNumBtn").show();
					randomText = data.randomText;
					$("#finalName").val(name);
					$("#finalEmail").val(email);
				}
				if(data.result == "false"){
					alert("입력하신 정보에 해당하는 계정 정보가 존재하지 않습니다.\n정보를 확인해주세요.");
				}
				
			}//success
		});//ajax
		
	}//chkInputData
	
	function chkInputDataPW(){
		var name = $("#namePW").val();
		var id = $("#idPW").val();
		
		var email_id = $("#email_id_pw").val();
		var email_domain = $("#email_domain_pw").val();
		var email = email_id + "@" + email_domain;
		
		$.ajax({
			url: "http://localhost/meonggae_prj/My/acount/dataPwChk.do",
			type: "POST",
			data: {
				name : name,
				id : id,
				email : email
				},
			dataType: "JSON",
			error: function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			},
			success: function(data){
				if(data.result == "true"){
					alert("이메일로 인증번호가 전송되었습니다.");
					$("#codePwDiv").show();
					$("#chkNumBtn_pw").show();
					randomText = data.randomText;
					$("#finalId_pw").val(id);
				}
				if(data.result == "false"){
					alert("입력하신 정보에 해당하는 계정 정보가 존재하지 않습니다.\n정보를 확인해주세요.");
				}
				
			}//success
		});//ajax
		
	}//chkInputDataPW
	
	//아이디 입력창 검증
	function chkData(){
		if($("#nameID").val() == ""){
			alert("이름을 입력해주세요");
			$("#nameID").focus();
			return;
		}
		
		var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email_id = $("#email_id").val();
		var email_domain = $("#email_domain").val();
		var mail ="";
			
		if(!email_id){
			alert("이메일을 입력해주세요");
			$("#email_id").focus();
			return false;
		}
		if(!email_domain){
			alert("도메인을 입력해주세요");
			$("#email_domain").focus();
			return false;
		}
		
		mail = email_id+"@"+email_domain;
		
		if(!email_rule.test(mail)){
			alert("이메일을 형식에 맞게 입력해주세요.");
			return false;
		}
		
		return true;
	}//chkData
	
	//비밀번호 입력창 검증
	function chkPwData(){
		if($("#namePW").val() == ""){
			alert("이름을 입력해주세요");
			$("#namePW").focus();
			return;
		}
		
		if($("#idPW").val() == ""){
			alert("아이디를 입력해주세요");
			$("#idPW").focus();
			return;
		}
		
		var email_rule =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		var email_id = $("#email_id_pw").val();
		var email_domain = $("#email_domain_pw").val();
		var mail ="";
			
		if(!email_id){
			alert("이메일을 입력해주세요");
			$("#email_id_pw").focus();
			return false;
		}
		if(!email_domain){
			alert("도메인을 입력해주세요");
			$("#email_domain_pw").focus();
			return false;
		}
		
		mail = email_id+"@"+email_domain;
		
		if(!email_rule.test(mail)){
			alert("이메일을 형식에 맞게 입력해주세요.");
			return false;
		}
		
		return true;
	}//chkPwData
	
	function setEmailDomain(domain){
		$("#email_domain").val(domain);
	}//setEmailDomain
	
	function setEmailDomain1(domain){
		$("#email_domain_pw").val(domain);
	}//setEmailDomain