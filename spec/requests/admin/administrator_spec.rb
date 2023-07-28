require 'rails_helper'
# require 'admin'

RSpec.describe "Administrators", type: :request do
  before(:each) do
    @admin = Admin.create(name: "test_admin", password: "password")
  end
  describe "POST /admin/login" do
    example "ログイン成功でadmin/administratorへリダイレクトする" do
      params = { session: { name: "test_admin", password: "password" } }
      expect(post(login_path, params: params)).to redirect_to(root_path)
    end
  end
  describe "DELETE /admin/logout" do
    example "ログイン後の上部ヘッダーのリンクからログアウトできる" do
      admin_sign_in_as(@admin)
      expect(delete(logout_path)).to redirect_to(login_path)
    end
  end
end
