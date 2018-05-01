class TasksController < ApplicationController
  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = session[:user_id]
    if @task.save
      redirect_to root_path, flash: {notice: 'Successfully added task!'}
    else
      render 'new'
    end
  end

  def destroy
    @task = @current_user.tasks.find(params[:id])
    if @task.destroy
      flash[:notice] = 'Successfully deleted task!'
    else
      flash[:alert] = "Unable to delete task: #{@task.errors.full_messages.join(', ')}"
    end
    redirect_to root_path
  end

private

  def task_params
    params.require(:task).permit(:title, :description, :due_at)
  end
end
