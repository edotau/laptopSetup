#!/bin/bash

conda create -n gofish bash=5.0.018 libgcc=4.8.5 python=3.7 numpy=1.20.1 nodejs=15.14.0 openjdk=11.0.1 bwa samtools=1.12 minimap2 bcftools freebayes multiqc -y
