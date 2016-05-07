class Notification < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.completed.subject
  #
  def completed(task)
  	@task = task
    mail to: "#{@task.project.client.email}", subject: "#{@task.name} completed"
  end
end
