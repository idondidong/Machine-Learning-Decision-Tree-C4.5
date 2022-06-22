<?php

include "koneksi.php";
$query=mysql_query("SELECT * FROM data_uji1");
$id_rule=array(); $it=0;
while($bar=mysql_fetch_array($query)){
	//ambil data uji
	
	$n_po = $bar['penghasilan_ortu'];
	$n_pk = $bar['penerimaan_kps'];
	$n_lp = $bar['layak_pip'];
	$n_js = $bar['jumlah_saudara'];
	$n_pp = $bar['penerima_kip'];
			
	if ($n_pk == 'Tidak') {
		$keputusan = 'Tidak';
	} else if ($n_pk == 'Ya' && $n_lp == 'Tidak' ) {
		$keputusan = 'Ya';
	} else if ($n_pk == 'Ya' && $n_lp == 'Ya' && $n_po =='rendah') {
		$keputusan = 'Tidak';
	} else if ($n_pk == 'Ya' && $n_lp == 'Ya' && $n_po =='sedang') {
		$keputusan = 'Ya';
	} else if ($n_pk == 'Ya' && $n_lp == 'Ya' && $n_po =='tinggi') {
		$keputusan = 'Ya';
	} 
	
	// $sql=mysql_query("SELECT * FROM pohon_keputusan");	
	// $keputusan=""; 
	// while($row=mysql_fetch_array($sql)){				
	// 	//menggabungkan parent dan akar dengan kata AND
	// 	if($row[1]!=''){
	// 		$rule=$row[1]." AND ".$row[2];
	// 	}else{
	// 		$rule=$row[2];
	// 	}
	// 	//mengubah parameter
	// 	$rule=str_replace("<="," k ",$rule);
	// 	$rule=str_replace("="," s ",$rule);
	// 	$rule=str_replace(">"," l ",$rule);		
	// 	//mengganti nilai
	// 	$rule=str_replace("instansi","'$n_instansi'",$rule);
	// 	$rule=str_replace("status","'$n_status'",$rule);
	// 	$rule=str_replace("jurusan","'$n_jurusan'",$rule);
	// 	$rule=str_replace("rata_un","$n_rataUN",$rule);
	// 	$rule=str_replace("kerja","'$n_kerja'",$rule);
	// 	$rule=str_replace("motivasi","'$n_motivasi'",$rule);		
	// 	//menghilangkan '
	// 	$rule=str_replace("'","",$rule);
	// 	//menggabungkan kata ortu dan orang lain
	// 	$rule=str_replace("Orang Tua","OrangTua",$rule);
	// 	$rule=str_replace("Orang Lain","OrangLain",$rule);
	// 	//explode and
	// 	$explodeAND = explode(" AND ",$rule);
	// 	$jmlAND = count($explodeAND);				
	// 	//menghilangkan ()
	// 	$explodeAND=str_replace("(","",$explodeAND);
	// 	$explodeAND=str_replace(")","",$explodeAND);			
	// 	//deklarasi bol
	// 	$bolAND=array();
	// 	$n=0;
	// 	while($n<$jmlAND){
	// 		//explode or
	// 		$explodeOR = explode(" OR ",$explodeAND[$n]);
	// 		$jmlOR = count($explodeOR);	
	// 		//deklarasi bol
	// 		$bol=array();
	// 		$a=0;
	// 		while($a<$jmlOR){				
	// 			//pecah  dengan spasi
	// 			$exrule2 = explode(" ",$explodeOR[$a]);
	// 			$parameter = $exrule2[1];				
	// 			if($parameter=='s'){
	// 				//pecah  dengan s
	// 				$explodeRule = explode(" s ",$explodeOR[$a]);
	// 				//nilai true false						
	// 				if($explodeRule[0]==$explodeRule[1]){
	// 					$bol[$a]="Benar";
	// 				}else if($explodeRule[0]!=$explodeRule[1]){
	// 					$bol[$a]="Salah";
	// 				}
	// 			}else if($parameter=='k'){
	// 				//pecah  dengan k
	// 				$explodeRule = explode(" k ",$explodeOR[$a]);
	// 				//nilai true false
	// 				if($explodeRule[0]<=$explodeRule[1]){
	// 					$bol[$a]="Benar";
	// 				}else{
	// 					$bol[$a]="Salah";
	// 				}
	// 			}else if($parameter=='l'){
	// 				//pecah dengan s
	// 				$explodeRule = explode(" l ",$explodeOR[$a]);
	// 				//nilai true false
	// 				if($explodeRule[0]>$explodeRule[1]){
	// 					$bol[$a]="Benar";
	// 				}else{
	// 					$bol[$a]="Salah";
	// 				}
	// 			}				
	// 			$a++;
	// 		}
	// 		//isi false
	// 		$bolAND[$n]="Salah";
	// 		$b=0;			
	// 		while($b<$jmlOR){
	// 			//jika $bol[$b] benar bolAND benar
	// 			if($bol[$b]=="Benar"){
	// 				$bolAND[$n]="Benar";
	// 			}
	// 			$b++;
	// 		}			
	// 		$n++;
	// 	}
	// 	//isi boolrule
	// 	$boolRule="Benar";
	// 	$a=0;
	// 	while($a<$jmlAND){			
	// 		//jika ada yang salah boolrule diganti salah
	// 		if($bolAND[$a]=="Salah"){
	// 			$boolRule="Salah";
	// 		}						
	// 		$a++;
	// 	}		
	// 	if($boolRule=="Benar"){
	// 		$keputusan=$row['keputusan'];
	// 		$id_rule[$it]=$row['id'];
	// 	}
	// 	if($keputusan==''){
	// 		$que=mysql_query("SELECT parent FROM pohon_keputusan");				
	// 		$jml=array();
	// 		$exParent=array();
	// 		$i=0;
	// 		while($row_baris=mysql_fetch_array($que)){
	// 			$exParent=explode(" AND ",$row_baris['parent']);								
	// 			$jml[$i] = count($exParent);	
	// 			$i++;
	// 		}
	// 		$maxParent=max($jml);
	// 		$sql_query=mysql_query("SELECT * FROM pohon_keputusan");				
	// 		while($row_bar=mysql_fetch_array($sql_query)){
	// 			$explP=explode(" AND ",$row_bar['parent']);
	// 			$jmlT=count($explP);
	// 			if($jmlT==$maxParent){
	// 				$keputusan=$row_bar['keputusan'];
	// 				$id_rule[$it]=$row_bar['id'];
	// 			}
	// 		}
	// 	}		
	// }	
	// $it++;



	mysql_query("UPDATE data_uji1 SET prediksi='$keputusan' WHERE id=$bar[0]");		
}


