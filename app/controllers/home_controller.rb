class HomeController < ApplicationController
  load_and_authorize_resource :class => false

  def index
    @work_points = WorkPoint.filter(current_user.id).order(:entrada)
  end

end
