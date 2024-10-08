from django.urls import path
from .views import get_person, create_person, person_detail

urlpatterns = [
    path('persons/',get_person, name='get_persons'),
    path('person/create', create_person, name='create_person'),
    path('person/<int:pk>', person_detail,name='curd_operation')
]
