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
