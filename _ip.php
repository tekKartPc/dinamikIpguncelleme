<?php // tekKartPc.com aracılığı ile ;)
echo '<h1> ip adresiniz: '.$_SERVER['REMOTE_ADDR'].' </h1>'; //denemenizi yaptıktan sonra bu satırı yorum satırına çeviriniz ! 
$file = fopen('_ip.php.txt','w');
fwrite($file, $_SERVER['REMOTE_ADDR']);
fclose($file);
