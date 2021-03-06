%%%-------------------------------------------------------------------
%%% @author wangliangyou
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 六月 2018 11:23
%%%-------------------------------------------------------------------
-module(bob_tests).
-author("wangliangyou").

-include_lib("eunit/include/eunit.hrl").

simple_test() ->
	?assert(true).

stating_something_test() ->
	?assertMatch("Whatever.",
		bob:response("Tom-ay-to, tom-aaaah-to.")).

shouting_test() ->
	?assertMatch("Whoa, chill out!",
		bob:response("WATCH OUT!")).

shouting_gibberish_test() ->
	?assertMatch("Whoa, chill out!",
		bob:response("FCECDFCAAB")).

asking_a_question_test() ->
	?assertMatch("Sure.",
		bob:response("Does this cryogenic chamber make me "
		"look fat?")).

asking_a_numeric_question_test() ->
	?assertMatch("Sure.",
		bob:response("You are, what, like 15?")).

asking_gibberish_test() ->
	?assertMatch("Sure.", bob:response("fffbbcbeab?")).

talking_forcefully_test() ->
	?assertMatch("Whatever.",
		bob:response("Let's go make out behind the gym!")).

using_acronyms_in_regular_speech_test() ->
	?assertMatch("Whatever.",
		bob:response("It's OK if you don't want to go to the "
		"DMV.")).

forceful_question_test() ->
	?assertMatch("Whoa, chill out!",
		bob:response("WHAT THE HELL WERE YOU THINKING?")).

shouting_numbers_test() ->
	?assertMatch("Whoa, chill out!",
		bob:response("1, 2, 3 GO!")).

only_numbers_test() ->
	?assertMatch("Whatever.", bob:response("1, 2, 3")).

question_with_only_numbers_test() ->
	?assertMatch("Sure.", bob:response("4?")).

shouting_with_special_characters_test() ->
	?assertMatch("Whoa, chill out!",
		bob:response("ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!")).

shouting_with_no_exclamation_mark_test() ->
	?assertMatch("Whoa, chill out!",
		bob:response("I HATE YOU")).

statement_containing_question_mark_test() ->
	?assertMatch("Whatever.",
		bob:response("Ending with ? means a question.")).

non_letters_with_question_test() ->
	?assertMatch("Sure.", bob:response(":) ?")).

prattling_on_test() ->
	?assertMatch("Sure.",
		bob:response("Wait! Hang on. Are you going to be OK?")).

silence_test() ->
	?assertMatch("Fine. Be that way!", bob:response([])).

prolonged_silence_test() ->
	?assertMatch("Fine. Be that way!",
		bob:response("          ")).

alternate_silence_test() ->
	?assertMatch("Fine. Be that way!",
		bob:response("\t\t\t\t\t\t\t\t\t\t")).

multiple_line_question_test() ->
	?assertMatch("Whatever.",
		bob:response("\nDoes this cryogenic chamber make me "
		"look fat?\nno")).

starting_with_whitespace_test() ->
	?assertMatch("Whatever.",
		bob:response("         hmmmmmmm...")).

ending_with_whitespace_test() ->
	?assertMatch("Sure.",
		bob:response("Okay if like my  spacebar  quite a bit?   ")).

other_whitespace_test() ->
	?assertMatch("Fine. Be that way!",
		bob:response("\n\r \t")).

non_question_ending_with_whitespace_test() ->
	?assertMatch("Whatever.",
		bob:response("This is a statement ending with whitespace "
		"     ")).

version_test() -> ?assertMatch(3, bob:test_version()).
