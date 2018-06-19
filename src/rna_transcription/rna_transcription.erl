%%%-------------------------------------------------------------------
%%% @author wangliangyou
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 17:48
%%%-------------------------------------------------------------------
-module(rna_transcription).
-author("wangliangyou").

%% API
-export([
	test_version/0,
	to_rna/1
]).

-define(DNA_TO_RNA_MAP,
	#{"G" => "C", "C" => "G", "T" => "A", "A" => "U"}
).

test_version() ->
	1.

to_rna(String) when is_list(String) ->
	Result =
		(catch lists:foldl(
			fun(C, Acc) ->
				S = string:chars(C, 1),
				case maps:find(S, ?DNA_TO_RNA_MAP) of
					error -> throw(error);
					{ok, Value} -> [Value|Acc]
				end
			end,
			[],
			String
		)),
	case Result of
		error -> error;
		_ -> lists:flatten(lists:reverse(Result))
	end.
