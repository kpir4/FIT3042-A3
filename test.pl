#!/usr/bin/perl -w
use strict;
use File::Copy::Recursive qw(fcopy rcopy dircopy fmove rmove dirmove);

copy_dir("Test");
find_dup();

sub find_dup{
	my $dirname="Test1";
	my $tempfile="myTempfileName";
	my $dupfile="dupFile";
	my $search="searchTerms";
	my $counter=0;

	system("find $dirname -type f  > $tempfile");
	system("cat $tempfile | sed 's_.*/__' | sort |  uniq -d > $search"); 

	open (my $info, '<', $search) or die "Could not open $search: $!";

	while(my $file = (<$info>)){
		chomp($file);
		if ($counter == 0){
		   system("grep '$file' $tempfile > $dupfile");
		}
		else{
		   system("grep '$file' $tempfile >> $dupfile");
		}
		$counter++;
	}
}


sub copy_dir{
	my $newDir = "Test1";
	dircopy($_[0], $newDir) or die $!;
}