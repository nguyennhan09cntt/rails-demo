class ModuleController < ApplicationController
  def index
    print params[:c]
    unless (params[:c].nil? || params[:c] == 0 )
      @module = UserModule.where('fk_user_component = :user_component', {:user_component => params[:c]}).paginate(:page => params[:page], :per_page => 10)
      
    else       
      @module = UserModule.paginate(:page => params[:page], :per_page => 10)
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
