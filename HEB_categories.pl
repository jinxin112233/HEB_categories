#! /usr/bin/perl

my $file = shift || die  "perl $0 triads_expression_sorted_file\n";

open IN,"$file";
open OUT,">$file\_summary";
while (<IN>){
	chomp;
	($ae_g,$a_e,$be_g,$b_e,$ce_g,$c_e,$de_g,$d_e,$eh_gene)=split(/\t/,$_);
	$sum = $a_e + $b_e + $c_e + $d_e;
	if ($sum>0.5){
		$a=$a_e/$sum;
		$b=$b_e/$sum;
		$c=$c_e/$sum;
                $d=$d_e/$sum;
		$status = &dominance($a, $b, $c, $d);
		print OUT  $a_e."\t".$b_e."\t".$c_e."\t".$d_e."\t".$eh_gene."\t".$status."\t".$a."\t".$b."\t".$c."\t".$d."\n";
	}
}


sub dominance {
	%hash;
	($A, $B, $C, $D)=@_;
	$hash{"AD"}=sqrt(($A-1)**2+($B-0)**2+($C-0)**2+($D-0)**2);
	$hash{"BD"}=sqrt(($A-0)**2+($B-1)**2+($C-0)**2+($D-0)**2);
	$hash{"CD"}=sqrt(($A-0)**2+($B-0)**2+($C-1)**2+($D-0)**2);
        $hash{"DD"}=sqrt(($A-0)**2+($B-0)**2+($C-0)**2+($D-1)**2);
	$hash{"AS"}=sqrt(($A-0)**2+($B-1/3)**2+($C-1/3)**2+($D-1/3)**2);
	$hash{"BS"}=sqrt(($A-1/3)**2+($B-0)**2+($C-1/3)**2+($D-1/3)**2);
	$hash{"CS"}=sqrt(($A-1/3)**2+($B-1/3)**2+($C-0)**2+($D-1/3)**2);
        $hash{"DS"}=sqrt(($A-1/3)**2+($B-1/3)**2+($C-1/3)**2+($D-0)**2);
	$hash{"BALANCE"}=sqrt(($A-1/4)**2+($B-1/4)**2+($C-1/4)**2+($D-1/4)**2);
	$min = $hash{"BALANCE"};
	$min_name = "BALANCE";
	foreach $i (sort keys %hash){
		if ($min>$hash{$i}){
	
			$min=$hash{$i};
			$min_name=$i;
		
		}
#		return $i;
	}
	return $min_name;
}
