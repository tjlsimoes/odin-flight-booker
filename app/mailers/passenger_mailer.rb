class PassengerMailer < ApplicationMailer
  def confirmation_email(*passenger)
    if passenger.empty?
      @name = params[:name]
      @email = params[:email]
    else
      @name = passenger[0].name
      @email = passenger[0].email
    end
    mail(to: @email, subject: 'You have booked your ticket')
  end
end
