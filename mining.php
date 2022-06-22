<?php
	include "koneksi.php";
	$query=mysql_query("select * from data_training1 order by(id)");
	$jumlah=mysql_num_rows($query);	
	
	if($jumlah==0){
		echo "<center><h3>Data training masih kosong...</h3></center>";
	}else{
		
		if(isset($_POST['submit'])){
			include "proses_mining.php";
		}else{
			?>

			

			<center>
			<?php
			echo "<center><button type='button' class='btn btn-info'>Jumlah data training : ' ".$jumlah . "</button> </center></br>";
			?>
				<!-- Klik "ProsesMining!" untuk membentuk pohon keputusan...<br><br><br> -->
				<form method=POST action=''>		              				
					<input type=submit name=submit value= 'Proses C45' class="btn btn-success">
				</form>
				<br>
			</center>
			
			<table class="table table-condensed table-striped table-bordered">
				<tr align='center'>
					<th>No</th><th>Penghasilan Orangtua</th><th>Penerimaan KPS</th><th>Layak PIP</th><th>Jumlah Saudara</th><th><b>Penerima KIP</b></th>
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
						<td><?php echo $row['id'];?></td>			
						
						<td><?php echo $row['penghasilan_ortu'];?></td>
						<td><?php echo $row['penerimaan_kps'];?></td>
						<td><?php echo $row['layak_pip'];?></td>
						<td><?php echo $row['jumlah_saudara'];?></td>
						<td><b><?php echo $row['penerima_kip'];?></b></td>			
					</tr>
				<?php
					$no++;
				}
				?>
			</table>		
<?php
		}
	}		    	
?>