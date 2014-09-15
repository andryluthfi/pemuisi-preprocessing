#!/usr/local/bin/perl

open(OUT, ">res-keywords.pl");
open(CLEAR, ">res-selected-poetry.txt");
close(CLEAR);
#print CLEAR "";

use Storable;
%pronounce = %{retrieve('res-pronounce.txt')};
%syllableCount = %{retrieve('res-syllableCount.txt')};
%postag = %{retrieve('res-postag.txt')};

%keyword = ();

# Membangun language resource dari data-data yang sudah dimiliki
foreach $word (keys (%postag)) {
	# Jika data pelafalan dan jumlah suku kata sudah ada di korpus, maka gunakan data korpus
	if(exists $pronounce{$word}){
		$keyword{$word} = "word(" . $word . ", " . $postag{$word} . ", " .
			$pronounce{$word} . ", " . $syllableCount{$word} . ", " . "keyword).";
		print OUT $keyword{$word} . "\n";
	}
	# Jika tidak ada, maka buat data tersebut terlebih dahulu
	else {
		@temparray = split("", $word);
		$syllable = 0;
		foreach $temp2(@temparray){
			if($temp2 =~ /[aeiou]/){
				$syllable++;
			}
		}
		$pseudoPronounce = join ",", @temparray;
		$pseudoPronounce = "[" . $pseudoPronounce . "]";
		$keyword{$word} = "word(" . $word . ", " . $postag{$word} . ", " .
			$pseudoPronounce . ", " . $syllable . ", " . "keyword).";
		print OUT $keyword{$word} . "\n";
	}
}

print "[flagging.pl] Flagging keywords done ...\n";
store (\%keyword, 'res-keyword.txt');


system("generate.bat");
system("random-getline.bat >> res-selected-poetry.txt");
system("generate.bat");
system("random-getline.bat >> res-selected-poetry.txt");
system("generate.bat");
system("random-getline.bat >> res-selected-poetry.txt");

