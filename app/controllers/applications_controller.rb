class ApplicationsController < ApplicationController
    before_action :authenticate_user!
  
    def create
      @application = current_user.applications.build(application_params)
      if @application.save
        # Aquí puedes agregar la lógica para notificar a Esteban
        redirect_to user_path(current_user), notice: 'Postulación enviada exitosamente.'
      else
        render :new
      end
    end
  
    private
  
    def application_params
      params.require(:application).permit(:job_offer_id, :cover_letter)
    end
  end
  