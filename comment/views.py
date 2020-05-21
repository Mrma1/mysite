from django.shortcuts import render, redirect
from django.contrib.contenttypes.models import ContentType
from .models import Comment
# Create your views here.


def update_comment(request):
    user = request.user
    comment_text = request.POST.get('commenttext')
    contnet_type = request.POST.get('content_type')
    object_id = request.POST.get('object_id')
    model_class = ContentType.objects.get(model=contnet_type).model_class()
    model_object = model_class.objects.get(pk=object_id)

    comment = Comment()
    comment.user = user
    comment.content = comment_text
    comment.content_object = model_object
    comment.save()

    referer = request.META.get('HTTP_REFERER')
    return redirect(referer, '/')
