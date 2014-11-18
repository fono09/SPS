#!/usr/bin/perl

use strict;
use warnings;

use Data::Dumper;
use Switch;

my @data = ('a','b','c','d',0);

while(1){

	my $cmd = <STDIN>;

	chomp $cmd;

	my @cmds = split(/ /,$cmd);

	switch(shift @cmds){
		case "turn" {
		
			my @stack;
			while(defined($cmds[0])){

				switch(shift @cmds){

					case "a" { push(@stack,0) } 
					case "b" { push(@stack,1) }
					case "c" { push(@stack,2) }
					case "d" { push(@stack,3) }
					case "h" { push(@stack,(0,1,2,3)) }
					case "v" { push(@stack,(0,3,1,2)) }
					else { print "Typo is detected, Recommend type \'next\' and retry.\n" }
				
				}

			}

			while(defined($stack[0]) && defined($stack[1])){

				@data[@stack[0,1]] = @data[@stack[1,0]];

				shift @stack;
				shift @stack;

			}
			$data[4] = ($data[4]==0)?1:0;


		};
		case "rot" {

			my @stack;
			while(defined($cmds[0])){

				switch(shift @cmds){
				
					case "90" { push(@stack,(1,2,3,0)) }
					case "180" { push(@stack,(2,3,0,1)) }
					case "270" { push(@stack,(3,0,1,2)) }
					else { print "Typo is detected, Reccomend type \'next\' and retry.\n" }

				}
				@data[@stack] = @data[0..3];

				shift @stack;
				shift @stack;
				shift @stack;
				shift @stack;

			}

		};
		case "next" {

			@data = ('a','b','c','d',0);

		};
		case "quit" {
		exit;

		};

	}


	printf "%2s─%2s\n",$data[3],$data[0];
	printf "│%2d│\n",$data[4];
	printf "%2s─%2s\n",$data[2],$data[1];
}
		

		

