Rails.application.routes.draw do


  match("/", { :controller => "lessons", :action => "index", :via => "get"})
  # Routes for the Lesson resource:

  # CREATE
  match("/insert_lesson", { :controller => "lessons", :action => "create", :via => "post"})
          
  # READ
  match("/lessons", { :controller => "lessons", :action => "index", :via => "get"})
  
  match("/lessons/:id_from_path", { :controller => "lessons", :action => "show", :via => "get"})
  
  # UPDATE
  
  match("/modify_lesson/:id_from_path", { :controller => "lessons", :action => "update", :via => "post"})
  
  # DELETE
  match("/delete_lesson/:id_from_path", { :controller => "lessons", :action => "destroy", :via => "get"})

  #------------------------------
  # Routes for reading all students
  match("/students", { :controller => "students", :action => "index", :via => "get"})
  # Routes for signing up

  match("/student_sign_up", { :controller => "students", :action => "new_registration_form", :via => "get"})
  
  # Routes for signing in
  match("/student_sign_in", { :controller => "student_sessions", :action => "new_session_form", :via => "get"})
  
  match("/student_verify_credentials", { :controller => "student_sessions", :action => "add_cookie", :via => "post"})
  
  # Route for signing out
  
  match("/student_sign_out", { :controller => "student_sessions", :action => "remove_cookies", :via => "get"})
  
  # Route for creating account into database 

  match("/post_student", { :controller => "students", :action => "create", :via => "post" })
  
  # Route for editing account
  
  match("/edit_student", { :controller => "students", :action => "edit_registration_form", :via => "get"})
  
  match("/patch_student", { :controller => "students", :action => "update", :via => "post"})
  
  # Route for removing an account
  
  match("/cancel_student_account", { :controller => "students", :action => "destroy", :via => "get"})


  #------------------------------

  # Routes for reading all teachers
  match("/teachers", { :controller => "teachers", :action => "index", :via => "get"})

  # Routes for signing up

  match("/teacher_sign_up", { :controller => "teachers", :action => "new_registration_form", :via => "get"})
  
  # Routes for signing in
  match("/teacher_sign_in", { :controller => "teacher_sessions", :action => "new_session_form", :via => "get"})
  
  match("/teacher_verify_credentials", { :controller => "teacher_sessions", :action => "add_cookie", :via => "post"})
  
  # Route for signing out
  
  match("/teacher_sign_out", { :controller => "teacher_sessions", :action => "remove_cookies", :via => "get"})
  
  # Route for creating account into database 

  match("/post_teacher", { :controller => "teachers", :action => "create", :via => "post" })
  
  # Route for editing account
  
  match("/edit_teacher", { :controller => "teachers", :action => "edit_registration_form", :via => "get"})
  
  match("/patch_teacher", { :controller => "teachers", :action => "update", :via => "post"})
  
  # Route for removing an account
  
  match("/cancel_teacher_account", { :controller => "teachers", :action => "destroy", :via => "get"})


  #------------------------------

  # ======= Add Your Routes Above These =============
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
end
