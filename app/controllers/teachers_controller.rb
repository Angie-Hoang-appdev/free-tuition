class TeachersController < ApplicationController
  skip_before_action(:force_teacher_sign_in, { :only => [:new_registration_form, :create] })

  skip_before_action(:force_student_sign_in)

  def index
    #@teachers = Teacher.all.order({ :average_rating => :desc })

    @teachers = Teacher.all
    @teachers.each do |teacher|
        teacher.rating = teacher.average_rating
        teacher.save
    end 
    @teachers = Teacher.all.order({ :rating => :desc })
    render({ :template => "teachers/all_teachers.html.erb"})
  end

  def show
    teacher_id = params.fetch("the_teacher_id")
    @teacher = Teacher.where({:id => teacher_id }).first
    @lessons_of_teacher = Lesson.where({:teacher_id => teacher_id })
    render({:template => "teachers/teacher_details.html.erb"})
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
    schedule_from_query = params.fetch("schedule_from_query1","") +" "+ params.fetch("schedule_from_query2","") +" "+ params.fetch("schedule_from_query3","") +" "+ params.fetch("schedule_from_query4","") +" "+ params.fetch("schedule_from_query5","")
    @teacher.schedule = schedule_from_query
    #@teacher.schedule = params.fetch("schedule_from_query")
    @teacher.expertise = params.fetch("expertise_from_query")
    @teacher.image = params.fetch("image_from_query",nil)
    @teacher.bio = params.fetch("bio_from_query",nil)

    save_status = @teacher.save

    if save_status == true
      session.store(:teacher_id,  @teacher.id)
   
      redirect_to("/teachers/#{@teacher.id}", { :notice => "Teacher account created successfully."})
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
    schedule_from_query = params.fetch("schedule_from_query1","") +" "+ params.fetch("schedule_from_query2","") +" "+ params.fetch("schedule_from_query3","") +" "+ params.fetch("schedule_from_query4","") +" "+ params.fetch("schedule_from_query5","")
    @teacher.schedule = schedule_from_query
    #@teacher.schedule = params.fetch("schedule_from_query")
    @teacher.expertise = params.fetch("expertise_from_query")
    @teacher.image = params.fetch("image_from_query",nil)
    @teacher.bio = params.fetch("bio_from_query",nil)
    
    if @teacher.valid?
      @teacher.save

      redirect_to("/teachers/#{@teacher.id}", { :notice => "Teacher account updated successfully."})
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
