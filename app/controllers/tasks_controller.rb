class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task, only: [:show, :edit, :update, :destroy], except: [:change_status]

  def index
    @tasks = []
    List.where("isPublic = ? OR user_id = ?", true, current_user.id).each do |l|
      l.tasks.each do |t|
        @tasks << t
      end
    end
    #@tasks = lists.map(&:tasks)#Task.all
  end

  def show
  end

  def new
    @task = Task.new
    if !params[:list_id].nil?
      @task.list_id = params[:list_id]
    end
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.author = current_user
    @task.status = true
    
    if @task.save
      redirect_to @task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if @task.update(task_params)
      redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def change_status
    @task = Task.find(params[:task_id])
    @task.status = @task.status ? false : true

    if @task.save
      redirect_to "/tasks"
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :list_id)
  end
end