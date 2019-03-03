# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    member = Member.find_by(email: params[:email])
    if member&.authenticate(params[:password])
      session[:user_id] = member.id
      redirect_to clubs_path
    else
      redirect_to new_session_path, alert: 'Email or password is invalid'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to new_session_path
  end
end
