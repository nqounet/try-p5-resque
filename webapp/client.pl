#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use Resque;
use Log::Minimal;
use lib 'lib';

debugf('### begin client.pl');

my $resque = Resque->new;

my $count = 10;
while ($count--) {
    debugf('push echo');
    $resque->push(
        echo => +{
            class => 'MyTask::Echo',
            args  => +[+{count => $count}]
        }
    );

    debugf('push neko');
    $resque->push(
        neko => +{
            class => 'MyTask::Neko',
            args  => +[]
        }
    );

    sleep 1;
}

debugf('### end client.pl');

__END__
