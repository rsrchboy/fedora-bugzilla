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

09.depends-blocks.t - Test depend/blocks querying capabilities

=head1 DESCRIPTION 

This test exercises...

=head1 TESTS

This module defines the following tests.

=cut

use strict;
use warnings;

use Test::More;

BEGIN {
    plan skip_all => 'Must set FB_TEST_USERID & _PASSWD for live tests.'
        unless exists $ENV{FB_TEST_USERID} && exists $ENV{FB_TEST_PASSWD};
}

use Fedora::Bugzilla;

# three depends, two blocks
my $BUG = '476140';

my $bz  = Fedora::Bugzilla->new;
my $bug = $bz->bug($BUG);

isa_ok $bug => 'Fedora::Bugzilla::Bug';

=head2 depends

Validate that our depends checking works as we expect.

=cut

ok $bug->depends_on_anything, 'bug depends on other bugs';
is $bug->num_deps, 3, 'bug depends on 3 other bugs';

# check our depends
ok $bug->depends_on_bug($_), "bug depends on $_" for (qw{476141 476143 476155});

=head2 blocks

Validate that our blocks checking works as we expect

=cut

ok $bug->blocks_anything, 'bug blocks other bugs';
is $bug->num_blocked, 2,  'bug blocks 2 other bugs';

# check our depends
ok $bug->blocks_bug($_), "bug blocks $_" for (qw{478571 478572});

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
