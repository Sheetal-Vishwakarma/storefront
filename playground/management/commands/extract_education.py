import re
from datetime import datetime
from django.core.management.base import BaseCommand
from django.http import JsonResponse

class Command(BaseCommand):
    help = 'Extract education details from text and save to the database'

    def handle(self, *args, **kwargs):
        text = """
        Bachelor in Computer Science
        Mumbai University
        July 2016 - April 2019
        """
        # Regular expression to extract education details
        pattern = re.compile(
            r'(?P<degree>Bachelor in [\w\s]+)\s*'
            r'(?P<institution>[A-Za-z\s]+)\s*'
            r'(?P<start_date>[A-Za-z]+\s\d{4})\s*-\s*(?P<end_date>[A-Za-z]+\s\d{4})'
        )
        match = pattern.search(text)
        print('-----match--------')
        print(match)
        print('-----match--------')
        education_arr = {}
        if match:
            degree = match.group('degree')
            institution = match.group('institution')
            # start_date = datetime.strptime(match.group('start_date'), '%B %Y').date()
            # end_date = datetime.strptime(match.group('end_date'), '%B %Y').date()
            
            education_arr['degree'] = degree
            education_arr['institution'] = institution
            # education_arr['start_date'] = start_date
            # education_arr['end_date'] = end_date
            # return JsonResponse(education_arr)
            print(education_arr)
        else:
            self.stdout.write(self.style.ERROR('Failed to extract education details'))
