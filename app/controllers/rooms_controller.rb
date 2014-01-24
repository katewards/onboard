class RoomsController < ApplicationController
  
  # before quite a few of the actions below make sure we are logged in

  before_action :make_sure_logged_in, except: [:index, :show]


  def index

  	@rooms = Room.near("London")

  end

  def show

  	@room = Room.find(params[:id])

  end

  def new

  	@room = current_user.rooms.new

  end

  def create

  	@room = current_user.rooms.new(rooms_params) 

  	if @room.save
  		flash[:success]= "You've added your room"
  		redirect_to root_path(@room)

  	else
  		render "new"

  	end

  end

  def edit

  	@room = current_user.rooms.find(params[:id])

  end

  def update

  	@room = current_user.rooms.find(params[:id])

  	if @room.update(rooms_params)
  		flash[:success] = "Your room has been updated"
  		redirect_to root_path(@room)

  	else
  		render "edit"

  	end

  end


  def destroy

  	@room = Room.find(params[:id])

  	@room.destroy

  		flash[:success] = "Your room has been deleted"
  		redirect_to root_path

  	end


  # shortcut for whitelisting form data, so users can only edit certain things
  
  private

  def rooms_params

  	params.require(:room).permit(:title, :address, :description, :max_guests, :bedrooms, :price, :image)
  
  end

end 

