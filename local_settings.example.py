import os

SITE_ROOT = '/'.join(os.path.dirname(__file__).split('/')[0:-2])

TEMPLATE_DIRS = (
    "%s/var/custom_templates/" % SITE_ROOT,
    '%s/readthedocs/templates/' % SITE_ROOT,
)

SECRET_KEY = 'somereallysecretkey'
DEBUG = False
TASTYPIE_FULL_DEBUG = False
PRODUCTION_DOMAIN = 'something.com'
ADMINS = (
    ('Name Surname', 'name@something.com'),
)
DEFAULT_FROM_EMAIL = 'noreply@something.com'
SESSION_COOKIE_DOMAIN = PRODUCTION_DOMAIN
TIME_ZONE = 'Europe/London'
LANGUAGE_CODE = 'en-gb'
AUTHENTICATION_BACKENDS = (
    'django.contrib.auth.backends.ModelBackend',
    'allauth.account.auth_backends.AuthenticationBackend',
    'guardian.backends.ObjectPermissionBackend',
)
