class MembersController < ApplicationController
  before_action :authenticate_member!, :except => [:show, :index]
  before_action :admin_member,     only: :destroy
  def index
    #@members = Member.paginate(page: params[:page], :per_page => 10)
    @members = Member.all
  end

  def show
    @member = Member.find_by(id: params[:id])
  end

  def destroy
    Member.find_by(id: params[:id]).destroy
    redirect_to members_url, notice: 'Member was successfully destroyed.'
  end

private

    def correct_member
      @member = Member.find(params[:id])
      redirect back unless current_member?(@member)
    end

    def admin_member
      redirect back unless current_member.admin?
    end
end