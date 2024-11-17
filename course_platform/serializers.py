from rest_framework import serializers
from rest_framework.fields import SerializerMethodField
from course_platform.models import Course, Lesson


class CourseSerializers(serializers.ModelSerializer):

    class Meta:
        model = Course
        fields = '__all__'


class LessonSerializers(serializers.ModelSerializer):

    class Meta:
        model = Lesson
        fields = '__all__'


class CourseDetailSerializers(serializers.ModelSerializer):
    number_of_lessons = SerializerMethodField()
    lessons = LessonSerializers(many=True, read_only=True)

    def get_number_of_lessons(self, obj):
        return obj.lessons.count()

    class Meta:
        model = Course
        fields = ['id', 'title', 'preview', 'description', 'number_of_lessons', 'lessons']
