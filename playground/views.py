from django.shortcuts import render
from .models import User, Contactus, Newsletter, Testimonial, Portfolio
import datetime
from playground.functions.functions import handle_uploaded_file
import storefront.settings
from pyresparser import ResumeParser
import nltk
from pdfminer.high_level import extract_text
from pdfminer.layout import LAParams
import pdfplumber
import os
from django.http import JsonResponse
# from django.core import serializers     
# from django.shortcuts import redirect
#resume parser functions
from playground.functions.resume_parser_regex import  extract_phone_number,extract_emails,extract_education,extract_skills, convert_text_to_array,extract_name
import json, requests
# Create your views here.
from django.http import HttpResponse
from django.core.mail import send_mail
 
base_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
pages = [0, 2]

def index(request):
    testimonials = Testimonial.objects.filter(is_active=1).values().order_by('-id') 
    return render(request,'index.html',context={'testimonials':testimonials,'header_class':'header d-flex align-items-center fixed-top','page':'Home','body_class':'index-page','resume_extracted_data':'test sh'})

def say_hello(request):
    # return HttpResponse('Hello Python World!')
    return render(request,'hello.html',{'name':'Siya'})

def register_form(request):
    return render(request,'register.html',{'food':['Cake','Burger','Pizza']})
 
def insert_user(request):
    name = request.POST['name']
    email = request.POST['email']
    contact = request.POST['contact']
    password = request.POST['password']

    db_user = User
    if db_user.objects.filter(email=email).exists():
        return  render(request,'register.html',{'email_err':"A User with this email already exists."}) 
    else:
        today = datetime.datetime.now() # Returns 2018-01-15 09:00    
        user_object = User(name=name,email=email,contact=contact,password=password,created_at=today,updated_at=today)
        user_object.save()
        return render(request,'thank_you.html',{})

def thank_you(request):
    return render(request,'thank_you.html',{})

def insert_contact(request):
    # if request.POST:
    #     return HttpResponse(True)
    # else:
    #     return HttpResponse(request) 
    today = datetime.datetime.now() # Returns 2018-01-15 09:00    
    contact_us_obj = Contactus(name=request.POST['name'],email=request.POST['email'],subject=request.POST['subject'],message=request.POST['message'],created_at=today,updated_at=today)
    check_db = contact_us_obj.save()
    LastInsertId = (Contactus.objects.last()).id    
    if LastInsertId>0:
        #Send email
        subject = 'New inquiry received'
        message=f"Hello Admin,\n\n\n Name : {request.POST['name']}\n\n Email : {request.POST['email']}\n\n Message : {request.POST['message']}\n\n\nRegards,\nTeam Blog"
        send_smtp_email(['sheetalvishwakarma69106@gmail.com'],subject,message)
        return HttpResponse('success')
    else:
        return HttpResponse('error')
    # return render(request,'index.html',{'success_msg':'Form submitted successfully'})

def insert_newsletter(request):
        today = datetime.datetime.now() # Returns 2018-01-15 09:00  
        if Newsletter.objects.filter(email=request.POST['email']).exists():  
             return HttpResponse('duplicate')
        else:
            newsletter_obj = Newsletter(email=request.POST['email'],subscribed='1',created_at=today,updated_at=today)
            newsletter_obj.save()
            LastInsertId = (Newsletter.objects.last()).id    
            if LastInsertId>0:
                return HttpResponse('success')
            else:
                return HttpResponse('error')     

def portfolio(request,id):    
    try:
        portfolio = Portfolio.objects.get(id=id)
    except Portfolio.DoesNotExist:
        portfolio = list()        
    context = {'body_class':'portfolio-details-page','header_class':'header d-flex align-items-center sticky-top','page':'Portfolio Details','portfolio':portfolio}
    return render(request,'portfolio-details.html',context=context)

def resume_parsing(request):    
    if request.FILES['document']:
        #Upload file to upload folder
        file_name = handle_uploaded_file(request.FILES['document']) 
        
        # file_url =  f"{storefront.settings.BASE_DIR} {'playground/static/upload/'+request.FILES['document'].name}"
        resume_data = {}
        file_path = os.path.join(base_dir, 'playground', 'static', 'upload', file_name)
        # Check if the file exists
        if os.path.exists(file_path):
            print("File exists.")
        else:
            print("File does not exist.")

        data=extract_text(file_path)
        resume_email = extract_emails(data)
        resume_phone_no = extract_phone_number(data)
        resume_educations = extract_education(data)
        resume_skills = extract_skills(data)
        # print('-----Resume data-----')
        # print(data)   
        # print('-----Resume extracted data-----')

        print(f"Phone number: {resume_phone_no}")
        print(f"Email id : {resume_email}")
        print(f"Education : {resume_educations}")
        print(f"Skills : {resume_skills}")

        # Ensure 'emails' key exists and extend the list
        if 'emails' not in resume_data:
            resume_data['emails'] = {}
        if isinstance(resume_educations, set):
            resume_educations = list(resume_educations)
        if isinstance(resume_skills, set):
            resume_skills = list(resume_skills)       

        print(resume_data)            
        data_arr =  data.split('\n\n')
        if(len(data_arr[0].strip())==2):
            check_is_valid_name = True
        else:
            check_is_valid_name = False    

        print(f"check_is_valid_name : '{check_is_valid_name}'")
        if(check_is_valid_name==True):        
            resume_name = data_arr[0].strip()
        else:
            name_arr = (data_arr[0].strip()).split('\n')
            resume_name = name_arr[0].strip()

        if resume_phone_no!='None':
           resume_phone_no = resume_phone_no.replace('-',' ')

        resume_data['name'] =  resume_name
        resume_data['emails'] = resume_email
        resume_data['conatct_no'] = resume_phone_no
        resume_data['educations'] = resume_educations
        resume_data['skills'] = resume_skills          
        
        is_resume_data = any(
                value for value in resume_data.values() if (isinstance(value, (str, list, dict)) and value)
            )
        resume_data['is_resume_data'] = is_resume_data
        testimonials = Testimonial.objects.filter(is_active=1).values().order_by('-id') 
        return render(request,'index.html',context={'testimonials':testimonials,'header_class':'header d-flex align-items-center fixed-top','page':'Home','body_class':'index-page','resume_extracted_data':resume_data})        
    else:    
        return HttpResponse('Something went wrong')
    # if request.POST :
    #     print(request.FILES['document'])
    #     return HttpResponse('success')
        
