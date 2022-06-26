"""
Django app in a single file.
Full list of settings: https://docs.djangoproject.com/en/4.0/ref/settings/
"""

from django.urls import path
from rest_framework.decorators import api_view
from rest_framework.response import Response

# With DEBUG = True, Django shows more detailed traceback
# and keeps track of SQL queries
DEBUG = True

# Project secret key for cryptographic signing (protection from tampering)
SECRET_KEY = 'secret-manage-app'

# What hosts can connect to Django
ALLOWED_HOSTS = ['localhost', '127.0.0.1']

# Middlewares intercepts every request for cross-cutting concerns
MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

INSTALLED_APPS = [
    'django.contrib',
    'rest_framework',
]

# ROOT_URLCONF is the module Django loads to find urlpatterns.
# In this case the module is also this file.
ROOT_URLCONF = __name__


@api_view(['GET'])
def hello_world(request):
    """
    Hello World!
    """
    return Response("Hello World!")


urlpatterns = (
    path('', hello_world),
)
