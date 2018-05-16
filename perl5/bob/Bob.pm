# Declare package 'Bob' with version
package Bob 2;
use strict;
use warnings;

sub hey {
  my ($msg) = @_;
  if ( $msg eq '' || $msg =~ /^\s+$/ ) {
    return 'Fine. Be that way!';
  }
  elsif ( $msg =~ m/^[A-Z, ]+[\!\?]*$/ ) {
    return 'Whoa, chill out!';
  }
  elsif ( $msg =~ m/^[^a-z]+\!+$/ ) {
    return 'Whoa, chill out!';
  }
  elsif ( $msg =~ m/\?\s*$/ ) {
    return 'Sure.';
  }
  else {
    return 'Whatever.';
  }
}

1;
