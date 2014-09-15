#!/usr/local/bin/perl

open(IN,"res-teksArtikel.txt");
open(OUT, ">res-termFreq.txt");

use Storable;

$text;
%wordFreq = ();

# Membaca input dan menormalisasi teks agar hanya berisi karakter alfabet
while($temp = <IN>) {
	chomp $temp;
	$temp =~ tr/[A-Z]/[a-z]/;
	$temp =~ s/[^a-z \n]/ /g;
	$text .= $temp . " ";
}
$text =~ s/[ ]+/ /g;
$text =~ s/^[ ]//g;

# Menghitung frekuensi kemunculan setiap kata
@temparray = split(/[\s]+/, $text);
foreach $temp (@temparray){
	$wordFreq{$temp}++;
}

# Sorting descending berdasarkan frekuensi kemunculan
foreach $temp (sort {$wordFreq{$b} <=> $wordFreq{$a}} keys %wordFreq) {
	print OUT "$temp\n"
}

store (\%wordFreq, 'res-wordFreq.txt');

print "[tf.pl] Term frequency counted ...\n";

system("java -jar WortschatzKeywordExpander.jar captcha captch4\$");
system("perl stopwordsRemover.pl");