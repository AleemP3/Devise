class HobbiesController < ApplicationController
  before_action :set_hobby, only: [:show, :edit, :update, :destroy]


  def index
    @hobbies = current_user.hobbies 
  end

  def show

  end

  def new
    @hobby = current_user.hobbies.new 
  end

  def create
    @hobby = current_user.hobbies.new(hobby_params)
    if @hobby.save 
      flash[:success] = "Hobby Created"
      redirect_to hobbies_path  
    else 
      flash[:error] = "Error #{@hobby.errors.full_messages.join("\n")}"
      render :new 
    end 

    
  end 

  def edit

  end

  def update 
    if @hobby.update(hobby_params)
      redirect_to @hobby 
    else 
      render :edit
    end 
  end 

  def destroy
    @hobby.destroy 
    redirect_to hobbies_path 
  end 

  private 

  def hobby_params  
    params.require(:hobby).permit(:name, :body)
  end 
  
  def set_hobby
    @hobby = current_user.hobbies.find(params[:id])
  end 
end
