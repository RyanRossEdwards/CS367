
%% These are test cases

female(mary).
female(ann).

parentOf(sue, mary).
parentOf(ed, mary).

parentOf(sue, ann).
parentOf(sam, ann).

%% This is the code

halfSisterOf(X,Y) :-
    parentOf(Z,X),
    parentOf(Z,Y),
    parentOf(A,X),
    parentOf(B,Y),
    A \= B,
    Z \= A,
    Z \= B,
    female(X).



%% hasParents(X) :-
%%     parentOf(Z,X),
%%     parentOf(Y,X),
%%     Z \= Y.