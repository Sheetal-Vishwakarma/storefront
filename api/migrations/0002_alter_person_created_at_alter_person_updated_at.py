# Generated by Django 4.2 on 2024-10-08 11:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='person',
            name='created_at',
            field=models.DateTimeField(null=True),
        ),
        migrations.AlterField(
            model_name='person',
            name='updated_at',
            field=models.DateTimeField(null=True),
        ),
    ]
