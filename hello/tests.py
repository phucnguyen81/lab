from unittest import TestCase

from rest_framework.test import APIRequestFactory

from app import hello_world


class Tests(TestCase):

    def test_hello_world_api_view(self):
        # Use rest_frameworkd RequestFactory API to create a form GET request
        factory = APIRequestFactory()
        request = factory.get('/')
        response = hello_world(request)
        self.assertIsNotNone(response)
        self.assertEqual(response.data, 'Hello World!')
