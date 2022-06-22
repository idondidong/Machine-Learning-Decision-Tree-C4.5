<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="pl" xml:lang="pl">
<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	
	<meta name="author" content="Paweł 'kilab' Balicki - kilab.pl" />
	<title>Bayu TA</title>
	<!-- <link rel="stylesheet" type="text/css" href="css/login.css" media="screen" /> -->
	<link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.min.css" media="screen" />
	<link rel="stylesheet" type="text/css" href="main.css" media="screen" />
	<script type="text/javascript" src = "bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src = "bootstrap/js/jquery.js"></script>


	<script type="text/javascript">
		function validasi(form){
			if (form.user.value == "" & form.pass.value == ""){
				alert("Masukkan Username dan Password!");
				form.user.focus();
				return (false);
			} 
			if (form.user.value == ""){
				alert("Masukkan Username!");
				form.user.focus();
				return (false);
			}     
			if (form.pass.value == ""){
				alert("Masukkan Password!");
				form.pass.focus();
				return (false);
			}
			return (true);
		}
	</script>
	<style>
		.bayangan{
			font-size:27px; text-shadow:#fa5 10px 10px 5px;     
		}
	</style>
</head>
<body>
	<div class="container">
		<div class="container-fluid">
		
		<div class="loginpage">
		<center>
			<div>
			<span class="label label-info"><h2>Klasifikasi Penerima KIP SMA Cluring Banyuwangi</h2></span>
		</div>	
		</center>>
		
		<div class="wrap" >			
			<div class="login" >		
				<div class="">
					<form action="cekLogin.php" method="post" onSubmit="return validasi(this)">
						<div class="form-group">
							<label >Username :</label>
							<input id="user" name="user" class="text" placeholder="Username"/>	
						</div>
						
						<div class="form-group">
							<label >Password :</label>
							<input id="pass" name="pass" type="password" class="text" placeholder="Password"/>	
						</div>
						
						
							<center><button type="submit" class="btn btn-primary">Login</button></center>
					</form>
				</div>
				
			</div>
		</div>
	</div>
		</div>
	</div>
	
</body>
</html>
