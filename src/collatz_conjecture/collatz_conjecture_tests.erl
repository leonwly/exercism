%%%-------------------------------------------------------------------
%%% @author wangliangyou
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 15:24
%%%-------------------------------------------------------------------
-module(collatz_conjecture_tests).
-author("wangliangyou").

-include_lib("eunit/include/eunit.hrl").

simple_test() ->
	?assert(true).

zero_steps_for_one_test() ->
	?assertMatch(0, collatz_conjecture:steps(1)).

divide_if_even_test() ->
	?assertMatch(4, collatz_conjecture:steps(16)).

even_and_odd_steps_test() ->
	?assertMatch(9, collatz_conjecture:steps(12)).

large_number_of_even_and_odd_steps_test() ->
	?assertMatch(152, collatz_conjecture:steps(1000000)).

zero_is_an_error_test() ->
	?assertMatch({error,
		"Only positive numbers are allowed"},
		collatz_conjecture:steps(0)).

negative_value_is_an_error_test() ->
	?assertMatch({error,
		"Only positive numbers are allowed"},
		collatz_conjecture:steps(-15)).

version_test() ->
	?assertMatch(1, collatz_conjecture:test_version()).

some_test_() ->
	Tests = [
		{0, 1},
		{4, 16},
		{9, 12},
		{152, 1000000},
		{{error, "Only positive numbers are allowed"}, 0},
		{{error, "Only positive numbers are allowed"}, -15}
	],
	[fun() -> ?assertMatch(Result, collatz_conjecture:steps(Value)) end || {Result, Value} <- Tests].
