class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = session[:user_id]
    if @event.save
      redirect_to root_path, flash: {notice: 'Successfully added event!'}
    else
      render 'new'
    end
  end

  def show
    @event = @current_user.events.find(params[:id])
  end

  def edit
    @event = @current_user.events.find(params[:id])
  end

  def update
    @event = @current_user.events.find(params[:event][:id])
    if @event.update_attributes(event_params)
      redirect_to event_path(@event), flash: {notice: 'Successfully edited event!'}
    else
      render 'edit'
    end
  end

  def destroy
    @event = @current_user.events.find(params[:id])
    if @event.destroy
      flash[:notice] = 'Successfully deleted event!'
    else
      flash[:alert] = "Unable to delete event: #{@event.errors.full_messages.join(', ')}"
    end
    redirect_to root_path
  end

private

  def event_params
    if params[:event][:starts_at].blank? && params[:event][:ends_at].blank?
      params.require(:event).permit(:title, :description, :category, :day)
    elsif params[:event][:ends_at].blank?
      params.require(:event).permit(:title, :description, :starts_at, :category, :day)
    elsif params[:event][:starts_at].blank?
      params.require(:event).permit(:title, :description, :ends_at, :category, :day)
    else
      params.require(:event).permit(:title, :description, :starts_at, :ends_at, :category, :day)
    end
  end
end
