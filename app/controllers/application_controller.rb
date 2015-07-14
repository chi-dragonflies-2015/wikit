class ApplicationController < ActionController::Base
    def user_for_paper_trail
      puts "$$$$$$$$$$$$$$$$"
      puts current_member.id
      puts "$$$$$$$$$$$$$$$$"
      member_signed_in? ? current_member.id : 'Guest'
    end

  protect_from_forgery with: :exception
end
