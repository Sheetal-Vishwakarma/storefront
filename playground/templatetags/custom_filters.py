from django import template
from django.template.defaultfilters import stringfilter

register = template.Library()

@register.filter
def range_filter(value):
    return range(value)

@register.filter
def lower(value):
    return value.lower()

@register.filter
def upper(value):
    return value.upper()

@register.filter
def length_is(value, arg):
    return len(value) == arg