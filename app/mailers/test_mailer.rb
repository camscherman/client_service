class TestMailer < ApplicationMailer
  def test_mail
    mail(to: 'camscherman@hotmail.com', subject: 'Test mail')
  end

end
