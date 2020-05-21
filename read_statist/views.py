import datetime
from django.shortcuts import render
from django.core.exceptions import ObjectDoesNotExist
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType
from read_statist.models import ReadNum, ReadDetail
from django.db.models import Sum
from django.utils import timezone


class ReadNumExpendMethod:
    def get_read_num(self):
        try:
            ct = ContentType.objects.get_for_model(self)
            read_num = ReadNum.objects.get(content_type=ct, object_id=self.pk)
            return read_num.read_num
        except ObjectDoesNotExist:
            return 0

    def get_cookie(request, object):
        ct = ContentType.objects.get_for_model(object)
        key = '%s_%s' % (ct.model, object.pk)
        if not request.COOKIES.get(key):
            read_num, created = ReadNum.objects.get_or_create(
                content_type=ct, object_id=object.pk)
            read_num.read_num += 1
            read_num.save()

            date = timezone.now().date()
            read_detail, created = ReadDetail.objects.get_or_create(
                content_type=ct, object_id=object.pk, date=date)
            read_detail.read_num += 1
            read_detail.save()
        return key

    def get_seven_read_data(content_type):
        today = timezone.now().date()
        read_nums = []
        dates = []
        for i in range(7, 0, -1):
            date = today-datetime.timedelta(days=i)
            read_details = ReadDetail.objects.filter(
                content_type=content_type, date=date)
            result = read_details.aggregate(read_num_sum=Sum('read_num'))
            read_nums.append(result['read_num_sum'] or 0)
            dates.append(date.strftime('%m/%d'))
        return read_nums,dates

    def get_today_hot_data(content_type):
        today = timezone.now().date()
        read_details = ReadDetail.objects.filter(content_type=content_type, date=today).order_by('-read_num')
        print(read_details[:7])
        return read_details[:7]

    def get_yesterday_hot_data(content_type):
        today = timezone.now().date()
        yesterday = today - datetime.timedelta(days=1)
        read_details = ReadDetail.objects.filter(content_type=content_type, date=yesterday).order_by('-read_num')
        return read_details[:7]

    def get_week_hot_data(Blog):
        today = timezone.now().date()
        date = today - datetime.timedelta(days=7)
        read_details = Blog.objects.filter(read_details__date__lt=today, read_details__date__gte=date) \
                                         .values('id', 'title').annotate(read_num_sum=Sum('read_details__read_num')).order_by('-read_num_sum')
        return read_details[:7]

