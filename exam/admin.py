# admin.py

from django.contrib import admin
from .models import Exam, Question, Choice

class ChoiceInline(admin.TabularInline):
    model = Choice
    extra = 3

class QuestionAdmin(admin.ModelAdmin):
    inlines = [ChoiceInline]

admin.site.register(Exam)
admin.site.register(Question, QuestionAdmin)

from django.contrib import admin
from .models import Exam, Question, Choice, UserExam, UserAnswer, UserScore,FillInBlankAnswer


admin.site.register(Choice)
admin.site.register(UserExam)
admin.site.register(UserAnswer)
admin.site.register(UserScore)
admin.site.register(FillInBlankAnswer)