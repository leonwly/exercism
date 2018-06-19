%%%-------------------------------------------------------------------
%%% @author wangliangyou
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. 六月 2018 11:52
%%%-------------------------------------------------------------------
-module(collatz_conjecture).
-author("wangliangyou").

%% API
-export([
	steps/1,
	test_version/0
]).

%% @doc 根据input的数字, 返回执行到1所用的步数
steps(Number) ->
	steps_1(Number, 0).

%% @doc 返回测试版本号
test_version() ->
	1.

steps_1(Number, _Acc) when Number =< 0 ->
	{error, "Only positive numbers are allowed"};
steps_1(1, Acc) ->
	Acc;
steps_1(Number, Acc) when Number rem 2 =:= 0 ->
	steps_1(Number div 2, Acc + 1);
steps_1(Number, Acc) when Number rem 2 =:= 1 ->
	steps_1(Number * 3 + 1, Acc + 1).
