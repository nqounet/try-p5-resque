#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use Resque;
use Log::Minimal;
use lib 'lib';


my $worker = Resque->new->worker;

$worker->add_queue('echo');
$worker->add_queue('neko');
infof('### start worker');
$worker->work;
infof('### stop worker');
