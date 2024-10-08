# myapp/management/commands/convert_text.py

from django.core.management.base import BaseCommand
from playground.functions.resume_parser_regex import convert_text_to_array

class Command(BaseCommand):
    help = 'Converts text to an array format'

    def handle(self, *args, **kwargs):
        # Sample text
        text = """[Insert the text here]"""
        
        # Convert text to array
        data = convert_text_to_array(text)
        
        # Print the structured data
        for key, value in data.items():
            self.stdout.write(f'{key.upper()}:')
            for item in value:
                self.stdout.write(f' - {item}')
            self.stdout.write('')

