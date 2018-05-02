class ActivitiesController < ApplicationController
  def new
    @activity = Activity.new
  end

  def create
    @activity = Activity.new(activity_params)
    @activity.user_id = session[:user_id]
    if @activity.save
      redirect_to root_path, flash: {notice: 'Successfully added activity!'}
    else
      render 'new'
    end
  end

  def edit
    @activity = @current_user.activities.find(params[:id])
  end

  def update
    @activity = @current_user.activities.find(params[:activity][:id])
    if @activity.update_attributes(activity_params)
      redirect_to activity_path(@activity), flash: {notice: 'Successfully edited activity!'}
    else
      render 'edit'
    end
  end

  def show
    @activity = @current_user.activities.find(params[:id])
  end

  def destroy
    @activity = @current_user.activities.find(params[:id])
    if @activity.destroy
      flash[:notice] = 'Successfully deleted activity!'
    else
      flash[:alert] = "Unable to delete activity: #{@activity.errors.full_messages.join(', ')}"
    end
    redirect_to root_path
  end

private

  def activity_params
    params.require(:activity).permit(:title, :description)
  end
end
