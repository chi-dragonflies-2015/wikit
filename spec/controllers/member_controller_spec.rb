require 'rails_helper'

describe MembersController do
  let!(:member) { create(:member)}
  describe "GET #index" do
    it "assigns all members as @members" do
      get :index
      expect(assigns(:members)).to eq(Member.all)
    end
  end
end