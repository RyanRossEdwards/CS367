%% h(+State, +RoadNetwork, ?HValue)

h(State, RoadNetwork, HValue) :-
    %% Gets the states from the record in tsp.pl
    state_stillToVisitCitySet(State, UnvisitedList),

    get_Inbound_List(RoadNetwork, UnvisitedList, MinInboundList),
    sum_list(MinInboundList, HValue).


%% UnvisitedList:
%% [a,c,d,e]
%% [a,b,d,e]
%% [a,b,c,e]
%% [a,b,c,d]
%% [b,c,d,e]

%% MinInboundList
%% [5,2,3,3]
%% [5,2,3,3]
%% [5,2,2,3]
%% [5,2,2,3]
%% [2,2,3,3]



%% get_Inbound_List(+RoadNetwork, +UnvisitedList, -MinInboundList),
%% get list of min inbound costs

%% Base Case
get_Inbound_List(RoadNetwork, [],[]).

%% Recursive Case
get_Inbound_List(RoadNetwork, [City | UnvisitedTail], [MinCost | MinCostTail]) :-
    get_Min(RoadNetwork, City, MinCost),
    get_Inbound_List(RoadNetwork, UnvisitedTail, MinCostTail).


%% get_Min(+RoadNetwork, +City, -MinCost)
%% RoadNetwork doesn't change
%% City the letter 'a', 'b', 'e'
get_Min(RoadNetwork, City, MinCost) :-
    findall(Cost, get_Unvisited_Inbound_Cost(RoadNetwork, City, Cost), Solutions),
    min_list(Solutions, MinCost).


%% get the min Inbound cost
%% CityConnections [(b,5),(c,7),(d,7),(e,10)]

get_Unvisited_Inbound_Cost(RoadNetwork, City, Cost) :-
    %% Get all the cities
    member((_AnyCity, CityConnections), RoadNetwork),

    %% Inbound Costs for the 'City'
    member((City, Cost), CityConnections).
 





%% h/3 the zero heuristic
%% h(_, _, 0).



%% Test running with:
%% six_cities(RoadNetwork), h((a,[a,b,c,d,e,f]), RoadNetwork, HValue).

six_cities(RoadNetwork) :-
    [
        (a, [(b, 5), (f, 6)]),
        (b, [(a, 5), (e, 1), (c, 4)]),
        (c, [(b, 4), (f, 9), (d, 2)]),
        (d, [(e, 3), (c, 2), (f, 7)]),
        (e, [(b, 1), (d, 2)]),
        (f, [(a, 6), (c, 9), (d, 7)])
    ] = RoadNetwork.

