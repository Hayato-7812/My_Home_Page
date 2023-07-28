RSpec.describe "Sessions", type: :request do
  describe "DELETE /logout" do
    before(:each) do
      admin = Admin.create(name: "test_admin", password: "password")
      admin_sign_in_as(admin)
    end

    example "ログアウトできる" do
      delete logout_path
      expect(get(root_path)).to redirect_to(login_path)
    end
  end
end
