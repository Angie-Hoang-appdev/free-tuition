class StudentsController < ApplicationController
  skip_before_action(:force_student_sign_in, { :only => [:new_registration_form, :create] })
  skip_before_action(:force_teacher_sign_in)

  def index
    @students = Student.all
    render({ :template => "students/all_students.html.erb"})
  end

  def new_registration_form
    render({ :template => "student_sessions/sign_up.html.erb" })
  end

  def create
    @student = Student.new
    @student.email = params.fetch("email_from_query")
    @student.password = params.fetch("password_from_query")
    @student.password_confirmation = params.fetch("password_confirmation_from_query")
    @student.name = params.fetch("name_from_query")
    @student.grade = params.fetch("grade_from_query")

    save_status = @student.save

    if save_status == true
      session.store(:student_id,  @student.id)
   
      redirect_to("/", { :notice => "Student account created successfully."})
    else
      redirect_to("/student_sign_up", { :alert => "Student account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "students/edit_profile.html.erb" })
  end

  def update
    @student = @current_student
    @student.email = params.fetch("email_from_query")
    @student.password = params.fetch("password_from_query")
    @student.password_confirmation = params.fetch("password_confirmation_from_query")
    @student.name = params.fetch("name_from_query")
    @student.grade = params.fetch("grade_from_query")
    
    if @student.valid?
      @student.save

      redirect_to("/", { :notice => "Student account updated successfully."})
    else
      render({ :template => "students/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_student.destroy
    reset_session
    
    redirect_to("/", { :notice => "Student account cancelled" })
  end
  
end
