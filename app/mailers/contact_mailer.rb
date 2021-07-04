class ContactMailer < ApplicationMailer
  def contact_mail(picture)
    @picture = picture
    mail to: "pikoniconico26@gmail.com", subject: "投稿確認メール"
  end
end
