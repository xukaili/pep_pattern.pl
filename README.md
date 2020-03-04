# pep_pattern.pl
A motif is a sequence pattern occurring repeatedly in a group of related DNA or protein sequences,and is an important concept for describing the common structure and function shared by the members of a protein family.However,the motif can be quite complex and is often difficult to predict the pattern of amino acid sequence.To get the desired results of the short motifs (2-4 polypeptides) derived from various bioinformatics is still a difficult task.The pep_pattern.pl can be used to solve this problem and provide a convenient set of Perl script for working with biological sequence motif.A Perl script pep_pattern.pl was written for searching very similar amino acid sequence pattern or motif in a group of related protein sequences by matching all the possible amino acids fragments permutation and counting frequency and position of each motif matched in sequence.</br></br>
用Perl语言编写了一个pep_pattern.pl脚本,可从一组相关序列中搜索非常相似的序列片段,通过匹配所有可能的氨基酸片段的排列,统计每个匹配模体在序列中的出现频率和位置,搜索蛋白质序列中的2~4个多肽的模体。 </br></br>

## License
Academic users may download and use the application free of charge according to the accompanying license. Commercial users must obtain a commercial license from Xukai Li. If you have used the program to obtain results, please cite the following paper:</br>
>李旭凯，彭良才，王令强*. pep_pattern.pl, 搜索蛋白质序列模体的perl脚本. 华中农业大学学报（自然科学版）, 2014, 4:1-6.</br></br>
>https://kns.cnki.net/KCMS/detail/detail.aspx?dbcode=CJFD&dbname=CJFD2014&filename=HZNY201404001&v=MjczMzRxVHJXTTFGckNVUkxPZVplZG1GeW5oVzd6TkxUZkZkN0c0SDlYTXE0OUZaWVI4ZVgxTHV4WVM3RGgxVDM=</br></br>

## Getting started
Put __`pep_pattern.pl`__ and  Fasta_seq.txt file in a same dir, then run:</br>
```
     perl  pep_pattern.pl  Fasta_seq.txt  
```
</br>
