%%%-------------------------------------------------------------------
%%% @author wangliangyou
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 14. 六月 2018 12:23
%%%-------------------------------------------------------------------
-module(strain).
-author("wangliangyou").

%% API
-export([
	test_version/0,
	keep/2,
	discard/2
]).

test_version() ->
	1.

keep(Fun, List) ->
	lists:filter(
		fun(Elem) ->
			Fun(Elem)
		end,
		List
	).

discard(Fun, List) ->
	lists:filter(
		fun(Elem) ->
			not Fun(Elem)
		end,
		List
	).
