#!/usr/local/bin/perl

open(IN, "res-content.html");
open(OUT, ">res-teksArtikel.txt");

$dokumen;

while ($temp = <IN>){
	chomp $temp;
	$dokumen .= $temp . " ";
}

#$dokumen =~ /<strong>(.*?)<\/strong>([\w \S\n\r]*<br \/>+[\w \S]*)/;
$dokumen =~ /<span class\=\"post\-content\" style\=\"margin\-top\: 20px\;\">(.*?)<\/span>/;
#print $1;

$teks  = $1;
$teks =~ s/&mdash;|<br \/>|<br \\>|<em>|<\/em>|<br>|<i>|<\/i>|<div>|<\/div>//g;
#print $teks;
print OUT $teks;

print "[contentExtractor.pl] Content extracted from Article ...\n";