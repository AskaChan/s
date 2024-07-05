# views.py

from django.shortcuts import render, redirect
from .models import Exam, UserAnswer

import random
from django.shortcuts import render, redirect
from .models import Exam, UserAnswer


def exam_detail(request, exam_id):
    exam = Exam.objects.get(id=exam_id)
    questions = list(exam.questions.all())
    print (questions)
    random.shuffle(questions)
    print(questions)
    if request.method == 'POST':
        for question in exam.questions.all():
            choice_id = request.POST.get(f'question_{question.id}')
            user_answer = UserAnswer(user=request.user, question=question, choice_id=choice_id)
            user_answer.save()
        return redirect('exam_result', exam_id=exam.id)

    return render(request, 'exam_detail.html', {'exam': exam, 'questions': questions})


# views.py

from django.shortcuts import render
from .models import Exam

def exam_list(request):
    exams = Exam.objects.all()
    return render(request, 'exam_list.html', {'exams': exams})


# views.py

# views.py

from django.shortcuts import render, redirect
from .models import Exam, Choice, UserAnswer,Question

# views.py

from django.shortcuts import render, redirect
from .models import Exam, UserAnswer,FillInBlankAnswer

from .models import UserExam

from django.shortcuts import render, redirect
from .models import Exam, UserAnswer

from .models import UserExam

# views.py

from django.shortcuts import render, redirect
from .models import Exam, Question, Choice, UserExam, UserAnswer, FillInBlankAnswer


def submit_exam(request):
    if request.method == 'POST':
        exam_id = request.POST.get('exam_id')  # 获取试卷ID
        # 处理试卷提交
        user_exam = UserExam.objects.create(user=request.user, exam_id=exam_id)

        for key, value in request.POST.items():
            if key.startswith('question_'):
                question_id = int(key.split('_')[1])
                question = Question.objects.get(pk=question_id)

                if question.question_type == "MC":
                    choice_id = int(value)
                    choice = Choice.objects.get(pk=choice_id)
                    UserAnswer.objects.create(user_exam=user_exam, question=question, choice=choice)
                elif question.question_type == "FB":
                    user_answer = value
                    UserAnswer.objects.create(user_exam=user_exam, question=question, fill_in_blank_answer=user_answer)

        return redirect('home')  # 重定向到主页或其他结果页面
    else:
        return redirect('exam_list')  # 如果不是 POST 请求，则重定向到试卷列表页面


# views.py

from django.shortcuts import render
from .models import Question,IncorrectAnswer

def exam_questions(request):
    questions = Question.objects.all()
    return render(request, 'exam_questions.html', {'questions': questions})


# views.py

from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .models import UserExam




# @login_required
# def evaluate_all_exams(request):
#     # 获取当前用户的所有试卷
#     user_exams = UserExam.objects.filter(user=request.user)
#
#     # 对每份试卷进行自动评分
#     for user_exam in user_exams:
#         # 获取试卷的所有题目
#         questions = user_exam.exam.questions.all()
#         total_marks = 0
#
#         # 遍历每个题目，检查用户的答案是否正确，并计算总分
#         for question in questions:
#             user_answer = user_exam.answers.filter(question=question).first()
#             if user_answer:
#                 if question.question_type=='MC':
#                     if user_answer.choice.is_correct:
#                         total_marks += question.marks
#                     else:
#                         print (user_answer.choice.choice_text)
#                         IncorrectAnswer.objects.create(
#                             user=user_exam.user,
#                             question=question,
#                             incorrect_answer=user_answer.choice.choice_text
#                         )
#                 else:
#                     fill_in_blank_question = FillInBlankAnswer.objects.get(question=question)
#                     correct_answer = fill_in_blank_question.correct_answer
#                     if user_answer.fill_in_blank_answer.strip().lower() == correct_answer.strip().lower():
#                         total_marks += question.marks
#                     else:
#                         IncorrectAnswer.objects.create(
#                             user=user_exam.user,
#                             question=question,
#                             incorrect_answer=user_answer.fill_in_blank_answer
#                         )
#
#         user_exam.total_marks = total_marks
#         user_exam.save()
#
#     # 返回评分结果页面，并传递总分数据
#     return render(request, 'exam_result.html', {'total_marks': total_marks})

from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from .models import UserExam, IncorrectAnswer, FillInBlankAnswer,WrongName