//menampilkan data uji dengan hasil prediksi
$sql = mysql_query("SELECT * FROM data_uji1");	
?>
<table class="table table-condensed table-striped table-bordered">
	<tr align='center'>
		<th>No</th><th>Penghasilan Orangtua</th><th>Penerimaan KPS</th><th>Layak PIP</th><th>Jumlah Saudara</th><th><b>Penerima KIP</b></th><th><b>Prediksi ?</b></th>
	</tr>
<?php
	$warna1 = '#ffc';
	$warna2 = '#eea';
	$warna  = $warna1; 	
	$no=1;	
	while($row=mysql_fetch_array($sql)){
		if($warna == $warna1){ 
			$warna = $warna2; 
		} else { 
			$warna = $warna1; 
		} 			
		if($row['penerima_kip']==$row['prediksi']){
			$ketepatan="Benar";
		}else{
			$ketepatan="Salah";
		}
?>
		<tr align='center'>
			<td><?php echo $no;?></td>			
			
			<td><?php echo $row['penghasilan_ortu'];?></td>
			<td><?php echo $row['penerimaan_kps'];?></td>
			<td><?php echo $row['layak_pip'];?></td>
			<td><?php echo $row['jumlah_saudara'];?></td>
			<td><b><?php echo $row['penerima_kip'];?></b></td>					
			<td><b><?php echo $row['prediksi'];?></b></td>
			<!-- <td><?php echo $id_rule[$no-1];?></td> -->
			<!-- <td><?php if($ketepatan=='Salah'){ echo "<b>".$ketepatan."</b>"; }else{ echo $ketepatan; } ?></b></td> --> 
		</tr>
	<?php
		$no++;
	}
	?>
</table>

<?php
//perhitungan akurasi
$que = mysql_query("SELECT * FROM data_uji1");
$jumlah=mysql_num_rows($que);
$TP=0; $FN=0; $TN=0; $FP=0; $kosong=0;
while($row=mysql_fetch_array($que)){
	$asli=$row['penerima_kip'];
	$prediksi=$row['prediksi'];
	if($asli=='Ya' && $prediksi=='Ya'){
		$TP++;
	}else if($asli=='Ya' && $prediksi=='Tidak'){
		$FN++;
	}else if($asli=='Tidak' && $prediksi=='Tidak'){
		$TN++;
	}else if($asli=='Tidak' && $prediksi=='Ya'){
		$FP++;
	}else if($prediksi==''){
		$kosong++;
	}
}
$tepat=($TP+$TN);
$tidak_tepat=($FP+$FN+$kosong);
$akurasi= ($TP+$TN)/($TP+$TN+$FN+$FP)*100;
$presisi= $TP/($TP+$FP) *100;
$recall= $TP/($TP+$FN) *100;
// $laju_error=($tidak_tepat/$jumlah)*100;
// $sensitivitas=($TP/($TP+$FN))*100;
// $spesifisitas=($TN/($FP+$TN))*100;

$akurasi = round($akurasi,2);
$presisi = round($presisi,2);
$recall = round($recall,2);	
// $laju_error = round($laju_error,2);
// $sensitivitas = round($sensitivitas,2);	
// $spesifisitas = round($spesifisitas,2);	
// echo "<center><h4>";
// echo "Jumlah data yang diprediksi: $jumlah<br>";
// echo "Jumlah data yang diprediksi tepat: $tepat<br>";
// echo "Jumlah data yang diprediksi tidak tepat: $tidak_tepat<br>";
// if($kosong!=0){ echo "Jumlah data yang prediksinya kosong: $kosong<br></h4>"; }
// echo "<h2>AKURASI = $akurasi %<br>";
// echo "LAJU ERROR = $laju_error %<br></h2>";
// echo "<h4>TP: $TP | TN: $TN | FP: $FP | FN: $FN<br></h4>";
// echo "<h2>SENSITIVITAS = $sensitivitas %<br>";
// echo "SPESIFISITAS = $spesifisitas %<br>";
// echo "</h2></center>";
mysql_query("INSERT into cf values ('1','$TP','$FP','$TN','$FN','$akurasi','$presisi','$recall')");
?>