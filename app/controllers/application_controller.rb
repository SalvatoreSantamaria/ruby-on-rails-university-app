class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    helper_method :current_user, :logged_in?
    def current_user #in a method so we can always refer to a current user 
        @current_user ||= Student.find(session[:student_id]) if session[:student_id] # ifthis is set, then it finds student from session hash ifsession :student_id and assign it to @current_user. now there is a logged in user 
        #|| arefor memoization. the student query will only be performed ifthe @current_user does not exist
    end

    def logged_in?
        !!current_user #!! will return true or false, so returning current_user is true or false
    end

end
