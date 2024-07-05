# Generated by Django 3.2.18 on 2024-03-05 02:49

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Exam',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=100, verbose_name='试卷标题')),
                ('total_marks', models.IntegerField(default=0, verbose_name='总分')),
            ],
        ),
        migrations.CreateModel(
            name='Question',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('question_text', models.CharField(max_length=200, verbose_name='题目内容')),
                ('marks', models.IntegerField(default=1, verbose_name='分值')),
                ('exam', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='questions', to='exam.exam', verbose_name='试卷')),
            ],
        ),
        migrations.CreateModel(
            name='Choice',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('choice_text', models.CharField(max_length=100, verbose_name='选项内容')),
                ('is_correct', models.BooleanField(default=False, verbose_name='是否正确答案')),
                ('question', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='choices', to='exam.question', verbose_name='题目')),
            ],
        ),
    ]
