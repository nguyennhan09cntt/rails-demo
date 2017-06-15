class ResourceController < ApplicationController
  def index
   
    unless (params[:m].nil? || params[:m] == 0 )
      @resource = UserResource.where('fk_user_module = :user_module', {:user_module => params[:m]}).paginate(:page => params[:page], :per_page => 10)
      
    else       
      @resource = UserResource.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update



  end

  def destroy

  end

end
