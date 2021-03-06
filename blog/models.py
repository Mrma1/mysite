from django.db import models
from django.contrib.auth.models import User
from django.contrib.contenttypes.fields import GenericRelation
from ckeditor_uploader.fields import RichTextUploadingField
from read_statist.views import ReadNumExpendMethod
from read_statist.models import ReadDetail
from django.urls import reverse

class BlogType(models.Model):
    blog_type = models.CharField(max_length=15)

    def __str__(self):
        return self.blog_type


class Blog(models.Model, ReadNumExpendMethod):
    title = models.CharField(max_length=50)
    blog_type = models.ForeignKey(BlogType, on_delete=models.CASCADE)
    content = RichTextUploadingField()
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    read_details = GenericRelation(ReadDetail)
    created_time = models.DateTimeField(auto_now_add=True)
    last_updated_time = models.DateTimeField(auto_now=True)

    def __str__(self):
        return "<Blogs%s> % self.title"

    class Meta:
        ordering = ['-created_time']

    def get_url(self):
        return reverse('specific_page',kwargs={'page_id':self.pk})

    def get_email(self):
        return self.author.email
