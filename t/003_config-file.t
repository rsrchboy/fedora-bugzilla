#!/usr/bin/perl
#############################################################################
#
# Author:  Chris Weyl (cpan:RSRCHBOY), <cweyl@alumni.drew.edu>
# Company: No company, personal work
# Created: 10/15/2009
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

08.config-file.t - check the configuration file 

=head1 DESCRIPTION 

This test exercises the config file lookup of userid/password information.

=head1 TESTS

This module defines the following tests.

=cut

use strict;
use warnings;

use Test::More tests => 5;
use FindBin;

use Fedora::Bugzilla;

my $bz = Fedora::Bugzilla->new(config_file => "$FindBin::Bin/config.ini");
isa_ok $bz => 'Fedora::Bugzilla';

=head2 userid/passwd tests
=cut

ok !$bz->has_userid_cb, 'no userid_cb';
ok !$bz->has_passwd_cb, 'no passwd_cb';

is $bz->userid, 'fedora@foo.com', 'userid retrieved OK';
is $bz->passwd, 'feefifofum',     'passwd retrieved OK';

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


