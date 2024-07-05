from django.db import models
from django.contrib.auth.models import User


class Exam(models.Model):
    title = models.CharField(max_length=100, verbose_name='试卷标题')
    total_marks = models.IntegerField(default=0, verbose_name='总分')

    def __str__(self):
        return self.title


class Question(models.Model):
    MULTIPLE_CHOICE = 'MC'
    FILL_IN_BLANK = 'FB'
    QUESTION_TYPE_CHOICES = [
        (MULTIPLE_CHOICE, 'Multiple Choice'),
        (FILL_IN_BLANK, 'Fill in the Blank'),
    ]

    exam = models.ForeignKey(Exam, on_delete=models.CASCADE, related_name='questions', verbose_name='试卷')
    question_text = models.CharField(max_length=200, verbose_name='题目内容')
    marks = models.IntegerField(default=1, verbose_name='分值')
    question_type = models.CharField(max_length=2, choices=QUESTION_TYPE_CHOICES, default=MULTIPLE_CHOICE,
                                     verbose_name='题目类型')

    def __str__(self):
        return self.question_text
class FillInBlankAnswer(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE, related_name='fill_in_blank_answers', verbose_name='题目')
    correct_answer = models.CharField(max_length=200, verbose_name='正确答案')
    is_correct = models.BooleanField(default=False, verbose_name='是否正确答案')

    def __str__(self):
        return self.correct_answer

class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE, related_name='choices', verbose_name='题目')
    choice_text = models.CharField(max_length=100, verbose_name='选项内容')
    is_correct = models.BooleanField(default=False, verbose_name='是否正确答案')

    def __str__(self):
        return self.choice_text


class UserExam(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='user_exams', verbose_name='用户')
    exam = models.ForeignKey(Exam, on_delete=models.CASCADE, related_name='user_exams', verbose_name='试卷')
    submitted = models.BooleanField(default=False, verbose_name='是否已提交')

    def __str__(self):
        return f"{self.user.username} - {self.exam.title}"


class UserAnswer(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='answers', verbose_name='用户', default=1)
    user_exam = models.ForeignKey(UserExam, on_delete=models.CASCADE, related_name='answers', verbose_name='用户试卷')
    question = models.ForeignKey(Question, on_delete=models.CASCADE, related_name='answers', verbose_name='问题')
    choice = models.ForeignKey(Choice, on_delete=models.CASCADE, related_name='answers', verbose_name='选择', null=True,
                               blank=True)
    fill_in_blank_answer = models.CharField(max_length=200, verbose_name='填空题答案', null=True, blank=True)

    def __str__(self):
        return f"{self.user.username} - {self.question.question_text} - {self.choice.choice_text if self.choice else self.fill_in_blank_answer}"


class UserScore(models.Model):
    user_exam = models.OneToOneField(UserExam, on_delete=models.CASCADE, related_name='score', verbose_name='用户试卷')
    score = models.IntegerField(default=0, verbose_name='得分')

    def __str__(self):
        return f"{self.user_exam.user.username} - {self.user_exam.exam.title} - Score: {self.score}"
class IncorrectAnswer(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='incorrect_answers', verbose_name='用户')
    question = models.ForeignKey(Question, on_delete=models.CASCADE, related_name='incorrect_answers', verbose_name='问题')
    incorrect_answer = models.TextField(verbose_name='错误答案')
    timestamp = models.DateTimeField(auto_now_add=True, verbose_name='提交时间')

    def __str__(self):
        return f"{self.user.username} - {self.question.question_text} - {self.incorrect_answer}"


class WrongName(models.Model):
    name = models.CharField(max_length=1000)