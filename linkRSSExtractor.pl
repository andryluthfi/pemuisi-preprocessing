#!/usr/local/bin/perl
system("curl -x http://152.118.24.10:8080 www.antaranews.com/rss/terkini > res-rss.xml");
system("curl --max-time 5 http://fws.cs.ui.ac.id/RESTFulWSStanfordPOSTagger/POSTagger?wsdl 2> res-status-fws.txt");

open(IN, "res-rss.xml");
open(STATUS, "res-status-fws.txt");
open(OUT, ">res-articleLink.txt");

$dokumen;
$status;
@link;
while ($temp = <IN>){
	chomp $temp;
	$dokumen .= $temp;
}
while ($temp = <STATUS>){
	chomp $temp;
	$status .= $temp;
}

if ($dokumen eq "" || index($status, 'timed out') != -1) {
	system("echo \"[".localtime()."] Koneksi Interner mati atau FWS sedang tidak dapat dipakai\" >> poetry-log.txt");
} else {
	$dokumen =~ /<item>(.*?)<\/channel>/;

	#print $1;

	@item = split(/<\/item>/, $1);
	$i = 0;

	$articleExtracted = 0;
	foreach $temp(@item){
		$temp =~ /<title>(.*?)<\/title>/;
		$link[$i][0] = $1;
		print OUT $link[$i][0] . "\n";
		
		$temp =~ /<link>(.*?)<\/link>/;
		$link[$i][1] = $1;
		print OUT $link[$i][1] . "\n";
		
		$temp =~ /<pubDate>(.*?)<\/pubDate>/;
		$link[$i][2] = $1;
		print OUT $link[$i][2] . "\n";
		
		$temp =~ /<description>(.*?)<\/description>/;
		print OUT $1 . "\nPuisi:\n";
		
		system("curl -x http://152.118.24.10:8080 " . $link[$i][1] . " -L > res-content.html");
		
		system("perl contentExtractor.pl");
		
		# cek hasil content extractor
		open(TEKSARTIKEL,"res-teksArtikel.txt");
		$teksartikel = "";
		while($temp2 = <TEKSARTIKEL>){
			$teksartikel .= $temp2;
		}
		if($teksartikel eq "") {
			continue;
		}
		
		system("run.bat"); # output: res-selected-poetry.txt (isinya baris puisi ada 3 baris)
		
		# cek hasil puisi
		open(INPOET,"res-selected-poetry.txt");
		$poem = "";
		while($temp3 = <INPOET>){
			$poem .= $temp3;
		}
		next if($poem eq "");
		print OUT $poem . "\n";
		close(INPOET);
		if(++$articleExtracted == 2){
			break
		}
		print OUT "\n";
	}
	close(OUT);
	if($articleExtracted == 2) {
		system("upload.bat");
		print "[linkRSSExtractor.pl] Links extracted from RSS...\n";
	} else {

		system("echo \"[".localtime()."] Puisi gagal dibuat\" >> poetry-log.txt");
	}
}