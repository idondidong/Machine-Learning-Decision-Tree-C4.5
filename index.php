<?php
    session_start();
    if (!isset($_SESSION['usr'])){
        header("location:login.php");
    }
?>
<!DOCTYPE html>

<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>BAYU TA</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="bootstrap/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="main.css"/>
    <script type="text/javascript" src="bootstrap/js/jquery.js"></script>
    <script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
<div class="page-header">
  

	<div class="container">
		<div class="container-fluid">
		<div>
			

								<?php
				$level=$_SESSION['lvl'];
				//jika user kaprodi
				if($level=='0'){
					echo " <center>
					<a href='?menu=home' accesskey='0'><button type='button' class='btn btn-primary'>Home</button></a>

					<a href='?menu=data' accesskey='1'><button type='button' class='btn btn-primary '>Olah Data Training</button></a>
							
						<a href='?menu=mining' accesskey='2' ><button type='button' class='btn btn-primary'>Mining C45</button></a>
							<a href='?menu=tree' accesskey='3'><button type='button' class='btn btn-primary'>Pohon Keputusan</button></a>
							<a href='?menu=confusion' accesskey='4' ><button type='button' class='btn btn-primary'>Confusion Matrix</button></a>
							<a href='?menu=reset' accesskey='6' ><button type='button' class='btn btn-warning'>Reset</button></a>
							<a href='logout.php' accesskey='5' ><button type='button' class='btn btn-warning'>Logout</button></a>" 
							. " ". "<button type='button' class='btn btn-warning'>Selamat Datang : ".$_SESSION['usr'] . "</button> </center>";


							
				}
				//jika user mahasiswa
				else{
					echo "<li class='first'><a href='?menu=home' accesskey='1' title='Home'>Home</a></li>
							<li><a href='?menu=prediksi' accesskey='prediksi' title='Prediksi Prestasi'>Prediksi</a></li>							
							<li><a href='?menu=tree' accesskey='tree' title='Rule Pohon Keputusan'>Pohon Keputusan</a></li>";
				}
			?>

	

	<!-- <div id="wrapper" class="container">
		
		<h4 align="right">							
			<?php echo "User ID : ".$_SESSION['usr']." | Nama : ".$_SESSION['nama']." | "; ?>
			<a href='?menu=ubah_password' accesskey='5' title='Change password' >Ubah Password</a> | 
			<a href='logout.php' accesskey='5' title='Log Out' onClick="return confirm('Anda yakin akan keluar?')">Log Out</a>
		</h4> -->	
			</div>
									
					<p>																		
						<?php
						//jika menu sudah diset
						if (isset($_GET['menu'])) {
							$kode=$_GET['menu'];
							//menu home
							if($kode=='home'){
								echo "<center>HOME</center>";
								echo "<center>
									<br><br>
									Bayu Maeki <br> 
									Teknik Informatika <br>
									Universitas Muhammadiyah Jember <br>
									<br>

									Penerapan Algoritma C45 dalam rekomendasi pemberian KIP -  
									Kartu Indonesia Pintar pada Siswa SMA PGRI Cluring Banyuwangi
									</center>";
							}
							//menu olah data
							else if ($kode=='data'){
								// echo "<center>OLAH DATA</center><br><br>";
								echo "</br>";
								include 'data_training.php';
							}
							//menu mining (proses pembentukan pohon keputusan)
							else if($kode=='mining'){
								// echo "<strong><center>MINING</center></strong><br><br>";
								echo "</br>";
								include 'mining.php';
							}
							//menu pohon keputusan atau rule
							else if($kode=='tree'){
								echo "</br>";
								// echo "<strong><center>POHON KEPUTUSAN</center></strong><br><br>";
								include 'tree.php';
							}
							//menu pohon tree2
							else if($kode=='pohon_tree'){
								echo "</br>";
								// echo "<strong><center>POHON KEPUTUSAN</center></strong><br><br>";
								include 'pohon_tree.php';
							}
							//menu uji pohon keputusan atau rule
							else if($kode=='uji_rule'){
								echo "</br>";
								// echo "<strong><center>UJI Pohon Keputusan</center></strong><br><br>";
								include 'uji_rule.php';
							}
							//menu hasil prediksi
							else if($kode=='confusion'){
							echo "</br>";	
								// echo "<strong><center>HASIL PREDIKSI</center></strong><br><br>";
								include 'confusion.php';
							}
							//menu data user
							else if($kode=='reset'){		
								// echo "<strong><center>DATA USER</center></strong><br><br>";
								include 'reset.php';
							}
							//menu prediksi
							else if($kode=='prediksi'){
								// echo "<strong><center>PREDIKSI</center></strong><br><br>";
								include 'prediksi.php';
							}
							//menu ubah password
							else if($kode=='ubah_password'){
								echo "<strong><center>UBAH PASSWORD</center></strong><br><br>";
								include 'ubah_password.php';
							}
						}
						//jika menu belum diset
						else{
							echo "<h4><center>HOME</center></h4><br>";
							echo "<center>
									
									Penerapan Algoritma C45 dalam rekomendasi pemberian KIP -  
									Kartu Indonesia Pintar pada Siswa SMA PGRI Cluring Banyuwangi
									</center>";
						}
						?>						
					</p>
				</div>
			</div>
			</div>
		
			
	

							
							
				
	
	
		
		
	<!-- <div id="banner"> <img src="images/url.jpg" width="940" height="200" alt="" /> </div> -->
	
	
	
		

	<div id="footer">
			<center><p>&copy; 2018 Bayu Maeki - UMJ</p></center>
		</div>
</body>
</html>



	
	

	<!--<script language="JavaScript">
		var txt=" | Sistem Prediksi Prestasi Akademik Mahasiswa (SPPAM) | ";
		var kecepatan=200;
		var segarkan=null;
		function bergerak() { 
			document.title=txt;
			txt=txt.substring(1,txt.length)+txt.charAt(0);
			segarkan=setTimeout("bergerak()",kecepatan);
		}bergerak();
	</script>-->
	<!-- <style>
		.bayangan{
			font-size:27px; text-shadow:#fa5 10px 10px 9px;     
		}
	</style> -->
	<!-- <meta name="keywords" content="" /> -->
	<!-- <meta name="description" content="" /> -->
	<!-- <link href="http://fonts.googleapis.com/css?family=Archivo+Narrow:400,700" rel="stylesheet" type="text/css" />
	<link href="css/default.css" rel="stylesheet" type="text/css" media="all" /> -->
	<!--[if IE 6]>
	<link href="default_ie6.css" rel="stylesheet" type="text/css" />
	<![endif]-->

