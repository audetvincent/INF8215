# SHEBANG
import array

class State:

    def __init__(self, rh, p=None):
        self.__pos = [None] * p.len
        for i in p.len:
            self.__pos[i] = p[i]
        self.__n = 0
        self.__prev = None
        self.__rh = rh

    # constructeur d'un état a partir d'un etat s et d'un mouvement (c,d)
    def State(self, s, c, d):
        '''TODO'''

    def success(self):
        '''TODO'''
        return False

    def estimee1(self):
        '''TODO'''
        return 0

    def estimee2(self):
        '''TODO'''
        return 0

    def pos(self):
        return self.__pos

    def prev(self):
        return self.__prev

    def __eq__(self, other):
        '''TODO'''

    def __ne__(self, other):
        '''TODO'''

