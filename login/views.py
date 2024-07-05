from django.shortcuts import render
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
import random

def home(request):
    return render(request, 'user_dashboard.html')

from django.shortcuts import redirect

from django.shortcuts import render, redirect
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def register(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        confirm_password = request.POST.get('confirm_password')
        print (password)
        print (confirm_password)
        if password != confirm_password:
            return render(request, 'register.html', {'error_message': 'Passwords do not match'})


        user = User.objects.create_user(username=username, password=password)
        user.save()

        return redirect('login')
    return render(request, 'register.html')



@csrf_exempt
def login_user(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('home')
        else:
            return HttpResponse('Invalid login credentials')
    return render(request, 'login.html')

from django.contrib.auth import logout
from django.shortcuts import redirect

def logout_user(request):
    logout(request)
    return redirect('login')


# views.py

from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import PasswordChangeForm
from django.contrib.auth import update_session_auth_hash
from django.contrib import messages

@login_required
def profile(request):
    user = request.user
    print (user.email)
    context = {'user': user}
    return render(request, 'profile.html', context)

# views.py

from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User

@login_required
def update_profile(request):
    if request.method == 'POST':
        new_password = request.POST.get('password')
        confirm_password = request.POST.get('confirm_password')
        if new_password == confirm_password:
            user = request.user
            user.set_password(new_password)
            user.save()
            # 更新密码成功，可以做一些重定向或显示成功消息等
            return redirect('login')
        else:
            # 密码不匹配，可以返回错误消息到模板中显示给用户
            error_message = "Passwords do not match."
            return render(request, 'update_profile.html', {'error_message': error_message})
    else:
        # 如果不是POST请求，可能是GET请求，显示更新密码表单
        return render(request, 'update_profile.html')

