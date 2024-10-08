import datetime

def handle_uploaded_file(f): 
    file_name = f"{datetime.datetime.today().date()}_{f.name}"
    with open('playground/static/upload/'+file_name, 'wb+') as destination:  
        for chunk in f.chunks():  
            destination.write(chunk)
    return file_name        