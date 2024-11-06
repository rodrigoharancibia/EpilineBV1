#!/usr/bin/perl -w


open (LIST, $ARGV[0]);
open (FFNFAA, $ARGV[1]);

@lista = <LIST>;
@multifasta = <FFNFAA>;
my %info;
my %product;
my %boolean;
for $i (@multifasta) {
	if ($i =~ m/\>/){
		if ($lt){
			$boolean{$lt} = "true";
		}
		$lt = $i;
		$lt =~ s/ .+//g;
		$lt =~ s/\n//g;
		$lt =~ s/\s//g;
		$lt =~ s/\>//g;
		$product{$lt} = $i;
	}elsif(($i !~ m/\>/)&&(!$boolean{$lt})){
		$info{$lt} .= $i;
	}
	
}

for $i (@lista){
	$i =~ s/\n//g;
	$i =~ s/\s//g;
	print $product{$i}.$info{$i};
}

