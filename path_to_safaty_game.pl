move([X,Y],[NX,Y],Move):-
    X - 1 >= 0,
    NX is X - 1 ,
    Move = up.

move([X,Y],[NX,Y],Move):-
    dim(X1,_),
    X + 1 < X1 ,
    NX is X + 1 ,
    Move = down.

move([X,Y],[X,NY],Move):-
    Y - 1 >= 0,
    NY is Y - 1 ,
    Move = left.

move([X,Y],[X,NY],Move):-
    dim(_,Y1),
    Y + 1 < Y1,
    NY is Y + 1 ,
    Move = right.

starCheck(Position,Num,NewNum):-
    star(Position),
    NewNum is Num + 1 ,!.
starCheck(_,Num,Num).

isMember(X,[X|_]):-!.
isMember(X,[_|T]):-
    isMember(X,T).

appendToList([],Move,Move).
appendToList([H|T],Move,[H|T1]):-
    appendToList(T,Move,T1).


play(X,Y):-
    start(S),
    end(E),
    play(S,E,[S],0,[],X,Y).

play(E,E,_,NumStar,Moves,Moves,NumStar):-!.

play(Curr,End,Visited,Count,Tem,Moves,StarNum):-
    move(Curr,Next,Move),
    not(isMember(Next,Visited)),
    not(bomb(Next)),
    starCheck(Next,Count,NewCount),
    appendToList(Tem,[Move],Ntem),
    play(Next,End,[Next|Visited],NewCount,Ntem,Moves,StarNum).












