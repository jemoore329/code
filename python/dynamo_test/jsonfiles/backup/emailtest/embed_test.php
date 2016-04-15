<?php

// Base URL and path
$baseurl = "https://www.periscopedata.com";
$url = "/api/embedded_dashboard?data=";

// API key for Periscope
$apikey = "d0b418c5-f0c0-4b56-9854-b2cf8dde";

// Data structure
$data = array(
    "dashboard" => 35585,
    "embed" => "v2",
    "filters" => array(
        array(
                "name" => "logicalissuename",
                "value" => "Digital Mar 2016"
        ),
        array(
                "name" => "publication",
                "value" => "People StyleWatch"
        )
    )
);

// Path with encode JSON data
$link = $url . urlencode(json_encode($data));

// Calculate signature
$signature = hash_hmac('sha256', $link, $apikey);

// Print link
//$link = $baseurl . $link . '&signature=' . $signature  . "\n";
print $baseurl . $link . '&signature=' . $signature  . "\n";
?>
