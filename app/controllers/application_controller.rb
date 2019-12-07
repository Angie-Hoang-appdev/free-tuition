class ApplicationController < ActionController::Base
  before_action(:load_current_student)
  before_action(:force_student_sign_in)
  
  def load_current_student
    the_id = session.fetch(:student_id)
    @current_student = Student.where({ :id => the_id }).at(0)
  end
  
  def force_student_sign_in
    if @current_student == nil
      redirect_to("/student_sign_in", { :notice => "You have to sign in first." })
    end
  end

  before_action(:load_current_teacher)
  before_action(:force_teacher_sign_in)
  
  def load_current_teacher
    the_id = session.fetch(:teacher_id)
    @current_teacher = Teacher.where({ :id => the_id }).at(0)
  end
  
  def force_teacher_sign_in
    if @current_teacher == nil
      redirect_to("/teacher_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
