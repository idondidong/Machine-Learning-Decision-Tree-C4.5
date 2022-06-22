<?php
	include "koneksi.php";
	if(isset($_GET['act'])){
		$action=$_GET['act'];
		$id=$_GET['id'];
		
	}else{
		
		$query=mysql_query("select * from cf order by(id)");
		$jumlah=mysql_num_rows($query);	
	?>
		
	<?php		
		if($jumlah==0){
			echo "<center><h3>Data training masih kosong...</h3></center>";
		}else{
			// echo "<center><button type='button' class='btn btn-info'>Jumlah data training : ' ".$jumlah . "</button> </center></br>";

	?>			
			<table class="table table-condensed table-striped table-bordered">
				<tr align='center'>
					<th>True Positive</th><th>False Positive</th><th>True Negative</th><th>False Negative</th>
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
									
						<td><?php echo $row['TP'];?></td>
						<td><?php echo $row['FP'];?></td>
						<td><?php echo $row['TN'];?></td>
						<td><?php echo $row['FN'];?></td>
											
					</tr>
					<br>
			</table> <br>
			<table class="table table-bordered">
				<tr>
					<th>Akurasi</th>
					
					<td><?php echo $row['akurasi']."%";?></td>
				</tr>
				<tr>
					<th>Presisi</th>
					
					<td><?php echo $row['presisi']."%";?></td>
				</tr>
				<tr>
					<th>Recall</th>
					
					<td><?php echo $row['recall']."%";?></td>
				</tr>
			</table>	
			
				<?php
					$no++;


				}

				?>
			

			


<?php
		}
	}
?>