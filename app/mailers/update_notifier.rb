class UpdateNotifier < ActionMailer::Base
  default from: "from@example.com"
  def send_update(updates)
    @updates=updates
    mail(to:"all_in_team@gmail.com",subject:updates.title)
  end
  def send_comment_update(comment)
    @story=comment
    mail(to:"all_in_team@gmail.com",subject:"New comment in ur story")
  end
end
