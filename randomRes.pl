#!/usr/local/bin/perl

open(IN, "res-keywords.pl");
open(IN2, "templates.pl");
open(IN3, "poeticwords.pl");
open(IN4, "poemStruct.pl");
open(KEYWORDS, ">res-keywordsRand.pl");
open(TEMPLATES, ">res-templatesRand.pl");
open(POETICWORDS, ">res-poeticwordsRand.pl");
open(POEMSTRUCT, ">res-poemStructRand.pl");

use List::Util 'shuffle';
use Storable;

%keyword = %{retrieve('res-keyword.txt')};

# Shuffling urutan keyword sebelum dicetak
@shuffledKeywordKey = shuffle keys (%keyword);
print KEYWORDS ":- multifile word\/5\.\n";
foreach $temp(@shuffledKeywordKey){
	print KEYWORDS $keyword{$temp} . "\n";
}

# Shuffling urutan template sebelum dicetak
while ($temp = <IN2>){
	chomp $temp;
	push @template, $temp;
}
@shuffledTemplate = shuffle @template;
foreach $temp(@shuffledTemplate){
	print TEMPLATES $temp . "\n";
}

# Shuffling urutan poeticword sebelum dicetak
while ($temp = <IN3>){
	chomp $temp;
	push @poeticword, $temp;
}
@shuffledPoeticword = shuffle @poeticword;
print POETICWORDS ":- multifile word\/5\.\n";
foreach $temp(@shuffledPoeticword){
	print POETICWORDS $temp . "\n";
}

# Shuffling urutan poem structure sebelum dicetak
$teks;
while ($temp = <IN4>){
	$teks .= $temp;
}
@poemStruct = split(/\./, $teks);
#foreach $temp(@poemStruct){
#	print $temp . ".\n";
#}
@shuffledPoemStruct = shuffle @poemStruct;
foreach $temp(@shuffledPoemStruct){
	#$keyComposition = int(rand(20)) + 30;
	#print POEMSTRUCT $temp . ",\n\n\tKTotal is KA + KB + KC + KD,\n\tSTotal is SA + SB + SC + SD,\n\tKTotal * 100 / STotal >=" . $keyComposition . ".\n";
	print POEMSTRUCT $temp . ".\n";
}


print "[randomRes.pl] Language resources shuffled ...\n";