#!/usr/bin/perl 
### Print help ###
my $PrintHelp=qq(
USAGE:
	perl pep_pattern.pl <Infile>

AUTHOR:
	Xukai Li (specterae\@hotmail.com) 2013/03

DESCRIPTION:
	This script was written for manipulating regular expressions 
	describing amino acid sequence pattern or motif. Patterns can 
	be quite complex and it is often difficult to generate amino 
	acid sequence pattern. The pep_pattern.pl addresses this 
	problem, providing a convenient set of tools for working 
	with biological sequence motif.
	Written by Xukai Li and test under the perl enviroment 5.12.3.

DATA STRUCTURES:
	The sequence format for pep_pattern.pl must be a protein 
	sequence and must in Fasta format. Sequences start with a 
	header line followed by sequence lines. A header line has 
	the character ">" in position one, followed by a unique name. 
	After the header line come the actual sequence lines 
	(in capital). Spaces and blank lines are ignored. 
	The input file should use only plain, unformatted text.

EXAMPLE:
	perl  pep_pattern.pl  Protein_Seq.fasta
\n);
die($PrintHelp)if($ARGV[0]=~/-[hH]+/);
### Main ###
die"Incorrect number of command line arguments.\nUsage:  perl  pep_pattern.pl  Protein_Seq.fasta\n\nTo show brief help usage, do \"pep_pattern.pl -h\"\n" unless $ARGV[0];
print"\nPlease input the optimum width of motif with the limit:\n";
my $width = <STDIN>;
$width =~/\d+/?($width):($width=4);
$amino_acid =['A', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'K', 'L', 'M', 'N', 'P', 'Q', 'R', 'S', 'T', 'V', 'W', 'Y'];
&create($amino_acid);
sub create {
	my ($list) = @_;
	my $str_list = [ '' ];
	for ($x=0; $x<$width; $x++) {
		$str_list = create_list($str_list, $list);
	}
	return $str_list;
}
sub create_list {
	my ($ref_str_list, $ref_array) = @_;
	my @return_array;
	foreach my $str (@{$ref_str_list}) {
		foreach my $element (@{$ref_array}) {
			push @return_array, "${str}$element";
		}
	}
	if ($return_array[20]=~/\w+/) {
		open(IN, $ARGV[0])||die "$!"; 
		open(OUT,">>Result.txt")||die "$!"; 
		print OUT "序列名\t序列氨基酸总数\tmotif位置\tmotif多肽\t出现次数\n";
		local $/ = ">";
		my %hash =();
		$no_heads =0;
		while(<IN> ){
			chomp;
			my ($head,$seq) = split(/\n/,$_,2);
			next unless($head && $seq);
			$no_heads ++;
			$seq=~s/\s+//g;
			$seq=~s/[*-]//g;
			$head=~s/\s+$//;
			foreach $motif (@return_array) {
				if($seq =~ /$motif/){
					$hash{$motif}++;
					push (@Motif, $motif);
				}
			}
		}
		print "\nThere are $no_heads sequences in $ARGV[0]\n";
		open(DATA, $ARGV[0]);
		while(<DATA> ){
			chomp;
			my ($head,$seq) = split(/\n/,$_,2);
			next unless($head && $seq);
			$seq=~s/\s+//g;
			$seq=~s/[*-]//g;
			$head=~s/\s+$//;
			foreach my $key ( sort { $hash{$b} <=> $hash{$a} } keys %hash ) {
				my $value = $hash{$key};
					if($seq =~ /$key/ and $value/$no_heads > 0.5){
					my ( $position, $now ) = ( 0, -1 );
						until ( $position == -1 ) {
							$position = index( $seq, $key, $now + 1 );
							$now = $position;
							push (@position, $position) unless $position < 0;
							$position{$head.$key} .= "$position " unless $position < 0;
						}
						my $seq_length = length ($seq);
						print OUT "$head\t$seq_length\t$position{$head.$key}\t$key\t$value\n";
					}
			}
		}
	}
	return \@return_array;
}
close(IN);
close(OUT);
