class PassengerMailer < ApplicationMailer
  default from: 'notifications@flightBooker.com'

  def confirmation_email
    @user = params[:user]
    @booking = params[:booking]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Your flight has been booked!')
  end
end
