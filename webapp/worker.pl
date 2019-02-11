#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use Resque;
use Log::Minimal;
use lib 'lib';

debugf('### begin worker.pl');

my $worker = Resque->new->worker;

# add_queue
debugf('### add_queue');
$worker->add_queue('neko');
$worker->add_queue('echo');

# work
debugf('### work');
$worker->work;

debugf('### end worker.pl');

__END__
