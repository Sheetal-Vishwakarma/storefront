from rest_framework.authentication import SessionAuthentication, BasicAuthentication, TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.authtoken.views import ObtainAuthToken
from rest_framework.authtoken.models import Token
from rest_framework.decorators import api_view, authentication_classes,permission_classes
from rest_framework.response import Response
from rest_framework import status
from .models import Person
from .serializer import PersonSerializer

@api_view(['GET'])
@authentication_classes([TokenAuthentication,SessionAuthentication, BasicAuthentication])
@permission_classes([IsAuthenticated])
def get_person(request):
    persons = Person.objects.all()
    serializer = PersonSerializer(persons,many=True)
    return Response(serializer.data,status=status.HTTP_200_OK)

@api_view(['POST'])
@authentication_classes([TokenAuthentication,SessionAuthentication, BasicAuthentication])
@permission_classes([IsAuthenticated])
def create_person(request):
    serializer = PersonSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response(serializer.data,status=status.HTTP_201_CREATED)
    return  Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET','PUT','DELETE'])
@authentication_classes([TokenAuthentication,SessionAuthentication, BasicAuthentication])
@permission_classes([IsAuthenticated])
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

class CustomAuthToken(ObtainAuthToken):

    def post(self, request, *args, **kwargs):
        serializer = self.serializer_class(data=request.data,
                                           context={'request': request})
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        token, created = Token.objects.get_or_create(user=user)
        return Response({
            'token': token.key,
            'user_id': user.pk,
            'email': user.email
        })