module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(admin)
    session[:admin_id] = admin.id
  end

  # 現在ログイン中のユーザーを返す (いる場合)
  def current_admin
    if session[:admin_id]
      # @current_admin = @current_admin || admin.find_by(id: session[:admin_id])と同じ意味
      @current_admin ||= Admin.find_by(id: session[:admin_id])
    end
  end

  # 受け取ったユーザーがログイン中のユーザーと一致すればtrueを返す
  def current_admin?(admin)
    admin == current_admin
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_admin.nil?
  end

  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:admin_id)
    @current_admin = nil
  end
end
