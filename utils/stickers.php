<?php // TODO port to a real language

ini_set("memory_limit", "-1") ;

// try /usr/share/dict/words
// or you can get one from http://app.aspell.net/create 
//define("DICTFILE", "dictfile");
define("DICTFILE", "dictfile");
$words = getWordlist(DICTFILE);


$word = $argv[1];
$sticker_count = $argv[2]?:1;

// ----------------------------------------------------------------------------

function getWordlist($dictfile) {
    $words = file(DICTFILE);
    sort($words);
    foreach ($words as $i => $word) {
        $words[$i] = str_replace(" ", "_",trim($word));
    }
    return $words;
}

function isBullshit($word) {
    return strlen($word) == 1 && $word != "a" && $word != "i" && $word != "u";
}

function makeStickers($word, $sticker_count) {
    $stickers = array();
    for ($i = 0; $i< strlen($word); $i++) {
        $stickers[$word[$i]] += $sticker_count;
    }
    return $stickers;
}

function wordIsStickable($word, $stickers) {
    $my_stickers = array();
    for ($i = 0; $i< strlen($word); $i++) {
        $letter = $word[$i];
        if ($letter == " " || $letter == "_") {
            continue;
        }
        if (!$stickers[$letter]) {
            return false;
        } elseif (++$my_stickers[$letter]> $stickers[$letter]) {
            return false;
        }
    }
    return true;
}

// ----------------------------------------------------------------------------

echo "LOOKING FOR $word IN ".DICTFILE."...\n";

$found_words = array();

$stickers = makeStickers($word, $sticker_count);
foreach ($words as $word) {
    if (isBullshit($word)) {
        continue;
    }
    if (wordIsStickable($word, $stickers)) {
        $found_words[$word] = true;
    }
}

echo "FOUND ". count($found_words). " WORDS\n";

$bad_combos = array();
    echo "CHECKING COMBOS...\n";
    foreach ($found_words as $word1 => $foo) {
        foreach ($found_words as $word2 => $foo) {
            $combo = explode(" " , "$word1 $word2");
            sort($combo);
            $combo = implode(" ", $combo);

            if ($bad_combos[$combo] || $found_words[$combo]) {
                continue;
            }
            if (wordIsStickable($combo, $stickers)) {
                $found_words[$combo] = true;
            } else {
                $bad_combos[$combo] = true;
            }
        }
    }

ksort($found_words);
echo "YOU CAN MAKE THIS WITH YOUR STICKER !!!:\n";
foreach ($found_words as $word => $fjdskla) {
    echo "$word\n";
}

echo "\nEND\n";
