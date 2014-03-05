package CIF::Message::Submission;

use strict;
use warnings;


use Mouse;
use CIF::Type;

has 'Observables' => (
    is      => 'ro',
    isa     => 'ArrayRef',
    reader  => 'get_Observables',
);

has 'Results'   => (
    is      => 'rw',
    isa     => 'ArrayRef',
    reader  => 'get_Results',
    writer  => 'set_Results',
); 
   
sub understands {
    my $self = shift;
    my $args = shift;

    return unless($args->{'rtype'});
    return 1 if($args->{'rtype'} eq 'submission');
}

sub TO_JSON {
    my $self = shift;

    my $ret = {
        'Observables'   => $self->get_Observables(),
        'Results'       => $self->get_Results(),
    };
    return $ret;
}

__PACKAGE__->meta()->make_immutable();

1;