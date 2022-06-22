#!/usr/bin/perl
 
# Strict and warnings are recommended.
use strict;
use warnings;
use Time::HiRes;



my $numerator = 5;

my $result;


# Aqui realizo la division por 0 sin utilizar excepciones
my $start_time = [Time::HiRes::gettimeofday()];

my $diff = Time::HiRes::tv_interval($start_time);

printf("Execution Time: %.7f \n", $diff);
$result = $numerator / 0;


