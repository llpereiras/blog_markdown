module ControllerSpecHelpers

  def login
    user = FactoryGirl.create(:user)
    sign_in user, scope: :user
    # sign_in :user, user
  end

end