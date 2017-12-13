class HomeController < ApplicationController
  def index
    TestMailer.test_mail
  end
end
