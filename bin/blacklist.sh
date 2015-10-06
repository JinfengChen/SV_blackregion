#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l mem=20gb
#PBS -l walltime=100:00:00
#PBS -j oe
#PBS -V
#PBS -d ./

#cd $PBS_O_WORKDIR


start=`date +%s`

echo "Do thing here"
module load bedtools
#bedtools genomecov -ibam test.bam -bga > test.bedgraph
#awk '$4>100 || $4<25' test.bedgraph > test.high_low.bedgraph
#bedtools merge -i test.high_low.bedgraph > test.high_low_merge.bedgraph
#awk '$3-$2>500' test.high_low_merge.bedgraph > test.high_low_500bp.bedgraph

##NB_P, 33X
bedtools genomecov -ibam ../input/NB_P.bam -bga > NB_P.bedgraph
#get mean of coverage
#cut -f4 test.bedgraph | perl ~/BigData/software/bin/numberStat.pl
#high than 3*mean coverage or lower than mean/3 coverage
#awk '$4>100 || $4<10' NB_P.bedgraph > NB_P.high_low.bedgraph
#merge bedgraph and selected these longer than 500 bp to be black regions
#bedtools merge -i NB_P.high_low.bedgraph | awk '$3-$2>500' > NB_P.high_low_500bp.bedgraph

##HEG4_P, 22X
bedtools genomecov -ibam ../input/HEG4_P.bam -bga > HEG4_P.bedgraph
#get mean of coverage
#cut -f4 test.bedgraph | perl ~/BigData/software/bin/numberStat.pl
#high than 3*mean coverage or lower than mean/3 coverage
#awk '$4>66 || $4<7' HEG4_P.bedgraph > HEG4_P.high_low.bedgraph
#bedtools merge -i HEG4_P.high_low.bedgraph | awk '$3-$2>500' > HEG4_P.high_low_500bp.bedgraph


#echo "window based"
#bedtools makewindows -g MSU7.chrlen -w 200 -s 100 > MSU7.200bp.bed &


end=`date +%s`
runtime=$((end-start))

echo "Start: $start"
echo "End: $end"
echo "Run time: $runtime"

echo "Done"

