#!/usr/bin/env python
import array

class State:

    def __init__(self, p=None, rh = None):
        self.__pos = [None] * len(p)
        for i in xrange(len(p)):
            self.__pos[i] = p[i]
        self.__n = 0
        self.__prev = None
        self.__rh = rh
        self.__c = 0
        self.__d = 0
        self.__f = 0

    '''constructeur d'un etat a partir d'un etat s et d'un mouvement (c,d)'''
    def State(self, s, c, d):
        self.__prev = s
        s.__pos[c] += d

    def success(self):
        if self.__pos[0] == 4:
            return True
        return False

    def estimee1(self):
        '''TODO'''
        return 0

    def estimee2(self):
        '''TODO'''
        return 0

    def __eq__(self, other):
        '''TODO'''

    def __ne__(self, other):
        '''TODO'''

