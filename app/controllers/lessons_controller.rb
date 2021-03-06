class LessonsController < ApplicationController
  def index
    @lessons = Lesson.all.order({ :created_at => :desc })
    @students = Student.all
    @teachers = Teacher.all
    render({ :template => "lessons/index.html.erb" })
  end

  def show
    the_id = params.fetch("id_from_path")
    @lesson = Lesson.where({:id => the_id }).at(0)

    render({ :template => "lessons/show.html.erb" })
  end

  def create
    @lesson = Lesson.new
    
    if session[:teacher_id] !=nil 
      @lesson.teacher_id = session[:teacher_id]
      else
      @lesson.teacher_id = params.fetch("teacher_id_from_query")
    end 

    if session[:student_id] != nil
      @lesson.student_id = session[:student_id]
      else
      @lesson.student_id = params.fetch("student_id_from_query")
    end

    @lesson.feedback = params.fetch("feedback_from_query")
    @lesson.rating = params.fetch("rating_from_query")

    if @lesson.valid?
      @lesson.save
      redirect_to("/lessons", { :notice => "Lesson created successfully." })
    else
      redirect_to("/lessons", { :notice => "Lesson failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("id_from_path")
    @lesson = Lesson.where({ :id => the_id }).at(0)

    @lesson.teacher_id = params.fetch("teacher_id_from_query")
    @lesson.student_id = params.fetch("student_id_from_query")
    @lesson.feedback = params.fetch("feedback_from_query")

    if @lesson.valid?
      @lesson.save
      redirect_to("/lessons/#{@lesson.id}", { :notice => "Lesson updated successfully."} )
    else
      redirect_to("/lessons/#{@lesson.id}", { :alert => "Lesson failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("id_from_path")
    @lesson = Lesson.where({ :id => the_id }).at(0)

    @lesson.destroy

    redirect_to("/lessons", { :notice => "Lesson deleted successfully."} )
  end
end
