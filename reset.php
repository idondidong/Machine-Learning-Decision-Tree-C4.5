<?php 
include "koneksi.php";

$hapus1 = mysql_query(" TRUNCATE aturan");
$hapus2 = mysql_query("TRUNCATE cf"); 
 ?>

 <center><h1>Reset Berhasil</h1></center>