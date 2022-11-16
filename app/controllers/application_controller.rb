class ApplicationController < ActionController::Base
  #devise利用の機能が使われる前にconfigure_permitted_parametersメソッドが実行される
  before_action:configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    post_images_path#サインイン後にaboutアクション実行
  end

  def after_sign_out_path_for(resource)
    about_path#サインイン後にaboutアクション実行
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,keys: [:name])
    #nameのデータ操作を許可している
  end
end
