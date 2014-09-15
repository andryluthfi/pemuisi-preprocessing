#!/usr/local/bin/perl

open (IN, "res-postagResult.txt");

use Storable;
#use SOAP::Lite;

#print SOAP::Lite
#  -> service('http://fws.cs.ui.ac.id/RESTFulWSStanfordPOSTagger/POSTagger?wsdl')
#  -> getPOSTag('aku');
  
$result;
while($temp = <IN>) {
	$result .= $temp;
}


%postag = ();

# Membersihkan teks dari tag-tag yang tidak diperlukan
$result =~ s/<\/document>|<\/element>|<element id = '\w+'>|<document sentence = '[\w\s]+'>|[\s]+//g;
$result =~ s/<word>//;
#print $result;

# Mengumpulkan kata-kata beserta postag terkait ke dalam associative array %postag
@temparray = split(/<word>/, $result);
foreach $temp (@temparray){
	#aku</word><postag>pr</postag>
	$temp =~ s/<\/word>|<\/postag>//g;
	@temparray2 = split(/<postag>/, $temp);
	$postag{$temparray2[0]} = $temparray2[1];
}

#foreach $temp(keys (%postag)){
#	print $temp . ", " . $postag{$temp} . "\n";
#}

print "[postaggerFWS.pl] POSTag retrieved ...\n";

store (\%postag, 'res-postag.txt');
system("perl pronounce.pl");