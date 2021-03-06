class ApplicationController < ActionController::Base

  def user_for_paper_trail
    member_signed_in? ? "<a href='#{member_path(current_member)}'>#{current_member.email}</a>" : 'Guest'
  end

  protect_from_forgery with: :exception

  private

    def admin_member
      redirect back unless current_member.admin?
    end
end
