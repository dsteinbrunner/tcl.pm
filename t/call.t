# call.t
#
# Tests for the 'call' and 'icall' functions.
#

use Tcl;

$| = 1;

print "1..8\n";

$i = Tcl->new;

$i->EvalFileHandle(\*DATA);

$res = $i->call('set', 'var', "ok 1");
print "$res\n";

$res = $i->icall('set', 'var', "ok 2");
print "$res\n";

@res = $i->call('set', 'var', ['ok', '3']);
print STDOUT join(' ', @res), "\n";

@res = $i->icall('set', 'var', ['ok', '4']);
print STDOUT join(' ', @res), "\n";

($a, $b) = $i->call('list', '5', 'ok');
print "$b $a\n";

($a, $b) = $i->icall('list', '6', 'ok');
print "$b $a\n";

#$i->call('if', '1', ['set', 'a', '1']);

$i->call("puts", "ok 7");

$i->icall("puts", "ok 8");

__END__
set purelist [list a 5 c]
set strlist  [list a 6 c] ; string length $strlist

#set foo ok
#set bar 5
#puts "$foo $bar"