echo "Chr10"
samtools view -h ../input/HEG4_P.bam Chr10 | samtools view -Sb - -o chr10.bam
qsub -q highmem run_bed.sh
#module load bedtools
#bedtools genomecov -ibam test.bam -bga > test.bedgraph
#awk '$4>100 || $4<25' test.bedgraph > test.high_low.bedgraph
#bedtools merge -i test.high_low.bedgraph > test.high_low_merge.bedgraph
#awk '$3-$2>500' test.high_low_merge.bedgraph > test.high_low_500bp.bedgraph
#compare
grep "^10" ~/BigData/00.RD/RILs/Transpostion/bin/Compare_RILs_SV/lumpy/bin/sample.sv.sample.bam.readdepth.bed | awk '{print "Chr"$1"\t"$2"\t"$3 }' > cnv.chr10.bed
bedtools intersect -a cnv.chr10.bed -b test.high_low_500bp.bedgraph -v | less -S


echo "Chr1"
samtools view -h ../input/HEG4_P.bam Chr3 | samtools view -Sb - -o chr3.bam
qsub -q highmem run_bed.sh

grep -P "^1\t" ~/BigData/00.RD/RILs/Transpostion/bin/Compare_RILs_SV/lumpy/bin/sample.sv.sample.bam.readdepth.bed | awk '{print "Chr"$1"\t"$2"\t"$3 }' > cnv.chr1.bed

echo "Chr3"
samtools view -h ../input/HEG4_P.bam Chr3 | samtools view -Sb - -o chr3.bam
qsub -q highmem run_bed.sh


echo "CNVnator on NP_P and HEG4_P"
qsub -q highmem run_cnvnoter.sh


