#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l mem=20gb
#PBS -l walltime=100:00:00
#PBS -j oe
#PBS -V
#PBS -d ./

module load bedtools
prefix=test
bedtools genomecov -ibam $prefix\.bam -bga > $prefix\.bedgraph
awk '$4>70 || $4<10' $prefix\.bedgraph > $prefix\.high_low.bedgraph
bedtools merge -i $prefix\.high_low.bedgraph > $prefix\.high_low_merge.bedgraph
awk '$3-$2>500' $prefix\.high_low_merge.bedgraph > $prefix\.high_low_500bp.bedgraph

echo "Done"

