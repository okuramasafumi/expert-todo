module Tasks
  class BulksController < ApplicationController
    def update
      @closed_tasks = current_user.tasks.find(params[:task_ids])
      @open_tasks = current_user.tasks - @closed_tasks
      @closed_tasks.each(&:close)
      @open_tasks.each(&:reopen)
      redirect_to tasks_url, notice: 'Tasks have been updated'
    rescue ActiveRecord::RecordNotFound
      current_user.tasks.each(&:reopen)
      redirect_to tasks_url
    end
  end
end
