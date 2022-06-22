<?php
	include "koneksi.php";
	if(isset($_GET['act'])){
		$action=$_GET['act'];
		$id=$_GET['id'];
		//update data training
		if($action=='update'){
			include "update_data_training.php";
		}
		//delete data training
		else if($action=='delete'){
			mysql_query("DELETE FROM data_training WHERE id = '$id'");
			header('location:index.php?menu=data');
		}
		//delete semua data
		else if($action=='delete_all'){
			mysql_query("TRUNCATE data_training");
			header('location:index.php?menu=data');
		}		
	}else{
		include "form_data_training.php";
		$query=mysql_query("select * from data_training1 order by(id)");
		$jumlah=mysql_num_rows($query);	
	?>
		<!-- <br><br><br>
		<p>
			<form method="post" enctype="multipart/form-data" action="upload.php?data=training">
				Opsi: <a href="index.php?menu=data&act=delete_all" onClick="return confirm('Anda yakin akan hapus semua data?')">Hapus Semua Data</a> | 
				Import data excel: <input name="userfile" type="file">
				<input name="upload" type="submit" value="import">
			</form>
		</p>	 -->
	<?php		
		if($jumlah==0){
			echo "<center><h3>Data training masih kosong...</h3></center>";
		}else{
			echo "<center><button type='button' class='btn btn-info'>Jumlah data training : ' ".$jumlah . "</button> </center></br>";

	?>			
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
						<td><?php echo $no;?></td>			
						
						<td><?php echo $row['penghasilan_ortu'];?></td>
						<td><?php echo $row['penerimaan_kps'];?></td>
						<td><?php echo $row['layak_pip'];?></td>
						<td><?php echo $row['jumlah_saudara'];?></td>
						<td><b><?php echo $row['penerima_kip'];?></b></td>
						<!-- <td>
							<a href="index.php?menu=data&act=update&id=<?php echo $row['id']; ?>">Update | </a>	
							<a href="data_training.php?act=delete&id=<?php echo $row['id']; ?>" onclick="return confirm('Apakah anda yakin akan menghapus data?')">Delete</a>	
						</td> -->
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