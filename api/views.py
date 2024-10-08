from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from .models import Person
from .serializer import PersonSerializer

@api_view(['GET'])
def get_person(request):
    persons = Person.objects.all()
    serializer = PersonSerializer(persons,many=True)
    return Response(serializer.data,status=status.HTTP_200_OK)

@api_view(['POST'])
def create_person(request):
    serializer = PersonSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data,status=status.HTTP_201_CREATED)
    return  Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET','PUT','DELETE'])
def person_detail(request,pk):
    try:
        person = Person.objects.get(pk=pk)
    except Person.DoesNotExist:
        msg = f"Person not found with this id - {pk}"
        return Response(msg,status=status.HTTP_404_NOT_FOUND)
    
    if request.method=='GET':
        serializer = PersonSerializer(person)
        return Response(serializer.data)    
    elif request.method == 'PUT':
        serializer = PersonSerializer(person,data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        return Response(serializer.error,status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        person.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)

