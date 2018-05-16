package Decimal;
use strict;
use POSIX;

sub new {
    my ($self, $value) = @_;
    my $variables = {
        '_value' => $value,
        '_lookup' => [
            [ 'M', 1000 ],
            [ 'D',  500 ],
            [ 'C',  100 ],
            [ 'L' , 50 ],
            [ 'X' , 10 ],
            [ 'V',   5 ],
            [ 'I',   1 ],
        ],
    };
    return bless $variables, $self;
}

sub to_roman {
    my ($self) = @_;
    my $roman = '';

    my $previous_roman = '';
    for my $conversion_set (@{$self->{'_lookup'}}) {
        my $div = floor($self->{'_value'} / $conversion_set->[1]);

        $roman .= $conversion_set->[0] x $div;
        $self->{'_value'} = $self->{'_value'} % $conversion_set->[1];

        $roman =~ s/(.*)(.)\2{3}$/$1$2$previous_roman/;
        $previous_roman = $conversion_set->[0];
    }

    return $roman;
}

1;
