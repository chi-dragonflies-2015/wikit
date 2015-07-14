class ApplicationController < ActionController::Base

  class ApplicationController
    def user_for_paper_trail
      logged_in? ? current_member.id : 'Guest'
    end
  end


  protect_from_forgery with: :exception
end
