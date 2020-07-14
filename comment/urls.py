from django.urls import path
from . import views

urlpatterns = [
    path('ud_comment/', views.update_comment, name='update_comment'),
]
