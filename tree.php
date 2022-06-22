<?php

	include "koneksi.php";	    			
	if(isset($_GET['act'])){
		$action=$_GET['act'];
		$id=$_GET['id'];
		if($action=='delete'){
			mysql_query("TRUNCATE pohon_keputusan");
			header('location:index.php?menu=tree');
		}
	}		
	$query=mysql_query("select * from aturan order by(id)");
	$jumlah=mysql_num_rows($query);	

	

	//jika pohon keputusan kosong
	if($jumlah==0){
		

	}else{
		if($_SESSION['lvl']=='0'){
			
		}
		echo "Jumlah rule : ".$jumlah."<br>";
		//hanya kaprodi yang bisa menghapus pohon keputusan dan menguji akurasi
		if($_SESSION['lvl']=='0'){
	?>				
			 
				<!-- <a href="?menu=tree&act=delete" onClick="return confirm('Anda yakin akan hapus pohon keputusan?')">Hapus Pohon Keputusan</a> |  -->
				<!-- <a href="?menu=pohon_tree" >Lihat Pohon Keputusan</a> |  -->
				<a href="?menu=uji_rule" ><button type="button" class="btn btn-success">Uji Rule</button></a>
				<br><br>
			
		<?php
		}else if($_SESSION['lvl']=='1'){
			echo "<a href=\"?menu=pohon_tree\" >Lihat Pohon Keputusan</a>";
		}
		?>
		<table class="table table-bordered table-striped">
			<tr align='center'>
				<th>Id</th><th>Aturan</th>
			</tr>
		<?php	
			$warna1 = '#ffc';
			$warna2 = '#eea';
			$warna  = $warna1; 	
			$no=1;
			while($row=mysql_fetch_array($query)){
				if($warna == $warna1){ 
					$warna = $warna2; 
				} else { 
					$warna = $warna1; 
				} 		
			?>
				<tr  >
					<td align='center'><?php echo $row['id'];?></td>
					<td><?php echo $row['aturan']; ?></td>			
					<!-- <td><?php 
						echo "IF ";
						if($row['parent']!=''){
							echo $row['parent']." AND ";
						}
						echo $row['akar']." THEN Prestasi = ".$row['keputusan'];?>
					</td> -->								
				</tr>
			<?php
				$no++;
			}
			?>
		</table>
	<?php				
	}	
	?>
		