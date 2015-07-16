class MembersController < ApplicationController
  before_action :authenticate_member!, :except => [:show, :index]
  before_action :admin_member,     only: [:destroy, :promote]
  def index
    #@members = Member.paginate(page: params[:page], :per_page => 10)
    @members = Member.all
  end

  def show
    @member = Member.find_by(id: params[:id])
  end

  def promote
    @member = Member.find_by(id: params[:id])
    @member.admin = true
    @member.save
    redirect_to @member, notice: 'Member was promoted!'
  end

  def destroy
    Member.find_by(id: params[:id]).destroy
    redirect_to members_url, notice: 'Member was successfully destroyed.'
  end


end