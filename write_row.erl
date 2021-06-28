-module(write_row).
-export([f/1, fu/1]).


iterateArray([H|T]) ->  
  f(H),
  iterateArray(T).

 fu(N) ->
   Array = writeRows(N),
    % io:fwrite("~s\n", [Array]),
   iterateArray(Array).

f({X1,X2}) ->
   io:fwrite("~p ", [X1]),
   io:fwrite("~p\n", [X2]),
   Res = X1>X2,
   case Res of 
     true -> io:fwrite("~s\n", [writeRow2(X1,X2,"#", "+")]);
     _ -> io:fwrite("~s\n", [writeRow2(X2,X1,"+", "#")])
    end.


writeRow2(N, N2,C1, C2)-> go(N,N, N2, "", C1, C2).
go(0,_,_, Str,_,_)-> 
  Str;
go(Num,Num1 ,Num2, Str, Char1, Char2)->
  Res = (Num) > Num2,
  io:fwrite("~p ", [Num]),
  io:fwrite("~s ", [Res]),
   io:fwrite("~p\n", [Num2]),
  case Res of
    true ->  go((Num-1),Num1 , Num2, (string:concat(Str, Char1)),Char1,Char2);
    false -> go((Num-1), Num1,Num2, (string:concat(Str, Char2)),Char1,Char2)
  end.


writeRows(N)-> go_w_rows(N,N,[]).

go_w_rows(1,_,List) -> List;

go_w_rows(Num1,Num2,List) ->
  go_w_rows(Num1-1, Num2, [{Num1-1, Num2 - Num1 +1}|List]).

  
