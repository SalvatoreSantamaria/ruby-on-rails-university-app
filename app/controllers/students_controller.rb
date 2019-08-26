class StudentsController < ApplicationController
    #before_action will be applied to whatever method we specify
    #below, set_student is running from below
    before_action :set_student, only: [:show, :edit, :update]

    def index
        @students = Student.all
    end

    def show
        
    end

    def new
        @student = Student.new
    end

    def create 
        
        if @student.save
            flash[:sucess] = "You have successfully signed up" #display a message
            redirect_to root_path
        else 
            render 'new' #in event it doesn't work, then re-render page 
        #for whitelist, have to whitelist for created object
        end
    end

    def edit
        
    end

    def update
        @student = Student.find(params[:id])
        # using student params to white list
        if @student.update(student_params)
            flash[:sucess] = "You have successfully update your profile"
            redirect_to student_path(@student) #this could also be redirect_to @student
        else
            render 'edit'
        end
    end

    #private just means available to the this controller only
    private 

    def set_student
        @student = Student.find(params[:id])
    end

    def student_params
        params.require(:student).permit(:name, :email) #this will whitelist what we receive for the web form, name and email
    end

end