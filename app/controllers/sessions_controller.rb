class SessionsController < ApplicationController
  def new
  end

  def create
    agency = Agency.find_by(business_name: params[:business_name])
    if agency && agency.authenticate(params[:password])
      session[:user_id] = agency.id
      session[:agency] = true
      session[:client] = nil
      redirect_to clients_path, notice: 'Logged in!'
    else
      client = Client.find_by(business_name: params[:business_name])
      if client && client.authenticate(params[:password])
        session[:user_id] = client.id
        session[:agency] = nil
        session[:client] = true
        redirect_to campaigns_path, notice: 'Logged in!'
      else
        flash.now.alert = 'Invalid login, try again'
        render 'new'
      end
    end

  end

  def destroy
    session[:user_id] = nil
    session[:agency] = nil
    session[:client] = nil
    redirect_to welcome_index_path, notice: 'Logged out!'
  end

end
