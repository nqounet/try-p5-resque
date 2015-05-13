#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use Path::Tiny qw(path tempdir);
use Test::RedisServer;
use Proclet;


my $redis = Test::RedisServer->new(
    auto_start => 0,
    tmpdir     => tempdir(),
);
$ENV{REDIS_SERVER} = $redis->connect_info;

my $proclet = Proclet->new(color => 1);
$proclet->service(
    code => sub {
        $redis->exec;
    },
    worker => 1,
    tag    => 'redis'
);
$proclet->service(
    code   => [qw{carton exec -- perl worker.pl}],
    worker => 5,
    tag    => 'worker'
);
$proclet->service(
    code   => [qw{carton exec -- perl client.pl}],
    worker => 1,
    tag    => 'client'
);
$proclet->run;
