from django import forms
from django.contrib import auth
from django.contrib.auth.models import User

class LoginForms(forms.Form):
    username = forms.CharField(label='用户名', required=True)
    password = forms.CharField(label='密码', widget=forms.PasswordInput)

    def clean(self):
        username = self.cleaned_data['username']
        password = self.cleaned_data['password']
        user = auth.authenticate(username=username, password=password)
        if user is None:
            raise forms.ValidationError('用户名或密码错误')
        else:
            self.cleaned_data['user'] = user
        return self.cleaned_data

class RegisterForms(forms.Form):
    username = forms.CharField(label='用户名', required=True, min_length=3, max_length=15, widget=forms.TextInput(attrs={'placeholder':'请输入3-15个字符'}))
    password = forms.CharField(label='密码', widget=forms.PasswordInput(attrs={'placeholder':'至少输入6个字符'}), min_length=6, max_length=20)
    password_again = forms.CharField(label='确认密码', widget=forms.PasswordInput(attrs={'placeholder':'再输入一次密码'}), min_length=6, max_length=20)
    email = forms.EmailField(label='邮箱', widget=forms.EmailInput(attrs={'placeholder':'请输入邮箱号'}))

    def clean_username(self):
        username = self.cleaned_data['username']
        print(111111111111111111111111111111111111111111111111111111)
        if User.objects.filter(username=username).count()>0:
            raise forms.ValidationError('用户名已存在')
        return username

    def clean_email(self):
        email = self.cleaned_data['email']
        if User.objects.filter(email=email).exists():
            raise forms.ValidationError('邮箱已存在')
        return email

    def clean_password_again(self):
        password = self.cleaned_data['password']
        password_again = self.cleaned_data['password_again']
        if password != password_again:
            raise forms.ValidationError('两次输入的密码不一致')
        return password_again