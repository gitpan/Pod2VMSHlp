#!perl 

# This version of the regression test ought to be able to run from
# systems that do not have Test.pm or the Test::Harness module.

# On VMS with perl 5.005_02 you'll probably need to run:
#    perl [.t]script.s

# use strict;
my $very_tidy = 1;
if ($very_tidy) {
    if (-e 't/testpod0.hlp') {
        1 while unlink('t/testpod0.hlp'); #Possibly pointless VMSism
    }
}
print "1..4\n";
my $code;
if ($^O eq 'VMS') {
    # $code = system("MCR $^X","-w","-Mstrict","-Mblib","pod2hlp",'t/testpod0.pod');
    $code = system("MCR $^X","-Mblib","pod2hlp",'t/testpod0.pod');
}
else {
    # $code = system($^X,"-w","-Mstrict","-Mblib","pod2hlp",'t/testpod0.pod');
    $code = system($^X,"-Mblib","pod2hlp",'t/testpod0.pod');
}
print +($code == 0 ? '' : 'not '), "ok 1\n";
open(REF,'<t/testpod0.ref');
my @ref=<REF>;
close(REF);
my $ref = join('',@ref);
open(HLP,'<t/testpod0.hlp');
my @hlp=<HLP>;
close(HLP);
my $hlp = join('',@hlp);
print "not " if $ref ne $hlp;
print "ok 2\n";
#print "hlp is:\n$hlp" if $ref ne $hlp;
####################################################
@ref=(); $ref='';
@hlp=(); $hlp='';
if ($^O eq 'VMS') {
    # $code = system("MCR $^X","-w","-Mstrict","-Mblib","pod2hlp",'t/testpod0.pod',"3");
    $code = system("MCR $^X","-Mblib","pod2hlp",'t/testpod0.pod',"3");
}
else {
    # $code = system($^X,"-w","-Mstrict","-Mblib","pod2hlp",'t/testpod0.pod',"3");
    $code = system($^X,"-Mblib","pod2hlp",'t/testpod0.pod',"3");
}
print +($code == 0 ? '' : 'not '), "ok 3\n";
open(REF,'<t/testpod1.ref');
@ref=<REF>;
close(REF);
$ref = join('',@ref);
open(HLP,'<t/testpod0.hlp');
@hlp=<HLP>;
close(HLP);
$hlp = join('',@hlp);
print "not " if $ref ne $hlp;
print "ok 4\n";
#print "hlp is:\n$hlp" if $ref ne $hlp;

# final cleanup
if ($very_tidy) {
    if (-e 't/testpod0.hlp') {
        1 while unlink('t/testpod0.hlp'); #Possibly pointless VMSism
    }
}

