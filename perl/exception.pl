use Exception::Class (
    'MyException',
 
    'AnotherException' => { isa => 'MyException' },
 
    'YetAnotherException' => {
        isa         => 'AnotherException',
        description => 'These exceptions are related to IPC'
    },
 
    'ExceptionWithFields' => {
        isa    => 'YetAnotherException',
        fields => [ 'grandiosity', 'quixotic' ],
        alias  => 'throw_fields',
    },
);
use Scalar::Util qw( blessed );
use Try::Tiny;
 
try {
    MyException->throw( error => 'I feel funny.' );
}
catch {
    die $_ unless blessed $_ && $_->can('rethrow');
 
    if ( $_->isa('Exception::Class') ) {
        warn $_->error, "\n", $_->trace->as_string, "\n";
        warn join ' ', $_->euid, $_->egid, $_->uid, $_->gid, $_->pid, $_->time;
 
        exit;
    }
    elsif ( $_->isa('ExceptionWithFields') ) {
        if ( $_->quixotic ) {
            handle_quixotic_exception();
        }
        else {
            handle_non_quixotic_exception();
        }
    }
    else {
        $_->rethrow;
    }
};
 
# without Try::Tiny
eval { ... };
if ( my $e = Exception::Class->caught ) { ... }
 
# use an alias - without parens subroutine name is checked at
# compile time
throw_fields error => "No strawberry", grandiosity => "quite a bit";