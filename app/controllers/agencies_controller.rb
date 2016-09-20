class AgenciesController < ApplicationController
  def new
    @agency = Agency.new
  end

  def create
    @agency = Agency.new(agency_params)
    if @agency.save
      session[:agency_id] = @agency.id
      flash[:notice] = 'You have successfully signed up'
      redirect_to clients_path
    else
      render 'new'
  end
end

private
  def agency_params
    params.require(:agency).permit(:business_name, :founded_date, :password, :password_confirmation)

  end

end
