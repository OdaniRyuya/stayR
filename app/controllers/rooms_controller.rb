class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.create!(room_params)
    if @room.save
      redirect_to :rooms_post
    else
      render "new", status: :unprocessable_entity
    end
  end

  def show
    $room = Room.find(params[:id])
    $reservation = Reservation.new
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def post
    @users = User.all
    @rooms = Room.where(user_id: current_user.id) 
  end

  private
  def room_params
    params.require(:room).permit(:title, :address, :price, :comment, :image).merge(user_id: current_user.id)
  end

end
