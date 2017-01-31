#!/usr/bin/env python
import array


'''
representation du probleme : Les six lignes sont numerotees de haut en
bas, de 0 a 5 et les 6 colonnes de gauche a droite, de 0 a 5.

Il y a nbcars voitures, numerotees de 0 a nbcars-1 pour chaque voiture i
on a : - color[i] sa couleur - horiz[i] si la voiture est horizontale
(vrai) ou verticale (faux) - len[i] sa longueur (2 ou 3) - moveon[i] la
ligne (si horiz[i]) ou la colonne (sinon) ou se trouve la voiture
'''
class RushHour:

    def __init__(self, nbCars=None, color=None, horiz=None, len=None, moveon=None, nbMoves=0):
        self.__nbCars = nbCars
        self.__color = color
        self.__horiz = horiz
        self.__len = len
        self.__moveon = moveon
        self.__nbMoves = nbMoves
        self.__free = []

    def initFree(self, s):
        '''TODO'''

    def moves(self, s):
        self.initFree(s)
        movesList = [None] * 0
        return movesList

    def solve(self, s):
        visited = set()
        visited.add(s)
        Q = [None] * 0 #Empty queue
        '''TODO'''
        print "Pas de solution"
        return None

    ''' CHANGE THIS TO USE PRIORITY QUEUE "HEAPQ" '''
    def solveAStart(self, s):
        visited = set()
        visited.add(s)
        Q = [None] * 0  # Empty queue
        '''TODO'''
        print "Pas de solution"
        return None

    def printSolution(self, s):
        '''TODO'''