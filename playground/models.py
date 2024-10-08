from django.db import models
import datetime

# Create your models here.
class User(models.Model):
    name = models.CharField(max_length=200)
    email = models.EmailField()
    contact = models.CharField(max_length=15,null=True)
    password = models.CharField(max_length=50,null=True)
    created_at = models.DateTimeField()
    updated_at = models.DateTimeField()    
    class Meta:
        db_table ="user"

class Contactus(models.Model):
    name = models.TextField()
    email = models.EmailField(null=True)
    subject = models.TextField(null=True)
    message = models.TextField(null=True)
    created_at = models.DateTimeField(null=True)
    updated_at = models.DateTimeField(null=True)    
    class Meta:
        db_table ="contact_us"

class SubscribedOptions(models.IntegerChoices):
    ONE = "0"
    TWO = "1"

class Newsletter(models.Model):
    email = models.EmailField(unique=True,null=True)
    subscribed = models.IntegerField(null=False)
    created_at = models.DateTimeField(null=True)
    updated_at = models.DateTimeField(null=True)    
    class Meta:
        db_table ="newsletter"        

class Testimonial(models.Model):
    name = models.CharField(max_length=255,null=False)    
    email = models.EmailField(unique=True,null=True)
    designation = models.CharField(max_length=255,null=True)
    rating = models.IntegerField(null=True)
    description = models.TextField(null=True)
    image_link = models.TextField(null=True)
    is_active = models.IntegerField(default=1)
    created_by = models.IntegerField(blank=True,null=True)
    created_at = models.DateTimeField(default=datetime.datetime.now)
    updated_at = models.DateTimeField(default=datetime.datetime.now,null=True)    
    class Meta:
        db_table ="testimonial"

class Portfolio(models.Model):
    TYPE_CHOICES = (
        ('App', 'App'),
        ('Product','Product'),
        ('Branding','Branding'),
        ('Video','Video')        
        )
    
    type = models.CharField(max_length=100,choices=TYPE_CHOICES,default='App')
    category = models.CharField(max_length=255,null=False)
    client = models.CharField(max_length=200,null=False)
    project_date = models.DateField(null=False,blank=True)
    project_url = models.CharField(max_length=200,null=False,blank=True)
    short_description = models.TextField(max_length=300,null=False,blank=True)
    long_description = models.TextField(null=False,blank=True)
    image_1 = models.CharField(max_length=255,blank=True,null=True)
    image_2 = models.CharField(max_length=255,blank=True,null=True)
    image_3 = models.CharField(max_length=255,blank=True,null=True)
    image_4 = models.CharField(max_length=255,blank=True,null=True)
    created_by = models.IntegerField(blank=True,null= True)
    created_at = models.DateTimeField(default=datetime.datetime.now,blank=False)
    updated_at = models.DateTimeField(blank=True,null=True)

    class Meta:
        db_table = 'portfolio'