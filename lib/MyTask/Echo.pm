package MyTask::Echo;
use utf8;
use strict;
use warnings;
use Log::Minimal;


sub perform {
    my $job = shift;
    debugf('dequeue: %s', ddf($job->args));
    infof($job->args->[0]{count});
}

1;
