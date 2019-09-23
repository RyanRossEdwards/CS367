/* 
This file  is used to load all the files needed to load the files
necessary to run the blind search, you can modify it to add whatever
testfiles you want loaded.

*/
:- [solution, tsp, h].


%% nativeProblem(domainProblem([a,
%% 			     [(a, [(b, 5), (f, 6)]),
%% 			      (b, [(a, 5), (e, 1), (c, 4)]),
%% 			      (c, [(b, 4), (f, 9), (d, 2)]),
%% 			      (d, [(e, 3), (c, 2), (f, 7)]),
%% 			      (e, [(b, 1), (d, 2)]),
%% 			      (f, [(a, 6), (c, 9), (d, 7)])]])).

nativeProblem(domainProblem([a,
    [(a, [(b, 12), (c, 10), (d, 19), (e, 8)]),
    (b, [(a, 12), (c, 3), (d, 7), (e, 2)]),
    (c, [(a, 10), (b, 3), (d, 6), (e, 20)]),
    (d, [(a, 19), (b, 7), (c, 6), (e, 4)]),
    (e, [(a, 8), (b, 2), (c, 20), (d, 4)])]])).

example(Cost, Path) :-
    nativeProblem(NativeProblem),
    solution(NativeProblem, Cost, Path).
