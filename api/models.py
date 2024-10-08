from django.db import models

# Create your models here.
class Person(models.Model):
    name = models.CharField(max_length=200)
    email = models.EmailField()
    contact = models.CharField(max_length=15,null=True)
    created_at = models.DateTimeField(null=True)
    updated_at = models.DateTimeField(null=True)
    class Meta:
        db_table ="person"
    def __str__(self) -> str:
        return self.name    