class UserMailer < ApplicationMailer

    def welcome_email
        @rentel = params[:user]
        mail(to: @rentel.user.email, subject: 'Welcome to book library')
    end

    def welcome_to_email
      @libraryan = params[:user]
      mail(to: @libraryan.user.email, subject: 'Welcome to book library')
  end
end