@login_required
def evaluate_all_exams(request):
    # 获取当前用户的所有试卷
    user_exams = UserExam.objects.filter(user=request.user)
    wrongname = []

    # 定义一个空列表用于存储每份试卷的得分详情
    user_exam_results = []

    # 对每份试卷进行自动评分
    for user_exam in user_exams:
        # 获取试卷的所有题目
        questions = user_exam.exam.questions.all()
        total_marks = 0
        question_results = []

        # 遍历每个题目，检查用户的答案是否正确，并计算总分
        for question in questions:
            user_answer = user_exam.answers.filter(question=question).first()
            if user_answer:
                if question.question_type == 'MC':
                    if user_answer.choice.is_correct:
                        total_marks += question.marks
                        question_results.append({
                            'question': question.question_text,
                            'user_answer': user_answer.choice.choice_text,
                            'is_correct': True
                        })
                    else:
                        IncorrectAnswer.objects.create(
                            user=user_exam.user,
                            question=question,
                            incorrect_answer=user_answer.choice.choice_text
                        )
                        question_results.append({
                            'question': question.question_text,
                            'user_answer': user_answer.choice.choice_text,
                            'is_correct': False
                        })
                else:
                    fill_in_blank_question = FillInBlankAnswer.objects.get(question=question)
                    correct_answer = fill_in_blank_question.correct_answer
                    if user_answer.fill_in_blank_answer.strip().lower() == correct_answer.strip().lower():
                        total_marks += question.marks
                        question_results.append({
                            'question': question.question_text,
                            'user_answer': user_answer.fill_in_blank_answer,
                            'is_correct': True
                        })
                    else:
                        IncorrectAnswer.objects.create(
                            user=user_exam.user,
                            question=question,
                            incorrect_answer=user_answer.fill_in_blank_answer
                        )
                        question_results.append({
                            'question': question.question_text,
                            'user_answer': user_answer.fill_in_blank_answer,
                            'is_correct': False
                        })

        user_exam.total_marks = total_marks
        user_exam.save()

        user_exam_results.append({
            'user_exam': user_exam,
            'total_marks': total_marks,
            'question_results': question_results
        })
    for i in user_exam_results:
        for j in i['question_results']:
            if j['is_correct'] ==  False:
                wrongname.append(j['question'])
                WrongName.objects.create(name=j['question'])
    print (wrongname)
    # 返回评分结果页面，并传递用户考试结果数据
    return render(request, 'exam_result.html', {'user_exam_results': user_exam_results})

# views.py

from django.shortcuts import render
from .models import UserAnswer


@login_required
def exam_result(request):
    # 获取用户的所有答案记录
    user_answers = UserAnswer.objects.filter(user=request.user)

    # 初始化总分和每道题目的得分情况字典
    total_marks = 0
    question_results = {}

    # 遍历用户答案，计算总分和每道题目的得分情况
    for user_answer in user_answers:
        question = user_answer.question
        is_correct = user_answer.choice.is_correct
        if is_correct:
            total_marks += question.marks
        question_results[question] = is_correct

    # 渲染页面并传递数据
    return render(request, 'exam_result1.html', {'total_marks': total_marks, 'question_results': question_results})


# views.py

from django.shortcuts import render, redirect
from django.contrib import messages
from .models import UserExam, UserScore

# views.py

from django.shortcuts import render
from .models import UserExam

from django.contrib.auth.decorators import login_required
from django.shortcuts import render
from .models import UserExam

@login_required
def score_details(request):
    # 获取当前用户的所有试卷
    user_exams = UserExam.objects.filter(user=request.user)

    # 定义一个空字典用于存储每份试卷的得分详情
    user_exam_results = {}

    # 对每份试卷进行得分详情统计
    for user_exam in user_exams:
        # 获取试卷的所有题目
        questions = user_exam.exam.questions.all()

        # 初始化当前试卷的得分详情
        question_results = {}

        # 遍历每个题目，检查用户的答案是否正确，并记录在得分详情中
        for question in questions:
            user_answer = user_exam.answers.filter(question=question).first()
            if user_answer:
                is_correct = user_answer.choice.is_correct
                question_results[question] = is_correct

        # 将得分详情添加到字典中，键为试卷对象，值为得分详情
        user_exam_results[user_exam] = question_results
    print (user_exam_results)
    return render(request, 'score_details.html', {'user_exam_results': user_exam_results})
from django.shortcuts import render
from .models import UserExam

