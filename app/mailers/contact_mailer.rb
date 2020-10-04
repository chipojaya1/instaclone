class ContactMailer < ApplicationMailer
  def contact_mail(post)
    @post = post

    mail to: "#{@post.user.email}", subject: "Post's confirmation email" if @post.present?
  end
end
