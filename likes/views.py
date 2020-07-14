from django.shortcuts import render
from django.contrib.contenttypes.models import ContentType
from .models import LikeRecord

def like_change(request):
    user = request.user
    content_type = request.GET.get('content_type')
    content_type = ContentType.objects.get(model=content_type)
    object_id = int(request.GET.get('object_id'))
    is_like = request.GET.get('is_like')

    if is_like == 'true':
        likeRecord, created = LikeRecord.objects.get_or_create(content_type=content_type, object_id=object_id, user=user)
    else:
        pass