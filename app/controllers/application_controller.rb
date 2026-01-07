def authenticate_admin!

  unless session[:admin_id] == true
    redirect_to login_path, alert: "Acesso Negado."
  end
end