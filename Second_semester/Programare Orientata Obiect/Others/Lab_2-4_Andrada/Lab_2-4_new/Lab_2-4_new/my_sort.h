#ifndef MYSORT_H_
#define MYSORT_H_

#include "CarsRepository.h"
/*
   Tipul functie de comparare pentru 2 elemente
   returneaza 0 daca sunt egale, 1 daca o1>o2, -1 altfel
*/
typedef int(*FunctieComparare)(Car* o1, Car* o2);

/**
* Sorteaza in place
* cmpf - relatia dupa care se sorteaza
*/
void sort(MyList* l, FunctieComparare cmpF);

#endif

#pragma once