def parse_pdf_resume(request):    
    resume_data = {}
    file_path = os.path.join(base_dir, 'playground', 'static', 'upload', '2024-09-12_Chaitany_DevOps_Resume.pdf')
    # Check if the file exists
    if os.path.exists(file_path):
        print("File exists.")
    else:
        print("File does not exist.")
    extract_data = extract_text_from_pages_with_pdfplumber(file_path, pages)
    print('-----text------')
    print(extract_data)
    print('-----text------')

    # extract_data=extract_text(file_path, laparams=LAParams())

    resume_email = extract_emails(extract_data)
    resume_phone_no = extract_phone_number(extract_data)
    resume_educations = extract_education(extract_data)
    resume_skills = extract_skills(extract_data)
    # print('-----Resume data-----')
    # print(extract_data)   
    # print('-----Resume extracted data-----')

    # print(f"Phone number: {resume_phone_no}")
    # print(f"Email id : {resume_email}")
    # print(f"Education : {resume_educations}")
    # print(f"Skills : {resume_skills}")

    # Ensure 'emails' key exists and extend the list
    if 'emails' not in resume_data:
        resume_data['emails'] = {}
    if isinstance(resume_educations, set):
        resume_educations = list(resume_educations)
    if isinstance(resume_skills, set):
        resume_skills = list(resume_skills)       
    data_arr =  extract_data.split('\n\n')

    if(len(data_arr[0].strip())==2):
        check_is_valid_name = True
    else:
        check_is_valid_name = False    

    print(f"check_is_valid_name : '{check_is_valid_name}'")
    if(check_is_valid_name==True):        
        resume_name = data_arr[0].strip()
    else:
        name_arr = (data_arr[0].strip()).split('\n')
        resume_name = name_arr[0].strip()

    url = "https://api.iki.ai/api/skills_extraction/"
    payload = {
        "text":str(extract_data[0:2000])
    }

    headers = {
        'Authorization': 'Bearer YOUR_API_TOKEN',
        'Content-Type': 'application/json'
    }

    print(len(extract_data))
    resume_text_data = extract_data

    r = requests.post(url=url, headers=headers, data=json.dumps(payload))
    print(r.json())
    resume_data['name'] =  resume_name   
    resume_data['emails'] = resume_email
    resume_data['conatct_no'] = resume_phone_no
    resume_data['educations'] = resume_educations
    resume_data['skills'] = resume_skills
    print(resume_data)

    is_resume_data = any(
                    value for value in resume_data.values() if (isinstance(value, (str, list, dict)) and value)
                )
    resume_data['is_resume_data'] = is_resume_data
    print(is_resume_data)
    return JsonResponse(resume_data) 
def extract_text_from_pages_with_pdfplumber(pdf_path, page_numbers=None):
    text = ""
    try:
        with pdfplumber.open(pdf_path) as pdf:
            for page_number in (page_numbers if page_numbers is not None else range(len(pdf.pages))):
                if 0 <= page_number < len(pdf.pages):
                    page = pdf.pages[page_number]
                    text += page.extract_text()
    except Exception as e:
        print(f"Error extracting text from PDF: {e}")

    return text
#Send the email using SMTP Mail
def send_smtp_email(email_arr, subject, msg):    
    check_email_send = send_mail(subject = subject, #'This is your subject',
                            message = msg,#"Hi,<br> That's your message body",
                            from_email = storefront.settings.EMAIL_HOST_USER,
                            recipient_list = email_arr, #['sheetalvishwakarma69106@gmail.com','meerav01011971@gmail.com','chaitanyavantaku@gmail.com'],
                            auth_user = storefront.settings.EMAIL_HOST_USER,
                            auth_password = storefront.settings.EMAIL_HOST_PASSWORD,
                            fail_silently = False
                        )  
    print(f"'Email send : {check_email_send}'")
    return check_email_send #HttpResponse(check_email_send)

def search_resume_skill(request):
    print('----------------data-------------')
    print(request.POST['search_input'])
    print(request.POST['resume_skill'])
    print('----------------data-------------')
    return HttpResponse('success')