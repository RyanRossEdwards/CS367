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


%% solution(Path, RoadNetwork, SolutionCost, SolutionPath) :-

