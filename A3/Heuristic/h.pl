%% h/3 the zero heuristic

%% h(_, _, 0).


six_cities(RoadNetwork) :-
    [
        (a, [(b, 5), (f, 6)]),
        (b, [(a, 5), (e, 1), (c, 4)]),
        (c, [(b, 4), (f, 9), (d, 2)]),
        (d, [(e, 3), (c, 2), (f, 7)]),
        (e, [(b, 1), (d, 2)]),
        (f, [(a, 6), (c, 9), (d, 7)])
    ] = RoadNetwork.


%% Test running with:
%% six_cities(RoadNetwork), h((a,[a,b,c,d,e,f]), RoadNetwork, HValue).



%%+State, +RoadNetwork, ?HValue

h(State, RoadNetwork, HValue) :-
    %% State = (_,UnvisitedList),
    state_stillToVisitCitySet(State, UnvisitedList),
    getList(RoadNetwork, UnvisitedList, MinEdgeList),
    getHValue(MinEdgeList, HValue).

% get the min edge cost
getUnvisitedCost(RoadNetwork, City, Cost) :-
  member((_, Edges), RoadNetwork),
  member((City, Cost), Edges).
 
getMin(RoadNetwork, City, MinCost) :-
    findall(Cost, getUnvisitedCost(RoadNetwork, City, Cost), Solutions),
    sort(Solutions, SortedSolutions),
    SortedSolutions = [MinCost | _].


% get list of min edge costs
getList(RoadNetwork, [],[]).

getList(RoadNetwork, [City | RestUnvisited], [MinCost|MinCostRest]) :-
    getMin(RoadNetwork, City, MinCost),
    getList(RoadNetwork, RestUnvisited, MinCostRest).


getHValue(MinEdgeList, HValue) :-
    sum_list(MinEdgeList, HValue).

