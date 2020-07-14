from django.db import models
from django.contrib.auth.models import User
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey

# Create your models here.


class Comment(models.Model):
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

    content = models.TextField()
    user = models.ForeignKey(User,related_name='comments', on_delete=models.CASCADE)
    comment_time = models.DateTimeField(auto_now_add=True)

    root = models.ForeignKey('self', related_name='root_comment', null=True, on_delete=models.CASCADE)
    parent = models.ForeignKey('self',related_name='parent_comment', null=True,on_delete=models.CASCADE)
    reply = models.ForeignKey(User,related_name='replies', null=True ,on_delete=models.CASCADE)

    def __str__(self):
        return self.content

    class Meta:
        ordering = ['-comment_time']
