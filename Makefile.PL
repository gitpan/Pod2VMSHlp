use ExtUtils::MakeMaker;

WriteMakefile(
    'NAME'         => 'Pod2VMSHlp',
    'INSTALLDIRS'  => 'perl',
    'EXE_FILES'    => [qw(pod2hlp pod2hlb)],
    'PMLIBDIRS'    => [qw(Pod)],
    'linkext'      => { LINKTYPE => ''},
    'dist'         => { COMPRESS => 'gzip -f9', SUFFIX => '.gz' },
    'VERSION_FROM' => 'Pod/Hlp.pm',
);

