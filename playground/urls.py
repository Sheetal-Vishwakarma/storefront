# from django.urls import path
from django.urls import re_path as url, path
from . import views

#URL conf
urlpatterns = [
    path('hello/',views.say_hello),
    path('',views.index),
    path('registration/',views.register_form),
    path('insert_user/',views.insert_user,name='insert_user'),
    path('thank_you/',views.thank_you,name='thank_you'),
    # path('insert_contact/',views.insert_contact,name='insert_contact'),
    url(r'^$', views.index, name='index'),  # index view at /
    url(r'^insert_contact_form/$', views.insert_contact, name='insert_contact'),
    url(r'insert_newsletter_form/$',views.insert_newsletter, name='insert_newsletter')
]