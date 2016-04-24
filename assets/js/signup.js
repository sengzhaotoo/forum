$(function(){
	$("#loginForm").submit(function(e){
		e.preventDefault();
		
		$.post("/assets/php/getUser.php", $(this).serialize())
			.success(function(response){
				if(response.error == 0){
					window.location.href = "/index.html"; 
				}else{
					alert("no user matched");
				}
			});
	});
	
	$("#signupForm").submit(function(e){
		e.preventDefault();
		
		$.post("/assets/php/saveUser.php", $(this).serialize())
			.success(function(response){
				if(response.error == 0){
					window.location.href = "/login.html";
				}else{
					alert("Failed to create a new user");
				}
			});
	});
});