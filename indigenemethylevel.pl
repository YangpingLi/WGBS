open FIG,"<all_samples.mC_level.CG";
while(<FIG>){
   chomp;
   @_=split(/\s+/);
   $methy_RF{$_[0]}{$_[1]}=$_[6];
   $methy_RM{$_[0]}{$_[1]}=$_[7];
   $methy_PF{$_[0]}{$_[1]}=$_[8];
   $methy_PM{$_[0]}{$_[1]}=$_[9];
   $methy_GF{$_[0]}{$_[1]}=$_[10];
   $methy_GM{$_[0]}{$_[1]}=$_[11];
   $methy_MF{$_[0]}{$_[1]}=$_[12];
   $methy_MM{$_[0]}{$_[1]}=$_[13];
}
close FIG;
open FIG,"</public/home/zll/zll_data/lyp/database/PYgenome/Genome_final_20140725/bed/PY.gene.bed";
while(<FIG>){
   chomp;
   @_=split(/\s+/);
   $gene="$_[0]".":$_[1]"."-$_[2]";
   foreach $site (keys %{$methy_RF{$_[0]}}){
      if($site>=$_[1]&&$site<=$_[2]){
	     $methygene_RF{$gene}=$methygene_RF{$gene}+$methy_RF{$_[0]}{$site};
		 $methygene_RM{$gene}=$methygene_RM{$gene}+$methy_RM{$_[0]}{$site};
		 $methygene_PF{$gene}=$methygene_PF{$gene}+$methy_PF{$_[0]}{$site};
		 $methygene_PM{$gene}=$methygene_PM{$gene}+$methy_PM{$_[0]}{$site};
	     $methygene_GF{$gene}=$methygene_GF{$gene}+$methy_GF{$_[0]}{$site};
		 $methygene_GM{$gene}=$methygene_GM{$gene}+$methy_GM{$_[0]}{$site};
	     $methygene_MF{$gene}=$methygene_MF{$gene}+$methy_MF{$_[0]}{$site};
		 $methygene_MM{$gene}=$methygene_MM{$gene}+$methy_MM{$_[0]}{$site};
	  }
   }
}
close FIG;
open FIG,"</public/home/zll/zll_data/lyp/database/PYgenome/Genome_final_20140725/bed/PY.gene.CpGoe";
open OUT,">gene_Stage_methylevel";
while(<FIG>){
   chomp;
   @_=split(/\s+/);
   if($_[3]==0){;}
   else{
      $ml_RF=$methygene_RF{$_[0]}/($_[3]*2);
      $ml_RM=$methygene_RM{$_[0]}/($_[3]*2);
      $ml_PF=$methygene_PF{$_[0]}/($_[3]*2);
      $ml_PM=$methygene_PM{$_[0]}/($_[3]*2);
      $ml_GF=$methygene_GF{$_[0]}/($_[3]*2);
      $ml_GM=$methygene_GM{$_[0]}/($_[3]*2);
      $ml_MF=$methygene_MF{$_[0]}/($_[3]*2);
      $ml_MM=$methygene_MM{$_[0]}/($_[3]*2);
	  print OUT "$_[0]\t$ml_RF\t$ml_RM\t$ml_PF\t$ml_PM\t$ml_GF\t$ml_GM\t$ml_MF\t$ml_MM\n";
   }
}
close FIG;
