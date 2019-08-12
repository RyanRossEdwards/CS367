%% occupant(house, nat)
occupant(red, brit).
occupant(green, X) :- drinkOf(coffee, X).
occupant(yellow, X) :- smoke(dunhill, X).

petOf(dog, swede).
petOf(bird, X) :- smoke(pallmall, X).

drinkOf(tea, dane).
drinkOf(coffee, X) :- occupant(green, X).
drinkOf(beer, X) :- smoke(bluemaster, X).

smoke(pallmall, X) :- petOf(bird, X).
smoke(dunhill, X) :- occupant(yellow, X).
smoke(bluemaster, X) :- drinkOf(beer, X).
smoke(prince, german).

