from django.contrib.contenttypes.models import ContentType
from blog.models import Blog
from django.shortcuts import render, redirect
from read_statist.views import ReadNumExpendMethod
from django.core.cache import cache
from django.contrib import auth
from .forms import LoginForms,RegisterForms
from django.urls import reverse
from django.contrib.auth.models import User


def index(request):
    blog_content_type = ContentType.objects.get_for_model(Blog)
    read_nums, dates = ReadNumExpendMethod.get_seven_read_data(
        blog_content_type)

    week_hot_data = cache.get('week_hot_data')
    if week_hot_data is None:
        week_hot_data = ReadNumExpendMethod.get_week_hot_data(Blog)
        cache.set('week_hot_data', week_hot_data, 3600)

    content = {}
    content['read_nums'] = read_nums
    content['dates'] = dates
    content['today_hot_data'] = ReadNumExpendMethod.get_today_hot_data(
        blog_content_type)
    content['yesterday_hot_data'] = ReadNumExpendMethod.get_yesterday_hot_data(
        blog_content_type)
    content['week_hot_data'] = week_hot_data
    return render(request, 'index.html', content)


def login(request):
    if request.method == 'POST':
        login_form = LoginForms(request.POST)
        if login_form.is_valid():
            user = login_form.cleaned_data['user']
            auth.login(request, user)
            return redirect(request.GET.get('from', reverse('home')))
    else:
        login_form = LoginForms()
    content = {}
    content['login_form'] = login_form
    return render(request, 'login.html', content)


def register(request):
    if request.method == 'POST':
        register_form = RegisterForms(request.POST)
        if register_form.is_valid():
            username = register_form.cleaned_data['username']
            password = register_form.cleaned_data['password']
            email = register_form.cleaned_data['email']
            user = User.objects.create_user(username=username, password=password, email=email)
            user.save()

            user = auth.authenticate(username=username, password=password, email=email)
            auth.login(request, user)
            return redirect(request.GET.get('from', reverse('home')))
    else:
        register_form = RegisterForms()
    content = {}
    content['register_form'] = register_form
    return render(request, 'register.html', content)
