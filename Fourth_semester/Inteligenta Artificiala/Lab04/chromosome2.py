import random
from random import randint


class MyChromosome:
    def __init__(self, problemsParameters=None):
        self.__problemsParameters = problemsParameters
        self.__fitness = 0.0
        self.__representation = []
        self.__init_representation()

    @property
    def representation(self):
        return self.__representation

    @property
    def fitness(self):
        return self.__fitness

    @representation.setter
    def representation(self, chromosome=None):
        if chromosome is None:
            chromosome = []
        self.__representation = chromosome

    @fitness.setter
    def fitness(self, fit=0.0):
        self.__fitness = fit

    # crossover este functie folosita pentru a genera descendentii prin combinarea informațiilor genetice a doi părinți selectați dintr-o populație curentă.
    # de tip incurcisare uniforma
    def crossover(self, c):
        cut = randint(0, len(self.__representation) - 1)    # pozitie aleatoare de taiere
        new_representation = [None] * len(self.__representation)    # vector de reprezentare a unei progenituri initializat null

        # vectorul progeniturii primeste valorile din cromozomul parinte pana la valoarea de taiere
        for i in range(cut):
            new_representation[i] = self.__representation[i]
        position = 0

        # se completează restul vectorului progeniturii cu valorile din părintele opus în ordinea în care acestea apar în părintele opus, 
        # dar doar dacă nu sunt deja prezente în reprezentarea progeniturii.
        for i in range(cut, len(self.__representation)):
            while c.__representation[position] in new_representation:
                position += 1
            new_representation[i] = c.__representation[position]
        offspring = MyChromosome(c.__problemsParameters)
        offspring.representation = new_representation
        return offspring

    # mutation este functie implementează operația de mutație a unui cromozom din algoritmul genetic. 
    # Această operație este importantă pentru a introduce variație în populația de cromozomi și a evita stagnarea într-un minim local.
    # de tip swap
    def mutation(self):
        first_position = randint(0, len(self.__representation) - 1)
        second_position = randint(0, len(self.__representation) - 1)
        while self.__representation[first_position] != self.__representation[second_position]:
            second_position = randint(0, len(self.__representation) - 1)
        first_value = self.__representation[first_position]
        self.__representation[first_position] = self.__representation[second_position]
        self.__representation[second_position] = first_value

    def __str__(self):
        return 'Chromosome: ' + str(self.__representation) + ' has fit: ' + str(self.__fitness) + '.'

    def __repr__(self):
        return self.__str__()

    def __eq__(self, c):
        return self.__representation == c.__representation and self.__fitness == c.__fitness

    def __init_representation(self):
        self.__representation = [i for i in range(1, self.__problemsParameters['noNodes'] + 1)]
        random.shuffle(self.__representation)

