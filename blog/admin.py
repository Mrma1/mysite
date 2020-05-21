from django.contrib import admin
from .models import Blog, BlogType


# Register your models here.
@admin.register(Blog)
class BlogAdmin(admin.ModelAdmin):
    list_display = ('id', 'title', 'blog_type', 'get_read_num', 'content',
                    'author', 'created_time', 'last_updated_time')
    ordering = ('id',)


@admin.register(BlogType)
class BlogTypeAdmin(admin.ModelAdmin):
    list_display = ('blog_type',)
# admin.site.register(blog,blogadmin)
