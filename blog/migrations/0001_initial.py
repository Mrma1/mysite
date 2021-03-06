# Generated by Django 3.0.6 on 2020-05-17 11:14

import ckeditor_uploader.fields
from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import read_statist.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='BlogType',
            fields=[
                ('id', models.AutoField(auto_created=True,
                                        primary_key=True, serialize=False, verbose_name='ID')),
                ('blog_type', models.CharField(max_length=15)),
            ],
        ),
        migrations.CreateModel(
            name='Blog',
            fields=[
                ('id', models.AutoField(auto_created=True,
                                        primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=50)),
                ('content', ckeditor_uploader.fields.RichTextUploadingField()),
                ('created_time', models.DateTimeField(auto_now_add=True)),
                ('last_updated_time', models.DateTimeField(auto_now=True)),
                ('author', models.ForeignKey(
                    on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('blog_type', models.ForeignKey(
                    on_delete=django.db.models.deletion.CASCADE, to='blog.BlogType')),
            ],
            options={
                'ordering': ['-created_time'],
            },
            bases=(models.Model, read_statist.views.ReadNumExpendMethod),
        ),
    ]
