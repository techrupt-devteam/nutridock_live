<?php
$to = "developer@nutridock.com";
$subject = "Tesing email 1";
$txt = "Hello world!";
$headers = "From: developer@nutridock.com" . "\r\n" .
"CC: developer@techrupt.in";

mail($to,$subject,$txt,$headers,'-r developer@nutridock.com');
?>