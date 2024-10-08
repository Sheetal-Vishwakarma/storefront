"""
URL configuration for storefront project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import re_path as url, include, path
# import debug_toolbar
from playground.views import *

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('',include('playground.urls')),
    path('portfolio_details/<int:id>/',portfolio),
    path('resume_parsing/',resume_parsing),
    path('parse_pdf_resume/',parse_pdf_resume),
    path('send_smtp_email/', send_smtp_email),
    path('search_resume_skill/', search_resume_skill),
    url(r'^admin/', admin.site.urls),
    path('api/',include('api.urls'))
    # url(r'', include('playground.urls')),   # To make post app available at /
    # path('_debug_',include(debug_toolbar.urls))    
]