@login_required
def average_score(request):
    # 获取当前用户的所有试卷
    user_exams = UserExam.objects.filter(user=request.user)

    total_marks = 0
    total_exams = 0

    # 对每份试卷进行自动评分，并计算总分
    for user_exam in user_exams:
        # 获取试卷的所有题目
        questions = user_exam.exam.questions.all()
        exam_total_marks = 0

        # 遍历每个题目，检查用户的答案是否正确，并计算总分
        for question in questions:
            user_answer = user_exam.answers.filter(question=question).first()
            if user_answer:
                if user_answer.choice.is_correct:
                    exam_total_marks += question.marks

        total_marks += exam_total_marks
        total_exams += 1

    # 计算平均分数
    if total_exams > 0:
        average_score = total_marks / total_exams
    else:
        average_score = 0

    return render(request, 'average_score.html', {'average_score': average_score})


from django.shortcuts import render
from pyecharts import options as opts
from pyecharts.charts import Bar
from .models import Exam


def total_marks_distribution(request):
    exams = Exam.objects.all()
    total_marks = [exam.total_marks for exam in exams]
    bins = list(range(min(total_marks), max(total_marks) + 10, 10))  # 根据数据范围生成直方图的区间
    marks_counts = [total_marks.count(mark) for mark in bins]

    bar = (
        Bar()
        .add_xaxis([str(bin) for bin in bins])
        .add_yaxis("Total Marks", marks_counts)
        .set_global_opts(title_opts=opts.TitleOpts(title="Total Marks Distribution"))
    )
    bar.render("showbar.html")
    return HttpResponse(bar.render_embed())

from django.shortcuts import render
from pyecharts import options as opts
from pyecharts.charts import Pie
from pyecharts.globals import ThemeType
from .models import UserScore
from django.shortcuts import render,HttpResponse
def pie_chart(request):
    # 获取所有 UserScore 实例的得分
    for i in UserScore.objects.all():
        print (i)
    scores = [user_score.score for user_score in UserScore.objects.all()]
    print (scores)
    # 计算不同得分的频率
    score_counts = {}
    for score in scores:
        score_counts[score] = score_counts.get(score, 0) + 1

    # 使用 Pyecharts 绘制饼图
    pie = (
        Pie(init_opts=opts.InitOpts(theme=ThemeType.LIGHT))
        .add("", list(score_counts.items()))
        .set_global_opts(title_opts=opts.TitleOpts(title="User Scores Distribution"))
    )

    pie.render("showpie.html")
    return HttpResponse(pie.render_embed())
def showpie(request):
    return render(request, 'pie.html')

def showbar(request):
    return render(request, 'bar.html')


from django.shortcuts import render
from pyecharts import options as opts
from pyecharts.charts import Bar
from .models import Question

def correct_choices_ratio(request):
    questions = Question.objects.all()
    question_texts = [question.question_text for question in questions]
    correct_choices = [question.choices.filter(is_correct=True).count() for question in questions]

    bar = (
        Bar()
        .add_xaxis(question_texts)
        .add_yaxis("Correct Choices", correct_choices)
        .set_global_opts(title_opts=opts.TitleOpts(title="Correct Choices Ratio for Questions"))
    )
    bar.render("showbar1.html")
    return HttpResponse(bar.render_embed())
def showbar1(request):
    return render(request, 'bar1.html')

import pyecharts.options as opts
from pyecharts.charts import WordCloud
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from .models import IncorrectAnswer

import pyecharts.options as opts
from pyecharts.charts import WordCloud
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from .models import IncorrectAnswer
import jieba
from collections import Counter
@login_required
def incorrect_questions_wordcloud(request):
    # 获取所有错误答案
    incorrect_answers = IncorrectAnswer.objects.all()

    # 统计每个题目被错误回答的次数
    question_texts = []
    for incorrect_answer in incorrect_answers:
        question_text = incorrect_answer.question.question_text
        question_texts.append(question_text)

    # 使用jieba进行分词
    words = []
    for text in question_texts:
        words.extend(jieba.cut(text))

    # 统计词频
    word_counter = Counter(words)

    # 准备词云数据
    wordcloud_data = [(word, count) for word, count in word_counter.items()]

    # 生成词云图
    wordcloud = (
        WordCloud()
        .add("", wordcloud_data, word_size_range=[20, 100])
        .set_global_opts(title_opts=opts.TitleOpts(title="错误题目词云"))
    )

    # 渲染词云图为 HTML
    wordcloud_html = wordcloud.render_embed()

    # 渲染到模板中
    return render(request, 'incorrect_questions_wordcloud.html', {'wordcloud_html': wordcloud_html})
