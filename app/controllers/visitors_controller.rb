class VisitorsController < ApplicationController

  def new
    flash.now[:notice] = 'Welcome!'
    flash.now[:alert] = 'Access not allowed.'
  end

end