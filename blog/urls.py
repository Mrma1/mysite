from django.urls import path
from . import views

urlpatterns = [
    path('', views.blog_list, name='blog_list'),
    path('<int:page_id>', views.blog_detail, name='specific_page'),
    path('type/<int:type_id>', views.blog_with_type, name='blog_with_type'),
    path('<int:year>/<int:month>', views.blog_with_date, name='blog_with_date'),
]
