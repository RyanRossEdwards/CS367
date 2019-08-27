%% RoadNetwork test cases

one_city(RoadNetwork) :-
    [ (a, []) ] = RoadNetwork.

two_cities(RoadNetwork) :-
    [
        (a, [(b, 2)]),
        (b, [(a, 1)])
    ] = RoadNetwork.

six_cities(RoadNetwork) :-
    [
        (a, [(b, 5), (f, 6)]),
        (b, [(a, 5), (e, 1), (c, 4)]),
        (c, [(b, 4), (f, 9), (d, 2)]),
        (d, [(e, 3), (c, 2), (f, 7)]),
        (e, [(b, 1), (d, 2)]),
        (f, [(a, 6), (c, 9), (d, 7)])
    ] = RoadNetwork.

%% Notes
%% Usage example:
%% six_cities(RoadNetwork), solution([a], RoadNetwork, SolutionCost, SolutionPath).

%% six_cities(R), member( (a, Edges), R).
%% R = [(a, [(b, 5),  ...
%% Edges = [(b, 5),  (f, 6)] ;

%% six_cities(R), member( (a, Edges), R), member( (b, Cost), Edges).
%% R = [(a, [(b, 5),  ...
%% Edges = [(b, 5),  (f, 6)] ;
%% Cost = 5

%% Could change 'b' to 'Roads' above to get cost per road


%% ?- reverse([1,2,3], X).
%% X = [3, 2, 1].






%% Usage example:
%% two_cities(RoadNetwork), solution([a], RoadNetwork, SolutionCost, SolutionPath).
%% six_cities(RoadNetwork), solution([a], RoadNetwork, SolutionCost, SolutionPath).



%% connected_city(+RoadNetwork, +State, -NextState, -Cost)
connected_city(RoadNetwork, State, NextState, Cost) :-
    member( (State, Edges), RoadNetwork),
    member( (NextState, Cost), Edges).


%% solution(+Path, +RoadNetwork, -SolutionCost, -SolutionPath)
%% This is for presentation / assignment requirements
solution(Path, RoadNetwork, SolutionCost, SolutionPath) :-
    solution_recursive(Path, RoadNetwork, [0], SolutionCost, SolutionPath).



%% SolutionPath -> [1st,2nd,3rd]
%% Path -> [3rd, 2nd, 1st]


%% Base Case
solution_recursive(Path, RoadNetwork, SolutionCostList, SolutionCost, SolutionPath) :-
    length(RoadNetwork, Cities),
    length(Path, Visited),
    X is Cities + 1,
    Visited = X,

    reverse(Path, SolutionPath),

    [Goal | _Rest] = SolutionPath,
    [State | _Rest] = Path,
    Goal = State,

    sum_list(SolutionCostList, SolutionCost).


%% Recursive Case
solution_recursive(Path, RoadNetwork, SolutionCostList, SolutionCost, SolutionPath) :-
    %% Making it a depth limited search
    length(RoadNetwork, Cities),
    length(Path, Visited),
    X is Cities + 1,
    Visited < X,

    %% Need to add code with a list of visited cities or might not work

    [State | _Rest] = Path,
    connected_city(RoadNetwork, State, NextState, Cost),


    solution_recursive([NextState | Path], RoadNetwork, [Cost | SolutionCostList], SolutionCost, SolutionPath).




















































