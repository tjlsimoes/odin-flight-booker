class PassengerMailer < ApplicationMailer
  def confirmation_email
    @name = params[:name]
    @email = params[:email]
    mail(to: @email, subject: 'You have booked your ticket')
  end
end
