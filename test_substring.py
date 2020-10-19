import unittest
from substring import calculate

class Testing(unittest.TestCase):
    def test_substring(self):
        self.assertEqual(calculate(''), 0)
        self.assertEqual(calculate('a'), 0)
        self.assertEqual(calculate('aa'), 0)
        self.assertEqual(calculate('ab'), 1)
        self.assertEqual(calculate('b'), 0)
        self.assertEqual(calculate('god'), 3)
        self.assertEqual(calculate('good'), 2)
        self.assertEqual(calculate('docomo'), 15)
        self.assertEqual(calculate('rohtash'), 6)
        self.assertEqual(calculate('pineapple'), 8)
        self.assertEqual(calculate('apple'), 2)
        self.assertEqual(calculate('grapes'), 10)
        self.assertEqual(calculate('honey'), 10)
        self.assertEqual(calculate('sandeep'), 5)
        self.assertEqual(calculate('zzz'), 0)
        self.assertEqual(calculate('hezzzo'), 4)
        self.assertEqual(calculate('heezhezzo'), 6)
        self.assertEqual(calculate('Hullaballoo'), 14)
        self.assertEqual(calculate('Gibberish'), 13)

if __name__ == '__main__':
    unittest.main()
