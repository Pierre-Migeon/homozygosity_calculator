#!/usr/bin/perl -w
use strict;

#Description: reads in a tab delinated file of 23andme data and outputs the percent homozygous sites 
#Usage: perl homozygosity_percent.pl snps.txt

my $snps = $ARGV[0];
my $equal = 0;
my $total = 0;

open(IN, '<', $snps);
while(<IN>)
{
	my @line = split(/\t/, $_);
	if ($_ !~ /^#/)
	{
		if (substr($line[3], 0, 1) eq substr($line[3], 1, 1))
		{
			$equal++;
		}
		$total++;
	}
}

print "################################################################\n" . " Of " . $total . " SNPs in the data, " . ($equal / $total) * 100 . "% were homozygous.\n" . "################################################################\n";
