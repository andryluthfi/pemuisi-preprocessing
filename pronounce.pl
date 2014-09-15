#!/usr/local/bin/perl

open(IN,"pronouncing.txt");
open(OUT, ">res-pronouncing&syllable.txt");

use Storable;
$syllable;
$text;
%pronounce = ();
%syllableCount = ();
%vowel =();

# Membaca korpus pelafalan
while($temp = <IN>) {
	chomp $temp;
	@temparray = split(/\t/, $temp);
	$temp2 = $temparray[1];
	$temp2 =~ s/(\[|\])//g;
	@temparray2 = split(/,/, $temp2);
	$syllable = 0;
	
	# Menghitung jumlah suku kata
	foreach $temp3(@temparray2){
		if($temp3 =~ /[aeiou]/){
			$syllable++;
			$vowel{$temp3}++;
		}
	}
	
	# Menyimpan pelafalan dan jumlah suku kata dalam associative array
	$pronounce{$temparray[0]} = $temparray[1];
	$syllableCount{$temparray[0]} = $syllable;
	
	# Mencetak informasi pelafalan dan jumlah suku kata
	print OUT $temparray[0] . "\t" . $temparray[1] . ", ". $syllable . "\n";
}

#foreach $temp(keys %vowel){
#	print $temp . " : " . $vowel{$temp} . "\n";
#}

print "[pronounce.pl] Pronounce and syllable retrieved ...\n";

store (\%pronounce, 'res-pronounce.txt');
store (\%syllableCount, 'res-syllableCount.txt');

system("perl flagging.pl");