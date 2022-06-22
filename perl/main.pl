use strict;
use warnings;
use Time::HiRes;


sub divitionByZero{

   my($numerator, $denominator) = @_;

      if($denominator == 0){

         warn "Can't divide by zero";
      }
      else{

         print "Result: ",($numerator / $denominator), "\n";
      }
}

my $start_time = [Time::HiRes::gettimeofday()];


divitionByZero(10,0);

my $diff = Time::HiRes::tv_interval($start_time);

printf("Execution Time: %.6f \n", $diff);