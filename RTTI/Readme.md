# RTTI Library #

## Introduction ##
This library has been built to help me simplify
RTTI use because it was way too convoluted. 
It is very basic and split in two parts: core and
dataset.

## Core ##
This is the main part and it deals with the nitty-gritty
details of doing stuff with properties. The underlying idea is that this is what I mostly deal with, so it'd help to have something which were friendly to my needs.
It is a **very** opinionated library: for example, the IRttiProperty interface does not have a "Name" property because you either know what property you need to look at (and then you don't need it repeated) or you need to iterate all properties (and then I will give you the name in some way) but you will still have it, so no reason to put it there. Also, because we Delphi developers have an obsession with using "Name" properties, this is one less way a piece of code can be wrong.

## Dataset ##
This is a more complex piece dealing with one of my biggest pains: databases. At least initially, I don't settle for a specific RDBMS or table structure, so I end up modifying lots of code for nothing. A solution that leaves me only half happy is that of using clientdatasets or FireDac mem tables, but it still means I may need to remodel, make changes, etc. which would make me lose a lot of time. This library takes a lot of that pain away, because it lets me literally build a whole dataset from a class. Every time I want to make a change, I change the class **ONLY** and rebuild the dataset. Job done. 
It's template based and a ClientDataset implementation is provided, so that you can use that as reference.  