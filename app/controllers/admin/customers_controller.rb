class Admin::CustomersController < ApplicationController
  
  before_action :authenticate_admin!
  
  def after_sign_in_path_for(resource)
    admin_path
  end
  
  def index
  
  end
 
  def show
  
  end
  
  def edit
  
  end
  
end
