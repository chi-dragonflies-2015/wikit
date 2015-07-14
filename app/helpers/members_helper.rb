module SessionsHelper
  def current_member?(member)
    member == current_member
  end
end