#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature 'say';
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1};

use Resque;
use Log::Minimal;

use lib 'lib';


my $worker = Resque->new->worker;
p $worker;

$worker->add_queue('echo');
infof('### start worker');
$worker->work;
infof('### stop worker');
