# frozen_string_literal: true
class HomeOfficesController < ApplicationController
  def create
    @home_office = current_user.home_offices.new(home_office_params)
    if @home_office.save
      flash[:success] = 'Home office marcado com sucesso!'
    else
      flash[:error] = 'Erro ao marcar Home office!'
    end
    redirect_to root_path
  end

  private

  def home_office_params
    params.require(:home_office).permit(:date)
  end
end
