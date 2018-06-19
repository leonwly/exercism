%%%-------------------------------------------------------------------
%%% @author wangliangyou
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 17:08
%%%-------------------------------------------------------------------
-module(raindrops).
-author("wangliangyou").

%% API
-export([
	test_version/0,
	convert/1
]).

-define(FACTOR_STRING_MAP,
	#{3 => "Pling", 5 => "Plang", 7 => "Plong"}
).

test_version() ->
	1.

convert(0) ->
	"0";
convert(Number) when is_integer(Number) ->
	ResultList =
		maps:fold(
			fun(Factor, String, Acc) ->
				if
					Number rem Factor =:= 0 -> [String|Acc];
					true -> Acc
				end
			end,
			[],
			?FACTOR_STRING_MAP
		),
	case ResultList of
		[] -> integer_to_list(Number);
		_ -> lists:append(lists:reverse(ResultList))
	end.
