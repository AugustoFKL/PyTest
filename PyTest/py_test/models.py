from django.db import models


# Create your models here.
class Organization:
    name = models.CharField(max_length=100)
