class Admin::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  
  # layout 'admin' #if you want to use differenet layout for admin
  
  protected
  
  def check_admin
    redirect_to root_path, alert: "You don't have rights to view this page" unless current_user.admin?
  end
end