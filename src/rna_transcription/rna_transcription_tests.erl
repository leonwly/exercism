%%%-------------------------------------------------------------------
%%% @author wangliangyou
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 17:59
%%%-------------------------------------------------------------------
-module(rna_transcription_tests).
-author("wangliangyou").

-include_lib("eunit/include/eunit.hrl").

simple_test() ->
	?assert(true).

rna_complement_of_cytosine_is_guanine_test() ->
	?assertMatch("G", rna_transcription:to_rna("C")).

rna_complement_of_guanine_is_cytosine_test() ->
	?assertMatch("C", rna_transcription:to_rna("G")).

rna_complement_of_thymine_is_adenine_test() ->
	?assertMatch("A", rna_transcription:to_rna("T")).

rna_complement_of_adenine_is_uracil_test() ->
	?assertMatch("U", rna_transcription:to_rna("A")).

rna_complement_test() ->
	?assertMatch("UGCACCAGAAUU",
		rna_transcription:to_rna("ACGTGGTCTTAA")).

correctly_handles_invalid_input_rna_instead_of_dna_test() ->
	?assertMatch(error, rna_transcription:to_rna("U")).

correctly_handles_completely_invalid_dna_input_test() ->
	?assertMatch(error, rna_transcription:to_rna("XXX")).

correctly_handles_partially_invalid_dna_input_test() ->
	?assertMatch(error,
		rna_transcription:to_rna("ACGTXXXCTTAA")).

version_test() ->
	?assertMatch(1, rna_transcription:test_version()).
