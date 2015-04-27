package MyTask::Echo;
use utf8;
use strict;
use warnings;
use feature 'say';
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1};

use Log::Minimal;


sub perform {
    my $job = shift;
    infof('dequeue: %s', ddf($job->args));
    say $job->args->[0];
}

1;
