class UserMailer < ApplicationMailer
  def account_activation user
    @user = user

    mail to: user.email, subject: t("checkout_email_subject")
  end

  def password_reset
    @greeting = t "hi"

    mail to: "to@example.org"
  end
end
