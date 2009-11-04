#!/usr/bin/perl
#############################################################################
#
# Author:  Chris Weyl (cpan:RSRCHBOY), <cweyl@alumni.drew.edu>
# Company: No company, personal work
# Created: 10/21/2009
#
# Copyright (c) 2009  <cweyl@alumni.drew.edu>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
#############################################################################

=head1 NAME

10.flags.t - Test flags functionality

=head1 DESCRIPTION 

This test exercises the flags functionality.

=head1 TESTS

This module defines the following tests.

=cut

use strict;
use warnings;

use Test::More tests => 7;

BEGIN {
    plan skip_all => 'Must set FB_TEST_USERID & _PASSWD for live tests.'
        unless exists $ENV{FB_TEST_USERID} && exists $ENV{FB_TEST_PASSWD};
}

use Fedora::Bugzilla;

# three depends, two blocks
my $BUG = '525913';

my $bz  = Fedora::Bugzilla->new(
    userid => $ENV{FB_TEST_USERID}, 
    passwd => $ENV{FB_TEST_PASSWD},
);
$bz->login;
my $bug = $bz->bug($BUG);

isa_ok $bug => 'Fedora::Bugzilla::Bug';

=head2 get flags 

=cut

ok $bug->has_flags,                 'bug has flags set';
ok $bug->has_flag('fedora-review'), 'bug has fedora_review flag';

my $flag = $bug->get_flag('fedora-review');
isa_ok $flag => 'Fedora::Bugzilla::Bug::Flag';

is $flag->name,   'fedora-review',     'got the f-r flag';
is $flag->status, '+',                 "...and it's set";
is $flag->setter, 'jan.klepek@hp.com', '...and set by correctly';

done_testing;

__END__

=head1 AUTHOR

Chris Weyl  <cweyl@alumni.drew.edu>

=head1 LICENSE AND COPYRIGHT

Copyright (c) 2009  <cweyl@alumni.drew.edu>

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the 

     Free Software Foundation, Inc.
     59 Temple Place, Suite 330
     Boston, MA  02111-1307  USA

=cut
