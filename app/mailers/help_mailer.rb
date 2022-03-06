require('pry')
class HelpMailer < ApplicationMailer
  include Devise::Controllers

  def help_send
    binding.pry
    help = params[:help]
    mail(from: current_user.email)
    mail(to: 'morgan.waites@gmail.com',
    subject: help[:subject], body: help[:message])
  end

end