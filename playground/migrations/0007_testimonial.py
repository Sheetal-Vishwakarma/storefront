# Generated by Django 4.2 on 2024-08-26 11:05

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('playground', '0006_alter_newsletter_updated_at'),
    ]

    operations = [
        migrations.CreateModel(
            name='Testimonial',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('email', models.EmailField(max_length=254, null=True, unique=True)),
                ('designation', models.CharField(max_length=255, null=True)),
                ('rating', models.IntegerField(null=True,max_length=1)),
                ('description', models.TextField(null=True)),
                ('image_link', models.TextField(null=True)),
                ('is_active', models.IntegerField(default=1)),
                ('created_by', models.IntegerField(blank=True, null=True)),
                ('created_at', models.DateTimeField(default=datetime.datetime.now)),
                ('updated_at', models.DateTimeField(default=datetime.datetime.now, null=True)),
            ],
            options={
                'db_table': 'testimonial',
            },
        ),
    ]
