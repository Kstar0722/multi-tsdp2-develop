from django.test import TestCase


class WerckerTestCase(TestCase):
    """
    Wercker test

    Because we don't have any real tests yet, this test is used only to check if Wercker is running properly.
    Remove it when a real one occur.
    """

    def test_wercker(self):
        self.assertTrue(True)
