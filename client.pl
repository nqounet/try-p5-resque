#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use Resque;
use Log::Minimal;


my $resque = Resque->new;

my $count = 10;
while ($count--) {
    $resque->push(
        echo => +{
            class => 'MyTask::Echo',
            args  => +[+{count => $count}]
        }
    );
    infof($count);
    sleep 2;
    $resque->push(
        neko => +{
            class => 'MyTask::Neko',
            args  => +[]
        }
    );
    infof('neko');
    sleep 1;
}
