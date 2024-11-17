from django.db import models


class Course(models.Model):
    title = models.CharField(max_length=255, verbose_name='название курса')
    preview = models.ImageField(upload_to='course/photo', blank=True, null=True)
    description = models.TextField()

    def __str__(self):
        return f"{self.title} - {self.description}"

    class Meta:
        verbose_name = 'курс'
        verbose_name_plural = 'курсы'
        ordering = ['title']


class Lesson(models.Model):
    title = models.CharField(max_length=255, verbose_name='название курса')
    description = models.TextField()
    preview = models.ImageField(upload_to='lesson/photo', blank=True, null=True)
    link_to_video = models.URLField(max_length=200, blank=True, null=True)
    course = models.ForeignKey(Course, related_name='lessons', on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.title} - {self.description}"

    class Meta:
        verbose_name = 'урок'
        verbose_name_plural = 'уроки'
        ordering = ['title']
