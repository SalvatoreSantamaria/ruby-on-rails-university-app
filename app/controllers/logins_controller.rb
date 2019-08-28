class LoginsController < ApplicationController

    def new
    end

    def create
        student = Student.find_by(email: params[:logins][:email].downcase) #grab the student
        if student && student.authenticate(params[:logins][:password]) #ifstudent exists
            session[:student_id] = student.id   #set session variable
            flash[:notice] = "You have successfully loggen in"
            redirect_to student
        else  
            flash.now[:notice] = "Something was wrong with you login information" #.now will show just on page and then leave, will not store for redirect
            render 'new'
        end
    end

    def destroy
        session[:student_id] = nil
        flash[:notice] = "You have successfully logged out"
        redirect_to root_path
    end

end
