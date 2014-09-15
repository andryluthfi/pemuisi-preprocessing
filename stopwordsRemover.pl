#!/usr/local/bin/perl

open(IN,"res-expandedKeyword.txt");
open(OUT, ">res-wordListLucene.txt");
open(LUCENE, "lucene.txt");

use Storable;
%wordFreq = %{retrieve('res-wordFreq.txt')};

$text;
@stopword;
#@word = keys (%wordFreq);
@clean;

# Membaca input dan menormalisasi teks agar hanya berisi karakter alfabet
while($temp = <IN>) {
	chomp $temp;
	$temp =~ tr/[A-Z]/[a-z]/;
	$temp =~ s/[^a-z \n]/ /g;
	$text .= $temp . " ";
}
$text =~ s/[ ]+/ /g;
$text =~ s/^[ ]//g;

@word = split(/ /, $text);
#foreach $temp (@word){
#	print $temp . "\n";
#}

# Membaca daftar stopwords dari Lucene
for($i = 0; $temp = <LUCENE>; $i++) {
	chomp $temp;
	push @stopword, $temp;
}

# Menyaring kata-kata yang terdapat dalam artikel berdasarkan korpus Lucene
$flag = 0;
for($i = 0; $i < scalar(@word); $i++){
	for($j = 0; $j < scalar(@stopword); $j++){
		if($word[$i] eq $stopword[$j]){
			$flag = 1;
			last;
		}
	}
	if($flag == 0){
		push @clean, $word[$i];
	}
	$flag = 0;
}

# Mencetak hasil penyaringan stopwords Lucene
foreach $temp(@clean){
	print OUT "$temp ";
}

print "[stopwordsRemover.pl] Lucene stopwords removed ...\n";

system("java -jar StopwordsRemoverFWS.jar");
system("java -jar POSTaggerFWS.jar");
system("perl postaggerFWS.pl");