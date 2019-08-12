%% To run with 
%% $ gprolog --consult-file einstein.pl

:- use_module(library(lists)).  %% to load permutation/2


/* layout of person data item */
person(person(Nationality, HouseColor, HouseNo, Drink, Pet, Smoke),
    Nationality, HouseColor, HouseNo, Drink, Pet, Smoke).

/* 
   field accessors/setters for amateur data item
   general form: person_<field name>(<amateur data item>, <field value>)
   these predicates can be used both for accessing and for setting the field values
 */
person_Nationality(person(Nationality, _HouseColor, _HouseNo, _Drink, _Pet, _Smoke), Nationality).
person_HouseColor(person(_Nationality, HouseColor, _HouseNo, _Drink, _Pet, _Smoke), HouseColor).
person_HouseNo(person(_Nationality, _HouseColor, HouseNo, _Drink, _Pet, _Smoke), HouseNo).
person_Drink(person(_Nationality, _HouseColor, _HouseNo, Drink, _Pet, _Smoke), Drink).
person_Pet(person(_Nationality, _HouseColor, _HouseNo, _Drink, Pet, _Smoke), Pet).
person_Smoke(person(_Nationality, _HouseColor, _HouseNo, _Drink, _Pet, Smoke), Smoke).

/*
    these are the domains (possible values) for the different fields, they were manually
    extracted from the puzzle descriptions

*/
nationalities([brit, swede, dane, german, norwegian]).
houseColors([red, green, yellow, white, blue]).
houseNos([0, 1, 2, 3, 4]).
drinks([tea, coffee, beer, milk, water]).
pets([dog, bird, cat, horse, fish]).
smokes([pallmall, dunhill, bluemaster, prince, blend]).

