<?php

#$file = file_get_contents('all_you_dec_ua.txt');
$file = file_get_contents('all_you_ua.txt');

$rows = explode("\n", $file);

$mappings = array();

$tests = array(
  "iphone" => 1,
  "ipad" => 2,
  "kindle" => 2,
  "mac os x" => 3,
  "IML74K" => 2,
  "SCH-I535 Build\/JZO54K" => 2,
  "VS920 4G Build\/IMM76D" => 1,
  "KFSOWI Build\/JDQ39" => 2,
  "Mobile Safari" => 1,
  "Safari" => 2,
  "Windows NT 6\.1" => 3
);


// Loop lines
for ($i=1; $i<count($rows); $i++) {

  $line = explode("\t",$rows[$i]);

  $isScan = 0;

  foreach ($tests as $test => $classification) {
    if (preg_match("/$test/i",$line[0]) === 1) {
      $isScan = $classification;
      break;
    }
  }

/*  if (preg_match('/iphone/i',$line[0]) === 1) {
    $isScan = 1;
  } elseif (preg_match('/ipad/i',$line[0]) === 1) {
    $isScan = 2;
  } elseif (preg_match('/kindle/i',$line[0]) === 1) {
    $isScan = 2;
  }

  Mac OS X
*/

  if ($isScan == 0) {
    $isScan = $line[0];
  }
  //print $line[0] . " <b>" . $line[1] . "</b>" . "<br>";

  $mappings[$line[1]] = $isScan;

} // end foreach

print "<pre>";

foreach ($mappings as $session => $type) {
  print "insert into #tmp_ay values('" . $session . "'," . $type . ");\n";
}

//print_r($mappings);


?>
