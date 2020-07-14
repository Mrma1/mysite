import string
import random
import time
from django.shortcuts import render, redirect
from django.contrib import auth
from django.urls import reverse
from django.contrib.auth.models import User
from .forms import LoginForm,RegisterForm,ChangeNickNameForm,BindEmailForm, ChangePasswordForm, ForgotPassword
from .models import Profile
from django.core.mail import send_mail
from django.http import JsonResponse

def login(request):
    return_to = request.GET.get('from', reverse('home'))
    if request.method == 'POST':
        login_form = LoginForm(request.POST)
        if login_form.is_valid():
            user = login_form.cleaned_data['user']
            auth.login(request, user)
            return redirect(request.GET.get('from', reverse('home')))
    else:
        login_form = LoginForm()
    content = {}
    content['login_form'] = login_form
    content['page_title'] = '登录'
    content['form_title'] = '登录'
    content['submit_text'] = '登录'
    content['return_back_url'] = return_to
    return render(request, 'login.html', content)


def register(request):
    return_to = request.GET.get('from', reverse('home'))
    if request.method == 'POST':
        register_form = RegisterForm(request.POST, request=request)
        if register_form.is_valid():
            username = register_form.cleaned_data['username']
            password = register_form.cleaned_data['password']
            email = register_form.cleaned_data['email']
            #创建用户
            user = User.objects.create_user(username=username, password=password, email=email)
            user.save()
            #清楚session
            del request.session['register_code']
            #登录用户
            user = auth.authenticate(username=username, password=password, email=email)
            auth.login(request, user)
            return redirect(request.GET.get('from', reverse('home')))
    else:
        register_form = RegisterForm()
    content = {}
    content['register_form'] = register_form
    content['page_title'] = '注册'
    content['form_title'] = '注册'
    content['submit_text'] = '注册'
    content['return_back_url'] = return_to
    return render(request, 'register.html', content)


def logout(request):
    auth.logout(request)
    return redirect(request.GET.get('fro,', reverse('home')))


def user_info(request):
    content = {}
    return render(request, 'user_info.html', content)

def change_nickname(request):
    return_to = request.GET.get('from', reverse('home'))
    if request.method == 'POST':
        form = ChangeNickNameForm(request.POST,user=request.user)
        if form.is_valid():
            nickname = form.cleaned_data['nickname_new']
            profile,created = Profile.objects.get_or_create(user=request.user)
            profile.nickname = nickname
            profile.save()
            return redirect(return_to)
    else:
        form = ChangeNickNameForm()
    content = {}
    content['page_title'] = '修改昵称'
    content['form_title'] = '修改昵称'
    content['submit_text'] = '修改'
    content['form'] = form
    content['return_back_url'] = return_to
    return render(request,'form.html',content)

def bind_email(request):
    return_to = request.GET.get('from', reverse('home'))
    if request.method == 'POST':
        form = BindEmailForm(request.POST,request=request)
        if form.is_valid():
            email = form.cleaned_data['email']
            request.user.email = email
            request.user.save()
            del request.session['bind_email_code']
            return redirect(return_to)
    else:
        form = BindEmailForm()
    content = {}
    content['page_title'] = '绑定邮箱'
    content['form_title'] = '绑定邮箱'
    content['submit_text'] = '绑定'
    content['form'] = form
    content['return_back_url'] = return_to
    return render(request,'bind_email.html',content)

def send_verification_code(request):
    email = request.GET.get('email','')
    send_for = request.GET.get('send_for','')
    data = {}
    if email != '':
        #生成验证码
        code = ''.join(random.sample(string.ascii_letters+string.digits,4))
        now = int(time.time())
        send_time = request.session.get('send_code_time',0)
        if now - send_time < 60:
            data['status'] = 'ERROR'
        else:
            request.session['send_code_time'] = now
            request.session[send_for] = code
            #发送邮箱
            send_mail(
                '绑定邮箱',
                '验证码：%s' % code,
                '1459252659@qq.com',
                [email],
                fail_silently=False,
            )  
            data['status'] = 'SUCCESS'
    else:
        data['status'] = 'ERROR'
    return JsonResponse(data)

def change_password(request):
    return_to = reverse('home')
    if request.method == 'POST':
        form = ChangePasswordForm(request.POST,user=request.user)
        if form.is_valid():
            new_password = form.cleaned_data['new_password']
            request.user.set_password(new_password)
            request.user.save()

            auth.logout(request)
            return redirect(return_to)
    else:
        form = ChangePasswordForm()
    content = {}
    content['page_title'] = '修改密码'
    content['form_title'] = '修改密码'
    content['submit_text'] = '修改'
    content['form'] = form
    content['return_back_url'] = return_to
    return render(request,'form.html',content)

def forgot_password(request):
    return_to = reverse('login')
    if request.method == 'POST':
        form = ForgotPassword(request.POST,request=request)
        if form.is_valid():
            email = form.cleaned_data['email']
            print(email)
            new_password = form.cleaned_data['new_password']
            user = User.objects.get(email=email)
            user.set_password(new_password)
            user.save()

            del request.session['forgot_code']
            auth.logout(request)
            return redirect(return_to)
    else:
        form = ForgotPassword()
    content = {}
    content['page_title'] = '修改密码'
    content['form_title'] = '修改密码'
    content['submit_text'] = '修改'
    content['form'] = form
    content['return_back_url'] = return_to
    return render(request,'forgot_password.html',content)