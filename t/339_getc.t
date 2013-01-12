# This file is encoded in Latin-9.
die "This file is not encoded in Latin-9.\n" if q{‚ } ne "\x82\xa0";

use Char::Latin9;
print "1..1\n";

my $__FILE__ = __FILE__;

my @getc = ();
while (my $c = Char::Latin9::getc(DATA)) {
    last if $c eq "\n";
    push @getc, $c;
}
my $result = join('', map {"($_)"} @getc);

if ($result eq '(1)(2)(±)(²)') {
    print "ok - 1 $^X $__FILE__ 12±² --> $result.\n";
}
else {
    print "not ok - 1 $^X $__FILE__ 12±² --> $result.\n";
}

__END__
12±²
