%%%-------------------------------------------------------------------
%%% @author wangliangyou
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 20:45
%%%-------------------------------------------------------------------
-module(bob).
-author("wangliangyou").

%% API
-export([
	test_version/0,
	response/1
]).

-define(TALK_TYPE_ASK, 1).			% ask a question
-define(TALK_TYPE_YELL, 2).			% yell at him
-define(TALK_TYPE_NOTHING, 3).		% saying nothing
-define(TALK_TYPE_OTHER, 4).		% other else

-define(BOB_RESPONSE_MAP,
	#{
		?TALK_TYPE_ASK => "Sure.",
		?TALK_TYPE_YELL => "Whoa, chill out!",
		?TALK_TYPE_NOTHING => "Fine. Be that way!",
		?TALK_TYPE_OTHER => "Whatever."
	}
).

test_version() ->
	3.

response(String) when is_list(String) ->
	TalkType =
	case is_yell(String) of
		true -> ?TALK_TYPE_YELL;
		false ->
			case is_question(string:trim(String)) of
				true -> ?TALK_TYPE_ASK;
				false ->
					case is_nothing(String) of
						true -> ?TALK_TYPE_NOTHING;
						false -> ?TALK_TYPE_OTHER
					end
			end
	end,
	maps:get(TalkType, ?BOB_RESPONSE_MAP).

%% @doc 判断字符串是否为一句问题
is_question([]) ->
	false;
is_question(String) ->
	Len = string:length(String),
	string:slice(String, Len-1) =:= "?".

%% @doc 判断是否吼他, 包含字母且字母全都是大写
is_yell(String) ->
	catch lists:foldl(
		fun(Char, Acc) ->
			case is_alphabet(Char) of
				false -> Acc;
				true ->
					case is_upper_case_alphabet(Char) of
						false -> throw(false);
						true -> true
					end
			end
		end,
		false,
		String
	).

%% @doc 判断是否什么都没说, 只要包含数字或字母就不是什么都没说
is_nothing(String) ->
	not lists:any(
		fun(Char) ->
			is_alphabet(Char) orelse is_digit(Char)
		end,
		String
	).

%% @doc 判断input是否为字母
is_alphabet(Char) when $a =< Char andalso Char =< $z ->
	true;
is_alphabet(Char) when $A =< Char andalso Char =< $Z ->
	true;
is_alphabet(_Char) ->
	false.

%% @doc 判断input是否为大写字母
is_upper_case_alphabet(Char) when $A =< Char andalso Char =< $Z ->
	true;
is_upper_case_alphabet(_Char) ->
	false.

%% @doc 判断input是否为小写字母
is_lower_case_alphabet(Char) when $a =< Char andalso Char =< $z ->
	true;
is_lower_case_alphabet(_Char) ->
	false.

%% @doc 判断input是否为数字
is_digit(Char) when $0 =< Char andalso Char =< $9 ->
	true;
is_digit(_Char) ->
	false.
