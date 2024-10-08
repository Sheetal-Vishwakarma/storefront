from django.contrib import admin
from .models import Newsletter, Contactus, Testimonial, Portfolio
# Register your models here.
# admin.site.register(Contactus)
# admin.site.register(Newsletter)
@admin.register(Testimonial)
class TestimonialAdmin(admin.ModelAdmin):
    list_display = ("id","name","designation","rating","description","is_active")

# admin.site.register(Testimonial)
# admin.site.register(Portfolio)
@admin.register(Portfolio)
class PortfolioAdmin(admin.ModelAdmin):
    list_display = ('id','type','category','client','project_date','project_url','short_description','long_description')