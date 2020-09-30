class ContactMailer < ApplicationMailer
  def contact_mail(post)
    @post = post
    @user = User.find(post.user.id)
    mail to: @user.email, subject: "post contact email" if @feed.present?
  end
end
