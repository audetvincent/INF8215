# SHEBANG
import array
import State

class Test:

    def __init__(self):
        '''TODO'''

    def test1(self):
        positioning = array.array('c', [1, 0, 1, 4, 2, 4, 0, 1 ])
        s0 = State.State(positioning, None)
        isSuccessful = s0.success()
        print isSuccessful
        s = State.State(s0, 1, 1)

        print (s.prev() == s0)
        b = (b and s.prev() == 0) ''' A CHANGER'''
        print (s0.pos() + " " + s.pos()[1])

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
