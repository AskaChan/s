# urls.py

from django.urls import path
from . import views

urlpatterns = [
    path('exam/<int:exam_id>/', views.exam_detail, name='exam_detail'),
    path('exams/', views.exam_list, name='exam_list'),
    path('submit_exam/', views.submit_exam, name='submit_exam'),
    path('exam/questions/', views.exam_questions, name='exam_questions'),
    path('evaluate/all/', views.evaluate_all_exams, name='evaluate_all_exams'),
    path('incorrect-answers-wordcloud/', views.incorrect_questions_wordcloud, name='incorrect_answers_wordcloud'),



]
