class ReservationsController < ApplicationController

  def index
    @room = Room.all
    @reservations = Reservation.all
  end

  
  def new
    @end = $reservation.end_day.to_i
    @start = $reservation.start_day.to_i
    @result_day =  @end - @start
    @result_day = @result_day / 86400 
  end


  def create
    $reservation = Reservation.create!(reservation_params)
    if $reservation.start_day.present? && $reservation.end_day.present? && $reservation.people.present? 
    redirect_to :new_reservation
    elsif $reservation.start_day.nil? || $reservation.end_day.nil? 
      flash[:notice] = "※開始日と終了日を入力してください"
      render "rooms/show", status: :unprocessable_entity
    elsif $reservation.end_day < Date.today || $reservation.start_day < Date.today
      flash[:notice] = "※今日より過去の日付は指定できません"
      render "rooms/show", status: :unprocessable_entity
    elsif $reservation.end_day == $reservation.start_day
      flash[:notice] = "※同じ日付は指定できません"
      render "rooms/show", status: :unprocessable_entity
    elsif $reservation.end_day < $reservation.start_day
      flash[:notice] = "※開始日より後の日付を入力してください"
      render "rooms/show", status: :unprocessable_entity
    elsif $reservation.people == nil
      flash[:notice] = "※人数を入力してください"
      render "rooms/show", status: :unprocessable_entity
    end
  end
  
  def completed
    if $reservation.save
    else 
    redirect_to :rooms_post
    end
  end
  
  private
  def reservation_params
    params.require(:reservation).permit(:start_day, :end_day, :people, :room_id)
  end

end
