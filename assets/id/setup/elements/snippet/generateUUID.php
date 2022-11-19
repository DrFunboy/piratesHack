srand(intval(microtime(true) * 1000));
$b = md5(uniqid(rand(),true),true);
$b[6] = chr((ord($b[6]) & 0x0F) | 0x40);
$b[8] = chr((ord($b[8]) & 0x3F) | 0x80);
return implode('-',unpack('H8a/H4b/H4c/H4d/H12e',$b));