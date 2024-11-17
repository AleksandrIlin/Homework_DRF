from rest_framework import serializers
from .models import CustomUser, Payments


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = CustomUser
        fields = '__all__'


class PaymentsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Payments
        fields = '__all__'


class CustomsUserDetailSerializer(serializers.ModelSerializer):
    payment_history = PaymentsSerializer(many=True, read_only=True)

    class Meta:
        model = CustomUser
        fields = ['id', 'email', 'phone_number', 'avatar', 'city', 'payment_history']
