#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature 'say';
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1};

use Resque;

my $resque = Resque->new;
p $resque;

my $count = 10;
while ($count--) {
    $resque->push(
        echo => +{
            class => 'MyTask::Echo',
            args  => +[$count]
        }
    );
    p $count;
    sleep 2;
}
