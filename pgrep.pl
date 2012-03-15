#!perl

use strict;
use warnings;
use Encode;
my $from_enc_targetfile='utf8';
my $from_enc_cond='shiftjis';
my $to_enc='shiftjis';

my $cond =decode($from_enc_cond,shift);

while(<>){
	chomp;
	my $line=decode($from_enc_targetfile,$_);
	if ($line =~/$cond/ && $line !~ /^<ISA/ ){
		print encode($to_enc, $line) . "\n";
	}
}

