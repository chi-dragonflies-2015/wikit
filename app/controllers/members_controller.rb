class MembersController < ApplicationController

  def index
    @members = Member.paginate(page: params[:page], :per_page => 10)
  end

  def show
    @member = Member.find_by(id: params[:id])
  end
end