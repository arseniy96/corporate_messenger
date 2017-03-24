class TasksController < ApplicationController

  def index
    @room = Room.find(params[:room_id])
    render_403 unless @room.users.include?(current_user)
    @tasks = @room.tasks
    @friends = current_user.users
  end

  def create
    @room = Room.find(params[:room_id])
    @task = @room.tasks.new(task_params)
    @task.creator_id = current_user.id
    if @task.save
      redirect_to room_tasks_path
    else
      render action: 'index'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to room_tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :date, :complete)
  end

end
