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
# sleep 3;
debugf('### add_queue');
$worker->add_queue('neko');
$worker->add_queue('echo');

# work
# sleep 3;
debugf('### work');
$worker->work;

debugf('### end worker.pl');

__END__
