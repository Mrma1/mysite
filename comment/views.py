import threading
from django.shortcuts import render, redirect
from django.contrib.contenttypes.models import ContentType
from .models import Comment
from .forms import CommentForm
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.http import JsonResponse
from django.conf import settings
from django.urls import reverse

class SendMail(threading.Thread):
    def __init__(self,subject,text,email,fail_silently=False):
        self.subject = subject
        self.text = text
        self.email = email
        self.fail_silently = fail_silently
        threading.Thread.__init__(self)
    def run(self):
        send_mail(
                self.subject,
                '',
                settings.EMAIL_HOST_USER,
                [self.email],
                fail_silently=self.fail_silently,
                html_message=self.text
            )

def update_comment(request):
    referer = request.META.get('HTTP_REFERER', reverse('home'))
    comment_form = CommentForm(request.POST, user =request.user)
    data ={}
    if comment_form.is_valid():
        comment = Comment()
        comment.user = comment_form.cleaned_data['user']
        comment.content = comment_form.cleaned_data['text']
        comment.content_object = comment_form.cleaned_data['content_object']

        parent =  comment_form.cleaned_data['parent']
        if parent:
            comment.parent = parent
            comment.reply = parent.user
            comment.root = parent.root if parent.root else parent
        comment.save()

        #评论发送邮件
        if parent:
            #回复评论
            subject = '有人回复你的评论'
            email = comment.reply.email
        else:
            #发表评论
            subject = '有人评论你的博客'
            email = comment.content_object.get_email()
        content = {}
        content['comment_text'] = comment.content
        content['url'] = comment.content_object.get_url()
        text = render_to_string('send_email.html',content)
        if email != '':
            sendmail = SendMail(subject,text,email)
            sendmail.start()

        data['status'] = 'SUCCESS'
        data['username'] = comment.user.get_nickname_or_username()
        data['comment_time'] = comment.comment_time.strftime('%Y-%m-%d %H:%M:%S')
        data['text'] = comment.content
        if parent:
            data['reply'] = comment.reply.get_nickname_or_username()
        else:
            data['reply'] = ''
        data['pk'] = comment.pk
        data['root_pk'] = comment.root.pk if comment.root else ''
    else:
        data['status'] = 'ERROR'
        data['message'] = list(comment_form.errors.values())[0][0]
    return JsonResponse(data)
