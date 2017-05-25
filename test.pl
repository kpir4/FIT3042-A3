#!/usr/bin/perl -w
use strict;
use File::Copy::Recursive qw(fcopy rcopy dircopy fmove rmove dirmove);

copy_dir("Test");
find_dup();
delete_files("dupFile");
gzip("Test1");

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
		   system("grep '$file' $tempfile | tail -n +2 > $dupfile");
		}
		else{
		   system("grep '$file' $tempfile | tail -n +2 >> $dupfile");
		}
		$counter++;
	}
}


sub copy_dir{
	my $newDir = "Test1";
	dircopy($_[0], $newDir) or die $!;
}


sub delete_files{
	my $search = $_[0];
	open (my $info, '<', $search) or die "Could not open $search: $!";

	while(my $file = (<$info>)){
		chomp($file);
		unlink($file);
	}
}


sub gzip{
	system("tar -czvf $_[0].tar.gz $_[0]");
}


sub bzip2{
	system("tar -jcvf $_[0].tar.bz2 $_[0]");
}


sub compress{
	system("tar -cf $_[0].tar $_[0]");
	system("compress -f $_[0].tar");
}