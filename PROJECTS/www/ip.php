<?php

header('Content-Type: application/json');

if ($_SERVER["HTTP_X_FORWARDED_FOR"] != "") {
  $IP = $_SERVER["HTTP_X_FORWARDED_FOR"];
  $proxy = $_SERVER["REMOTE_ADDR"];
  $host = @gethostbyaddr($_SERVER["HTTP_X_FORWARDED_FOR"]);
} else {
  $IP = $_SERVER["REMOTE_ADDR"];
  $host = @gethostbyaddr($_SERVER["REMOTE_ADDR"]);
  $proxy = "None Detected";
}

echo "{ \"ip\": \"$IP\",";
echo "  \"proxy\": \"$proxy\",";
echo "  \"remoteport\": \"" . $_SERVER["REMOTE_PORT"] . "\",";
echo "  \"method\": \"" . $_SERVER["REQUEST_METHOD"] . "\",";
echo "  \"protocol\": \"" . $_SERVER["SERVER_PROTOCOL"] . "\",";
echo "  \"useragent\": \"" . $_SERVER["HTTP_USER_AGENT"] . "\"";
echo "}"

?>
