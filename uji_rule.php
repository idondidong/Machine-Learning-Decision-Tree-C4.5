<?php

	include "koneksi.php";
	if(isset($_GET['act'])){
		$action=$_GET['act'];		
		//delete semua data
		if($action=='delete_all'){
			mysql_query("TRUNCATE data_uji");
			header('location:index.php?menu=uji_rule');
		}		
	}else{				
		if(isset($_POST['submit'])){
			include "hitung_akurasi.php";
		}else{
			$query=mysql_query("SELECT * FROM data_uji1 order by(id)");
			$jumlah=mysql_num_rows($query);	
			echo "<br><br>";				
			if($jumlah==0){
			?>											
				<!-- <p> 					 
					<form method="post" enctype="multipart/form-data" action="upload.php?data=uji">
						Opsi: <a href="?menu=uji_rule&act=delete_all" onClick="return confirm('Anda yakin akan hapus semua data?')">Hapus Semua Data</a> | 
						Import data excel: <input name="userfile" type="file">
						<input name="upload" type="submit" value="import">
					</form>
				</p> -->
			<?php
				echo "<center><h3>Data uji masih kosong...</h3></center>";
			}else{
				?>											
				<!-- <p> 					 
					<form method="post" enctype="multipart/form-data" action="upload.php?data=uji">
						Opsi: <a href="?menu=uji_rule&act=delete_all" onClick="return confirm('Anda yakin akan hapus semua data?')">Hapus Semua Data</a> | 
						Import data excel: <input name="userfile" type="file">
						<input name="upload" type="submit" value="import">
					</form>
				</p>
			 -->
				<center>
					<form method=POST action=''>		              				
						<input type=submit name=submit value="Uji Pohon Keputusan" class="btn btn-success">
					</form>			
				</center>
				Jumlah data uji: <?php echo $jumlah; ?>
		
				<table class="table table-condensed table-striped table-bordered">
					<tr align='center'>
						<th>No</th><th>Penghasilan Orangtua</th><th>Penerimaan KPS</th><th>Layak PIP</th><th>Jumlah Saudara</th><th><b>Penerima KIP</b></th><th><b>Prediksi ?</b></th>	
					</tr>
				<?php
					$warna1 = '';
					$warna2 = '';
					$warna  = $warna1; 	
					$no=1;
					while($row=mysql_fetch_array($query)){
						if($warna == $warna1){ 
							$warna = $warna2; 
						} else { 
							$warna = $warna1; 
						} 			
				?>
						<tr align='center'>
							<td><?php echo $no;?></td>			
						
						<td><?php echo $row['penghasilan_ortu'];?></td>
						<td><?php echo $row['penerimaan_kps'];?></td>
						<td><?php echo $row['layak_pip'];?></td>
						<td><?php echo $row['jumlah_saudara'];?></td>
						<td><b><?php echo $row['penerima_kip'];?></b></td>
						<td></td>				
						</tr>
					<?php
						$no++;
					}
					?>
				</table>
		<?php
			}
		}
	}
?>