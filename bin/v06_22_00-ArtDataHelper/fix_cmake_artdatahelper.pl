use strict;

use vars qw(%dir_list);
BEGIN { %dir_list = (
	"lardata_RecoBaseArt_Dumpers" => "lardata_ArtDataHelper_Dumpers",
	"lardata_RecoBaseArt" => "lardata_ArtDataHelper"
                       ); }

foreach my $lib (sort keys %dir_list) {
   next if m&add_subdirectory&i;
   next if m&simple_plugin&i;
   next if m&SUBDIRNAME&i;
   next if m&SUBDIRS&i;
  #s&\b\Q${lib}\E([^\.\s]*\b)([^\.]|$)&$dir_list{$lib}${1}${2}&g and last;
  s&\b\Q${lib}\E\b([^\.]|$)&$dir_list{$lib}${1}${2}&g and last;
}
