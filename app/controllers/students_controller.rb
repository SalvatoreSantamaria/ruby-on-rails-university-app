class StudentsController < ApplicationController
    def index
        @students = Student.all
    end

    def show
        @student = Student.find(params[:id])
    end

    def new
        @student = Student.new
    end

    def create 
        @student = Student.new(student_params)
        if @student.save
            flash[:sucess] = "You have successfully signed up" #display a message
            redirect_to root_path
        else 
            render 'new' #in event it doesn't work, then re-render page 
        #for whitelist, have to whitelist for created object
        end
    end

    def student_params
        params.require(:student).permit(:name, :email) #this will whitelist what we receive for the web form, name and email
    end

end