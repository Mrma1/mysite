from django.contrib.contenttypes.models import ContentType
from blog.models import Blog
from django.shortcuts import render
from read_statist.views import ReadNumExpendMethod
from django.core.cache import cache


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