<?php
	$awal = microtime(true); 
	include 'koneksi.php';
	include 'fungsi.php';
	mysql_query("TRUNCATE pohon_keputusan");	
	pembentukan_tree("","");
	echo "<br><h1><center>---PROSES SELESAI---</center></h1>";
	echo "<center><a href='index.php?menu=tree' accesskey='5' title='pohon keputusan'><button type='button' class='btn btn-success'>Lihat Pohon Keputusan Yang Terbentuk</button></a></center>";
	
	$akhir = microtime(true);
	$lama = $akhir - $awal;
	//echo "<br>Lama eksekusi script adalah: ".$lama." detik";
		
	
	//fungsi utama
	function proses_DT($parent , $kasus_cabang1 , $kasus_cabang2){	
		// echo "cabang 1<br>";
		pembentukan_tree($parent , $kasus_cabang1);		
		// echo "cabang 2<br>";
		pembentukan_tree($parent , $kasus_cabang2);		
	}		
	
	function pangkas($PARENT, $KASUS, $LEAF){
		//PEMANGKASAN CABANG
		$sql_pangkas = mysql_query("SELECT * FROM pohon_keputusan WHERE parent=\"$PARENT\" AND keputusan=\"$LEAF\"");
		$row_pangkas = mysql_fetch_array($sql_pangkas);
		$jml_pangkas = mysql_num_rows($sql_pangkas);
		//jika keputusan dan parent belum ada maka insert
		if($jml_pangkas==0){			
			mysql_query("INSERT INTO pohon_keputusan (parent,akar,keputusan)VALUES (\"$PARENT\" , \"$KASUS\" , \"$LEAF\")");
		}
		//jika keputusan dan parent sudah ada maka delete
		else{			
			mysql_query("DELETE FROM pohon_keputusan WHERE id='$row_pangkas[0]'");
			
			$exPangkas = explode(" AND ",$PARENT);
			$jmlEXpangkas = count($exPangkas);
			$temp=array();
			for($a=0;$a<($jmlEXpangkas-1);$a++){
				$temp[$a]=$exPangkas[$a];
			}
			$imPangkas = implode(" AND ",$temp);
			$akarPangkas = $exPangkas[$jmlEXpangkas-1];
			
			$que_pangkas = mysql_query("SELECT * FROM pohon_keputusan WHERE parent=\"$imPangkas\" AND keputusan=\"$LEAF\"");
			$baris_pangkas = mysql_fetch_array($que_pangkas);
			$jumlah_pangkas = mysql_num_rows($que_pangkas);
			
			if($jumlah_pangkas==0){		
				mysql_query("INSERT INTO pohon_keputusan (parent,akar,keputusan)VALUES (\"$imPangkas\" , \"$akarPangkas\" , \"$LEAF\")");
				//mysql_query("UPDATE pohon_keputusan SET parent=\"$imPangkas\" , akar=\"$akarPangkas\" , keputusan=\"$LEAF\" WHERE id=\"$row_pangkas[0]\"");
			}else{
				pangkas($imPangkas,$akarPangkas,$LEAF);
			}								
		}
		// echo "Keputusan = ".$LEAF."<br>================================<br>";		
	}
	
	//fungsi proses dalam suatu kasus data
	function pembentukan_tree($N_parent , $kasus){
		//mengisi kondisi
		if($N_parent!=''){
			$kondisi = $N_parent." AND ".$kasus;
		}else{
			$kondisi = $kasus;
		}		
		// echo $kondisi."<br>";
		//cek data heterogen / homogen???
		$cek = cek_heterohomogen('penerima_kip',$kondisi);		
		if($cek=='homogen'){
			// echo "<br>LEAF ";
			$sql_keputusan = mysql_query("SELECT DISTINCT(penerima_kip) FROM data_training1 WHERE $kondisi");
			$row_keputusan = mysql_fetch_array($sql_keputusan);	
			$keputusan = $row_keputusan['0'];
			//insert atau lakukan pemangkasan cabang
			pangkas($N_parent , $kasus , $keputusan);
			
		}//jika data masih heterogen
		else if($cek=='heterogen'){
			//cek jumlah data
			$jumlah = jumlah_data($kondisi);				
			if($jumlah<8){
				// echo "<br>LEAF ";
				$Nya = $kondisi." AND penerima_kip='Ya'";
				$Ntidak = $kondisi." AND penerima_kip='Tidak'";
				$jumlahya = jumlah_data("$Nya");
				$jumlahtidak = jumlah_data("$Ntidak");				
				if($jumlahya <= $jumlahtidak){
					$keputusan = 'Tidak';
				}else{
					$keputusan = 'Ya';
				}				
				//insert atau lakukan pemangkasan cabang
				pangkas($N_parent , $kasus , $keputusan);		
			}
			//lakukan perhitungan
			else{			
				//jika kondisi tidak kosong kondisi_ipk=tambah and
				$penerima_kip='';
				if($kondisi!=''){
					$penerima_kip=$kondisi." AND ";
				}
				$jml_ya = jumlah_data("$penerima_kip penerima_kip='Ya'");
				$jml_tidak = jumlah_data("$penerima_kip penerima_kip='Tidak'");
				$jml_total = $jml_ya + $jml_tidak;
				// echo "Jumlah data = ".$jml_total."<br>";
				// echo "Jumlah Ya = ".$jml_ya."<br>";
				// echo "Jumlah Tidak = ".$jml_tidak."<br>";
				
				//hitung entropy semua
				$entropy_all = hitung_entropy($jml_ya , $jml_tidak);
				// echo "Entropy = ".$entropy_all."<br>";
				
				//cek berapa nilai setiap atribut
											
				

				$nilai_po = array();
				$nilai_po = cek_nilaiAtribut('penghasilan_ortu',$kondisi);								
				$jmlpo = count($nilai_po);

				$nilai_pk = array();
				$nilai_pk = cek_nilaiAtribut('penerimaan_kps',$kondisi);								
				$jmlpk = count($nilai_pk);

				$nilai_lp = array();
				$nilai_lp = cek_nilaiAtribut('layak_pip',$kondisi);								
				$jmllp = count($nilai_lp);

				$nilai_js = array();
				$nilai_js = cek_nilaiAtribut('jumlah_saudara ',$kondisi);								
				$jmljs = count($nilai_js);				
							
			//hitung gain atribut
				mysql_query("TRUNCATE gain");
				//jenis kelamin
				
				
				//penghasilan ortu
				if($jmlpo!=1){
					$NA1po="penghasilan_ortu='$nilai_po[0]'";
					$NA2po="";
					$NA3po="";
					if($jmlpo==2){
						$NA2po="penghasilan_ortu='$nilai_po[1]'";
					}else if ($jmlpo==3){
						$NA2po="penghasilan_ortu='$nilai_po[1]'";
						$NA3po="penghasilan_ortu='$nilai_po[2]'";
					}
					hitung_gain($kondisi , "penghasilan_ortu" , $entropy_all , $NA1po, $NA2po, $NA3po, "" , "");
				}
				//penerimaan_kps
				if($jmlpk!=1){
					$NA1pk="penerimaan_kps='$nilai_pk[0]'";
					$NA2pk="penerimaan_kps='$nilai_pk[1]'";
					hitung_gain($kondisi , "penerimaan_kps" , $entropy_all , $NA1pk , $NA2pk , "" , "" , "");
				}

				//layak_pip
				if($jmllp!=1){
					$NA1lp="layak_pip='$nilai_lp[0]'";
					$NA2lp="layak_pip='$nilai_lp[1]'";
					hitung_gain($kondisi , "layak_pip" , $entropy_all , $NA1lp , $NA2lp , "" , "" , "");
				}

				//jumlah_saudara
				if($jmljs!=1){
					$NA1js="jumlah_saudara='$nilai_js[0]'";
					$NA2js="";
					$NA3js="";
					if($jmljs==2){
						$NA2js="jumlah_saudara='$nilai_js[1]'";
					}else if ($jmljs==3){
						$NA2js="jumlah_saudara='$nilai_js[1]'";
						$NA3js="jumlah_saudara='$nilai_js[2]'";
					}
					hitung_gain($kondisi , "jumlah_saudara" , $entropy_all , $NA1js, $NA2js, $NA3js, "" , "");
				}																																				
				
					
				//ambil nilai gain tertinggi
					$sql_max = mysql_query("SELECT MAX(gain) FROM gain");
					$row_max = mysql_fetch_array($sql_max);	
					$max_gain = $row_max['0'];
					$sql = mysql_query("SELECT * FROM gain WHERE gain=$max_gain");
					$row = mysql_fetch_array($sql);	
					$atribut = $row['1'];
					// echo "Atribut terpilih = ".$atribut.", dengan nilai gain = ".$max_gain."<br>";					
					// echo "<br>================================<br>";
				//percabangan jika nilai atribut lebih dari 2 hitung rasio terlebih dahulu
				

						
				


				// penghasilan_ortu terpilih
				 if($atribut=="penghasilan_ortu"){
					//jika nilai atribut 3
					if($jmlpo==3){
						$cabang = array();
						$cabang = hitung_rasio($kondisi , 'penghasilan_ortu',$max_gain,$nilai_po[0],$nilai_po[1],$nilai_po[2],'','');
						$exp_cabang = explode(" , ",$cabang[1]);							
						proses_DT($kondisi,"($atribut='$cabang[0]')","($atribut='$exp_cabang[0]' OR $atribut='$exp_cabang[1]')");						
					}
					//jika nilai atribut 2
					else if($jmlpo==2){
						proses_DT($kondisi,"($atribut='$nilai_po[0]')" , "($atribut='$nilai_po[1]')");
					}
				}

				// penerimaan_kps terpilih
				else if($atribut=="penerimaan_kps"){					
					proses_DT($kondisi , "($atribut='Ya')","($atribut='Tidak')");										
				}

				// layak_pip
				else if($atribut=="layak_pip"){					
					proses_DT($kondisi , "($atribut='Ya')","($atribut='Tidak')");										
				}
		
				
				// jumlah_saudara TERPILIH
				else if($atribut=="jumlah_saudara"){
					//jika nilai atribut 3
					if($jmljs==3){
						$cabang = array();
						$cabang = hitung_rasio($kondisi , 'jumlah_saudara',$max_gain,$nilai_js[0],$nilai_js[1],$nilai_js[2],'','');
						$exp_cabang = explode(" , ",$cabang[1]);							
						proses_DT($kondisi,"($atribut='$cabang[0]')","($atribut='$exp_cabang[0]' OR $atribut='$exp_cabang[1]')");						
					}
					//jika nilai atribut 2
					else if($jmljs==2){
						proses_DT($kondisi,"($atribut='$nilai_js[0]')" , "($atribut='$nilai_js[1]')");
					}
				}				
			}
		}						
	}
?>