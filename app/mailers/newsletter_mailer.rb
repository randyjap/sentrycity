class NewsletterMailer < ApplicationMailer
  def weekly_letter(user)
    @user = user
    mail(to: @user.email, subject: 'Weekly Email')
  end
end
