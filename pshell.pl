#!perl
use strict;
use warnings;
use Term::ReadKey;


#find
#grep
#echo
#xargs
#kill
#ls
#pwd
#nkf
#cat
#cd
#ps

sub prompt{
	my $p=qx/cd/;
	chomp $p;
	return ($p . '>#');
}
sub main(){
	$|=1;
	ReadMode "ultra-raw";
	my $buffer;
	print prompt();
	while(1){
		my $char=ReadKey(-1);
		if( defined $char){
			if (ord($char) == "13" ) { #return
				print "cmd=$buffer";
				print "\n";
				
				#改行後、表示位置がずれるなー。
				ReadMode 0;
				ReadMode "ultra-raw";
	
				print prompt();
				$buffer="";
			}elsif(ord($char) == 3 ){#control+c
				print "ctrl+c\n";
				last;
			}elsif(ord($char) == 24 ){#control+x

			}elsif(ord($char) == 22 ){#control+x

			}else{
				$buffer.=$char;
			}
			#print "ord=".ord($char)."\n";
			#print "buffer=$buffer\n";
			print $char;
		}
	}
	ReadMode "restore";
}
main();



