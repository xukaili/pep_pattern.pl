#!/usr/bin/perl -w
#把任意格式（AB1、ABI、ALF、CTF、EMBL、EXP、Fasta、Fastq、GCG、GenBank、PIR、PLN、SCF、ZTR、ace、game、locuslink、phd、qual、raw、swiss）转换为任意格式，用法：“perl Reformat.txt format1 format2 <要转的文件名> output”
#用法：“perl Reformat.txt fasta fasta <OsCyclin.fasta> output.fasta”
    $format1 = shift;
    $format2 = shift || die
       "Usage: reformat format1 format2 < input > output";
    use Bio::SeqIO;
    $in  = Bio::SeqIO->newFh(-format => $format1, -fh => \*ARGV );
    $out = Bio::SeqIO->newFh(-format => $format2 );
    print $out $_ while <$in>;
