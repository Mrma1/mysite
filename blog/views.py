from django.shortcuts import render, get_object_or_404
from django.http import HttpResponse
from .models import Blog, BlogType
from django.conf import settings
from django.db.models import Count
from django.core.paginator import Paginator
from django.contrib.contenttypes.models import ContentType
from read_statist.models import ReadNum
from read_statist.views import ReadNumExpendMethod
from comment.models import Comment


def get_page_blogs(request, blogs):
    paginator = Paginator(blogs, settings.EACHPAGE_BLOGNUM)
    page_num = request.GET.get('page', 1)
    page_of_blogs = paginator.get_page(page_num)
    blogs_type = BlogType.objects.all()
    # 获取当前页码
    cur_page_num = page_of_blogs.number
    page_range = list(range(max(cur_page_num-2, 1), cur_page_num)) + \
        list(range(cur_page_num, min(cur_page_num+2, paginator.num_pages)+1))

    if page_range[0] - 1 >= 2:
        page_range.insert(0, '...')
    if paginator.num_pages - page_range[-1] >= 2:
        page_range.append('...')
    if page_range[0] != 1:
        page_range.insert(0, 1)
    if page_range[-1] != paginator.num_pages:
        page_range.append(paginator.num_pages)

    blogs_date = Blog.objects.dates(
        'created_time', 'month', order='DESC')
    blog_date_list = {}
    for blog_date in blogs_date:
        blog_date_count = Blog.objects.filter(
            created_time__year=blog_date.year, created_time__month=blog_date.month).count()
        blog_date_list[blog_date] = blog_date_count
    content = {}
    content['page_of_blogs'] = page_of_blogs
    content['blogs_type'] = BlogType.objects.annotate(blog_count=Count('blog'))
    content['page_range'] = page_range
    content['blogs_date'] = blog_date_list
    return content


def blog_detail(request, page_id):

    blog = get_object_or_404(Blog, id=page_id)
    key = ReadNumExpendMethod.get_cookie(request, blog)

    content_type = ContentType.objects.get_for_model(blog)
    print(content_type)
    comments = Comment.objects.filter(
        content_type=content_type, object_id=blog.pk)

    content = {}
    content['blog'] = blog
    content['previous_blog'] = Blog.objects.filter(
        created_time__gt=blog.created_time).last()
    content['next_blog'] = Blog.objects.filter(
        created_time__lt=blog.created_time).first()
    content['comments'] = comments
    response = render(request, 'blog_detail.html', content)
    response.set_cookie(key, 'true')

    return response

# 博客列表


def blog_list(request):
    blogs = Blog.objects.all()
    content = get_page_blogs(request, blogs)
    return render(request, 'blog.html', content)
# 博客分类


def blog_with_type(request, type_id):
    blog_type = get_object_or_404(BlogType, id=type_id)
    blogs = Blog.objects.filter(blog_type=blog_type)
    content = get_page_blogs(request, blogs)
    content['blog_type'] = blog_type
    return render(request, 'type_list.html', content)


def blog_with_date(request, year, month):
    blogs = Blog.objects.filter(
        created_time__year=year, created_time__month=month)
    content = get_page_blogs(request, blogs)
    return render(request, 'blog_with_date.html', content)
