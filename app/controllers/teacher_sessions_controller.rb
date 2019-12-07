class TeacherSessionsController < ApplicationController
  skip_before_action(:force_teacher_sign_in, { :only => [:new_session_form, :add_cookie] })

  skip_before_action(:force_student_sign_in)
  
  def new_session_form
    render({ :template => "teacher_sessions/sign_in.html.erb" })
  end

  def add_cookie
    teacher = Teacher.where({ :email => params.fetch("email_from_query") }).at(0)
    
    the_supplied_password = params.fetch("password_from_query")
    
    if teacher != nil
      are_they_legit = teacher.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/teacher_sign_in", { :alert => "Password incorrect." })
      else
        session.store(:teacher_id, teacher.id)
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/teacher_sign_in", { :alert => "There's no teacher account with that email address." })
    end
  end

  def remove_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end
 
end
