# Generated by Django 3.2.5 on 2024-07-05 01:36

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0003_useranswer_user'),
    ]

    operations = [
        migrations.AddField(
            model_name='question',
            name='question_type',
            field=models.CharField(choices=[('MC', 'Multiple Choice'), ('FB', 'Fill in the Blank')], default='MC', max_length=2, verbose_name='题目类型'),
        ),
        migrations.AddField(
            model_name='useranswer',
            name='fill_in_blank_answer',
            field=models.CharField(blank=True, max_length=200, null=True, verbose_name='填空题答案'),
        ),
        migrations.AlterField(
            model_name='useranswer',
            name='choice',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='answers', to='exam.choice', verbose_name='选择'),
        ),
    ]
