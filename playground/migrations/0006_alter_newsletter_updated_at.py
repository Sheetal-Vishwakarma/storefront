# Generated by Django 4.2 on 2024-08-26 08:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('playground', '0005_alter_newsletter_created_at'),
    ]

    operations = [
        migrations.AlterField(
            model_name='newsletter',
            name='updated_at',
            field=models.DateTimeField(null=True),
        ),
    ]
