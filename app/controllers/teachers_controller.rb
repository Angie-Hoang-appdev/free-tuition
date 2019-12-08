class TeachersController < ApplicationController
  skip_before_action(:force_teacher_sign_in, { :only => [:new_registration_form, :create] })

  skip_before_action(:force_student_sign_in)

  def index
    @teachers = Teacher.all
    render({ :template => "teachers/all_teachers.html.erb"})
  end
  def new_registration_form
    render({ :template => "teacher_sessions/sign_up.html.erb" })
  end

  def create
    @teacher = Teacher.new
    @teacher.email = params.fetch("email_from_query")
    @teacher.password = params.fetch("password_from_query")
    @teacher.password_confirmation = params.fetch("password_confirmation_from_query")
    @teacher.name = params.fetch("name_from_query")
    @teacher.schedule = params.fetch("schedule_from_query")
    @teacher.expertise = params.fetch("expertise_from_query")

    save_status = @teacher.save

    if save_status == true
      session.store(:teacher_id,  @teacher.id)
   
      redirect_to("/", { :notice => "Teacher account created successfully."})
    else
      redirect_to("/teacher_sign_up", { :alert => "Teacher account failed to create successfully."})
    end
  end
    
  def edit_registration_form
    render({ :template => "teachers/edit_profile.html.erb" })
  end

  def update
    @teacher = @current_teacher
    @teacher.email = params.fetch("email_from_query")
    @teacher.password = params.fetch("password_from_query")
    @teacher.password_confirmation = params.fetch("password_confirmation_from_query")
    @teacher.name = params.fetch("name_from_query")
    @teacher.schedule = params.fetch("schedule_from_query")
    @teacher.expertise = params.fetch("expertise_from_query")
    
    if @teacher.valid?
      @teacher.save

      redirect_to("/", { :notice => "Teacher account updated successfully."})
    else
      render({ :template => "teachers/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_teacher.destroy
    reset_session
    
    redirect_to("/", { :notice => "Teacher account cancelled" })
  end
  
end
