module SessionsHelper
  # 渡されたユーザーでログインする
  def log_in(user)
    session[:user_id] = user.id
  end

  # 現在ログイン中のユーザーを返す (いる場合)
  def current_admin
    if session[:user_id]
      # @current_admin = @current_admin || User.find_by(id: session[:user_id])と同じ意味
      @current_admin ||= Admin.find_by(id: session[:user_id])
    end
  end

  # 受け取ったユーザーがログイン中のユーザーと一致すればtrueを返す
  def current_admin?(user)
    user == current_admin
  end

  # ユーザーがログインしていればtrue、その他ならfalseを返す
  def logged_in?
    !current_admin.nil?
  end

  # 現在のユーザーをログアウトする
  def log_out
    session.delete(:user_id)
    @current_admin = nil
  end
end
