from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('ud_comment/', views.update_comment, name='update_comment'),
]
