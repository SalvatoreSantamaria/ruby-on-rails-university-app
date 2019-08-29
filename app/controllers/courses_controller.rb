class CoursesController < ApplicationController #courses controller inheriting from app controller
    
    skip_before_action :require_user
    
    def index #directs to app/views/courses/index.html.erb
        @courses = Course.all #this make this available to all of the views
    end
    def new
    end
end