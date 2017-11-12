class TicketsMailer < ApplicationMailer
  #rails g mailer TicketsMailer
  def buy_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'You boght a ticket')
  end
  
  def cancel_ticket(user, ticket)
    @user = user
    @ticket = ticket
    mail(to: user.email, subject: 'Your ticket was cancelled')
  end
end
