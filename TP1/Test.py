#!/usr/bin/env python
import array
import State
import RushHour

class Test:

    def __init__(self):
        self.test1()

    def test1(self):
        print "TEST 1 \n"
        positioning = [1, 0, 1, 4, 2, 4, 0, 1 ]
        s0 = State.State(positioning, None)
        isSuccessful = s0.success()
        print isSuccessful
        s = State.State(s0, 1, 1)

        print (s.prev() == s0)
        b = 0
        b = (b and s.prev() == 0)
        print (s0.__pos + " " + s.__pos[1])

        s = State.State(s, 6, 1)
        s = State.State(s, 1, -1)
        s = State.State(s, 6, -1)

        print (s.__eq__(s0))
        b = (b and s.__eq__(s0))
        s = State.State(s0, 1, 1)
        s = State.State(s, 2, -1)
        s = State.State(s, 3, -1)
        s = State.State(s, 4, -1)
        s = State.State(s, 4, -1)
        s = State.State(s, 5, -1)
        s = State.State(s, 5, -1)
        s = State.State(s, 5, -1)
        s = State.State(s, 6, 1)
        s = State.State(s, 6, 1)
        s = State.State(s, 6, 1)
        s = State.State(s, 7, 1)
        s = State.State(s, 7, 1)
        s = State.State(s, 0, 1)
        s = State.State(s, 0, 1)
        s = State.State(s, 0, 1)
        b = (b and s.success())
        print s.success()
        if (not b):
            print "mauvais resultat"

    def test2(self):
        res = [[False, False, True, True, True, False], [False, True, True, False, True, False], 
            [False, False, False, False, True, False ], [False, True, True, False, True, True], 
            [False, True, True, True, False, False], [False, True, False, False, False, True]]
        rh = RushHour.RushHour(self)
        rh.__nbCars = 8
        rh.__horiz = [True, True, False, False, True, True, False, False]
        rh.__len = [2, 2, 3, 2, 3, 2, 3, 3]
        rh.__moveon = [2, 0, 0, 0, 5, 4, 5, 3]
        s = State.State([1, 0, 1, 4, 2, 4, 0, 1], rh)
        rh.initFree(s)
        b = True
        for i in xrange(6):
            for j in xrange(6):
                print (rh.free[i][j] + "\t")
                b = (b and (rh.free[i][j] == res[i][j]))
            print "\n"
        if (b):
            print "resultat correct"
        else:
            print "mauvais resultat"

    def test3(self):
        rh = RushHour.RushHour(self)
        rh.__nbCars = 12
        rh.__horiz = [True, False, True, False, False, True, False, True, False, True, False, True]
        rh.__len = [2, 2, 3, 2, 3, 2, 2, 2, 2, 2, 2, 3]
        rh.__moveon = [2, 2, 0, 0, 3, 1, 1, 3, 0, 4, 5, 5 ]
        s = State.State([1, 0, 3, 1, 1, 4, 3, 4, 4, 2, 4, 1], rh)
        s2 = State.State([1, 0, 3, 1, 1, 4, 3, 4, 4, 2, 4, 2], rh)
        print (len(rh.moves(s)))
        print (len(rh.moves(s2)))

    def test4(self):
        rh = RushHour.RushHour(self)
        rh.__nbCars = 12
        rh.__color = ["rouge", "vert clair", "jaune", "orange", "violet clair", "bleu ciel", "rose",
                "violet", "vert", "noir", "beige", "bleu"]
        rh.__horiz = [True, False, True, False, False, True, False, True, False, True, False, True]
        rh.__len = [2, 2, 3, 2, 3, 2, 2, 2, 2, 2, 2, 3]
        rh.__moveon = [2, 2, 0, 0, 3, 1, 1, 3, 0, 4, 5, 5]
        s = State.State([1, 0, 3, 1, 1, 4, 3, 4, 4, 2, 4, 1], rh)
        n = 0
        s = rh.solve(s)
        while(s.prev != None):
            n += 1
            s = s.prev
        print n

    def solve22(self):
        rh = RushHour.RushHour(self)
        rh.__nbCars = 12
        rh.__color = ["rouge", "vert clair", "jaune", "orange", "violet clair", "bleu ciel", "rose",
                "violet", "vert", "noir", "beige", "bleu"]
        rh.__horiz = [True, False, True, False, False, True, False, True, False, True, False, True]
        rh.__len = [2, 2, 3, 2, 3, 2, 2, 2, 2, 2, 2, 3]
        rh.__moveon = [2, 2, 0, 0, 3, 1, 1, 3, 0, 4, 5, 5]
        s = State.State([1, 0, 3, 1, 1, 4, 3, 4, 4, 2, 4, 1], rh)
        s = rh.solve(s)
        rh.printSolution(s)

    def solve1(self):
        rh = RushHour.RushHour(self)
        rh.__nbCars = 8
        rh.__color = ["rouge", "vert clair", "violet", "orange", "vert", "bleu ciel", "jaune", "bleu"]
        rh.__horiz = [True, True, False, False, True, True, False, False]
        rh.__len = [2, 2, 3, 2, 3, 2, 3, 3]
        rh.__moveon = [2, 0, 0, 0, 5, 4, 5, 3]
        s = State.State([1, 0, 1, 4, 2, 4, 0, 1], rh)
        s = rh.solve(s)
        rh.printSolution(s)

    def solve40(self):
        rh = RushHour.RushHour(self)
        rh.__nbCars = 13
        rh.__color = ["rouge", "jaune", "vert clair", "orange", "bleu clair", "rose", "violet clair",
                "bleu", "violet", "vert", "noir", "beige", "jaune clair"]
        rh.__horiz = [True, False, True, False, False, False, False, True, False, False, True, True, True]
        rh.__len = [2, 3, 2, 2, 2, 2, 3, 3, 2, 2, 2, 2, 2]
        rh.__moveon = [2, 0, 0, 4, 1, 2, 5, 3, 3, 2, 4, 5, 5]
        s = State.State([3, 0, 1, 0, 1, 1, 1, 0, 3, 4, 4, 0, 3], rh)
        s = rh.solve(s)
        rh.printSolution(s)

    def solveAStar(self):
        rh = RushHour.RushHour(self)
        rh.__nbCars = 12
        rh.__color = ["rouge", "vert clair", "jaune", "orange", "violet clair", "bleu ciel", "rose",
                "violet", "vert", "noir", "beige", "bleu"]
        rh.__horiz = [True, False, True, False, False, True, False, True, False, True, False, True]
        rh.__len = [2, 2, 3, 2, 3, 2, 2, 2, 2, 2, 2, 3]
        rh.__moveon = [2, 2, 0, 0, 3, 1, 1, 3, 0, 4, 5, 5]
        s = State.State([1, 0, 3, 1, 1, 4, 3, 4, 4, 2, 4, 1], rh)
        s = rh.solve(s)
        rh.printSolution(s)

Test()