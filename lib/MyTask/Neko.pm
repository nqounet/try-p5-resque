package MyTask::Neko;
use utf8;
use strict;
use warnings;
use Log::Minimal;


sub perform {
    my $job = shift;
    infof('meow');
}

1;
