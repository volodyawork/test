<?php
// with recursion
function pretty($n)
{
    if ($n > 3) {
        $result = pretty($n - 1) + pretty($n - 2) + 1;
    } else {
        $result = 0;
    }
    return $result;
}

$n = 35;
$time_start = microtime(true);

echo pretty($n) . '<br/>';

$time_end = microtime(true);
$time = $time_end - $time_start;

echo "$time seconds\n";
echo "<br/>";

// with cycle
$time_start = microtime(true);
$array = [];
$array[1] = 0;
$array[2] = 0;
$array[3] = 0;
if ($n > 3) {
    $i = 4;
    while ($i <= $n) {
        $array[$i] = $array[$i - 1] + $array[$i - 2] + 1;
        $i++;
    }
    echo $array[$n] . '<br/>';
} else {
    echo $array[$n] . '<br/>';
}

$time_end = microtime(true);
$time = $time_end - $time_start;

echo "$time seconds\n";
