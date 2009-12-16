#############################################################################
#
# Author:  Chris Weyl (cpan:RSRCHBOY), <cweyl@alumni.drew.edu>
# Company: No company, personal work
# Created: 01/06/2009 06:41:07 PM PST
#
# Copyright (c) 2009 Chris Weyl <cweyl@alumni.drew.edu>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
#############################################################################

# play with perl-Moose for testing
#my $BUG = '465913';
my $BUG = '205321';

sub env_login_check {
    my $num_tests = shift @_;

    plan skip_all => 'Must set FB_TEST_USERID & _PASSWD for live tests.'
        unless exists $ENV{FB_TEST_USERID} && exists $ENV{FB_TEST_PASSWD};

    plan tests => $num_tests if $num_tests;
}

#use Fedora::Bugzilla;

sub login_to_bz {

    my $bz = Fedora::Bugzilla->new(
        userid => $ENV{FB_TEST_USERID},
        passwd => $ENV{FB_TEST_PASSWD},
    );

    is  $bz->login > 0,  1, 'Login worked';

    return $bz;
}

# get the perl-Moose review bug, and run a couple tests on it to make sure we
# got the correct one back.  (Not that we wouldn't, but...)

sub get_moose_review_bug {
    my $bz = shift @_;

    my $bug = $bz->bug(205321);
    isa_ok $bug, 'Fedora::Bugzilla::Bug';
    is $bug->alias, 'perl-Moose', 'alias is correct';

    ## test an "interesting" one
    #is $bug->url eq $bug->bug_file_loc, 1, 'url and bug_file_loc are the same';
    #is $bug->url, 'http://search.cpan.org/dist/Moose/', 'url is correct';

    return $bug;
}

__END__

=head1 CONFIGURATION AND ENVIRONMENT

The env. variables FB_TEST_USERID and FB_TEST_PASSWD must be set.

=head1 AUTHOR

Chris Weyl  <cweyl@alumni.drew.edu>


=head1 LICENSE AND COPYRIGHT

Copyright (c) 2009 Chris Weyl <cweyl@alumni.drew.edu>

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



