package MyTask::Echo;
use utf8;
use strict;
use warnings;
use Log::Minimal;
use Data::Printer {deparse => 1, caller_info => 1};

sub perform {
    my $job = shift;
    debugf('begin MyTask::Echo::perform');

    debugf('dequeue: %s', ddf($job->args));

    sleep 1;
    return;
}

debugf('loaded MyTask::Echo');

1;
