#!perl

use strict;
use warnings;
use Encode;
my $from_enc='utf8';
my $to_enc='shiftjis';

if ($ARGV[0] ){
	open(my $fh, "<:encoding($from_enc)", $ARGV[0]) or die "$!";
	print encode($to_enc,$_) while <$fh>;
	close $fh;
}else {
	while(<>){
		print encode($to_enc, decode($from_enc,$_));
	}
}
