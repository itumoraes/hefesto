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

  def destroy
    @home_office = HomeOffice.find(params[:id])

    if @home_office.user == current_user
      @home_office.destroy
      flash[:success] = 'Home office desmarcado com sucesso!'
    else
      flash[:error] = 'Você não pode desmarcar esse Home office'
    end

    redirect_to root_path
  end

  private

  def home_office_params
    params.require(:home_office).permit(:date)
  end
end
