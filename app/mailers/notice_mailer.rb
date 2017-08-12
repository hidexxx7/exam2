class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_picture.subject
  #
  # 引数としてpictureを追加します。
  def sendmail_picture(picture)
    @picture = picture

    mail to: "ray.x@live.jp",subject: '【Exam2】写真が投稿されました'
  end
  
end
