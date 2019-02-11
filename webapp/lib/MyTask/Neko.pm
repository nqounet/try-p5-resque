package MyTask::Neko;
use utf8;
use strict;
use warnings;
use Log::Minimal;
use Data::Printer {deparse => 1, caller_info => 1};

sub perform {
    my $job = shift;
    debugf('begin MyTask::Neko::perform');

    infof('meow');

    sleep 2;
    return;
}

debugf('loaded MyTask::Neko');

1;