/*
   This is the actual encoding of the clues 
*/
solution(Persons) :-
    /*
      Persons is the variable containing the person data items for
      each person in the puzzle
      */
    Persons = [Brit, Swede, Dane, German, Norwegian],


    /*
      setting up the values that we already know
    */
    person(Brit, brit,
        BritHouseColor, BritHouseNo, BritDrink, BritPet, BritSmoke),
    person(Swede, swede,
        SwedeHouseColor, SwedeHouseNo, SwedeDrink, SwedePet, SwedeSmoke),
    person(Dane, dane,
        DaneHouseColor, DaneHouseNo, DaneDrink, DanePet, DaneSmoke),
    person(German, german,
        GermanHouseColor, GermanHouseNo, GermanDrink, GermanPet, GermanSmoke),
    person(Norwegian, norwegian,
        NorwegianHouseColor, NorwegianHouseNo, NorwegianDrink, NorwegianPet, NorwegianSmoke),

    houseColors(HouseColors),
    houseNos(HouseNos),
    drinks(Drinks),
    pets(Pets),
    smokes(Smokes),


    %% POSITIVE CLUES
    %% clue 1 - the Brit lives in the red house
    person_HouseColor(Brit, red),

    %% clue 2 - the Swede keeps dogs as pets
    person_Pet(Swede, dog),

    %% clue 3 - the Dane drinks tea
    person_Drink(Dane, tea),

    %% clue 4 - the green house is on the left of the white house
    person_HouseColor(Green, green),
    member(Green, Persons),
    person_HouseNo(Green, GreenHouseNo),
    member(GreenHouseNo, HouseNos),

    person_HouseColor(White, white),
    member(White, Persons),
    person_HouseNo(White, WhiteHouseNo),
    member(WhiteHouseNo, HouseNos),

    %% (GreenHouseNo is WhiteHouseNo +1;

    %% Below is for 'Left' on either side (as 'left' depends on perspective)
    %% This will give two alternative outputs, which considering this is a
    %% riddle (implies one answer), using the alternative that left is -1

    %% (GreenHouseNo is WhiteHouseNo +1;
    %% GreenHouseNo is WhiteHouseNo -1),
   
    %% Assuming left is the house closer to the first house (first houseNo = 0)

    GreenHouseNo is WhiteHouseNo -1,



    %% clue 5 - the green house’s owner drinks coffee
    person_HouseColor(Green, green),
    member(Green, Persons),
    person_Drink(Green, coffee),

    %% clue 6 - the person who smokes Pall Mall rears birds
    person_Smoke(Pallmall, pallmall),
    member(Pallmall, Persons),
    person_Pet(Pallmall, bird),

    %% clue 7 - the owner of the yellow house smokes Dunhill
    person_HouseColor(Yellow, yellow),
    member(Yellow, Persons),
    person_Smoke(Yellow, dunhill),

    %% clue 8 - the man living in the center house drinks milk
    %% House No are [0,1,2,3,4] so 2 is the middle house
    person_Drink(Milk, milk),
    member(Milk, Persons),
    person_HouseNo(Milk, 2),

    %% clue 9 - the Norwegian lives in the first house
    person_HouseNo(Norwegian, 0),

    %% clue 10 - the man who smokes blend lives next to the one who keeps cats
    person_Smoke(Blend, blend),
    member(Blend, Persons),
    person_HouseNo(Blend, BlendHouseNo),
    member(BlendHouseNo, HouseNos),

    person_Pet(Cat, cat),
    member(Cat, Persons),
    person_HouseNo(Cat, CatHouseNo),
    member(CatHouseNo, HouseNos),

    (BlendHouseNo is CatHouseNo +1;
    BlendHouseNo is CatHouseNo -1),

    %% clue 11 - the man who has a horse lives next to the man who smokes Dunhill
    person_Pet(Horse, horse),
    member(Horse, Persons),
    person_HouseNo(Horse, HorseHouseNo),
    member(HorseHouseNo, HouseNos),

    person_Smoke(Dunhill, dunhill),
    member(Dunhill, Persons),
    person_HouseNo(Dunhill, DunhillHouseNo),
    member(DunhillHouseNo, HouseNos),

    (HorseHouseNo is DunhillHouseNo +1;
    HorseHouseNo is DunhillHouseNo -1),

    %% clue 12 - the owner who smokes BlueMaster drinks beer
    person_Smoke(Bluemaster, bluemaster),
    member(Bluemaster, Persons),
    person_Drink(Bluemaster, beer),

    %% clue 13 - the German smokes Prince
    person_Smoke(German, prince),

    %% clue 14 - the Norwegian lives next to the blue house
    person_HouseColor(Blue, blue),
    member(Blue, Persons),
    person_HouseNo(Blue, BlueHouseNo),
    member(BlueHouseNo, HouseNos),

    member(NorwegianHouseNo, HouseNos),
    (BlueHouseNo is NorwegianHouseNo +1;
    BlueHouseNo is NorwegianHouseNo -1),

    %% clue 15 - the man who smokes blend has a neighbor who drinks water
    person_Smoke(Blend, blend),
    member(Blend, Persons),
    person_HouseNo(Blend, BlendHouseNo),
    member(BlendHouseNo, HouseNos),

    person_Drink(Water, water),
    member(Water, Persons),
    person_HouseNo(Water, WaterHouseNo),
    member(WaterHouseNo, HouseNos),

    (BlendHouseNo is WaterHouseNo +1;
    BlendHouseNo is WhiteHouseNo -1),


    %%% instantiate rest of solution structure
    permutation(HouseColors,
        [BritHouseColor, SwedeHouseColor, DaneHouseColor, GermanHouseColor, NorwegianHouseColor]),
    permutation(HouseNos,
        [BritHouseNo, SwedeHouseNo, DaneHouseNo, GermanHouseNo, NorwegianHouseNo]),
    permutation(Drinks,
        [BritDrink, SwedeDrink, DaneDrink, GermanDrink, NorwegianDrink]),
    permutation(Pets,
        [BritPet, SwedePet, DanePet, GermanPet, NorwegianPet]),
    permutation(Smokes,
        [BritSmoke, SwedeSmoke, DaneSmoke, GermanSmoke, NorwegianSmoke]).


ownerOfFish(Persons, Owner) :- 
    solution(Persons),
    member(person(Owner, _HouseColor, _HouseNo, _Drink, fish, _Smoke), Persons).
























