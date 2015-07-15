module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      admin = FactoryGirl.create(:member)
      admin.admin = true
      admin.save
      sign_in admin
    end
  end

  def login_member
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:member]
      member = FactoryGirl.create(:member)
      sign_in member
    end
  end
end