class ImportController < ApplicationController
  def show
  end

  def new
  end

  def create
    begin
      @revenue = OrdersImporter.run! params[:file].tempfile
      render action: 'show'
    rescue
      flash[:error] = 'Unable to process your file.  Please try again.'
      render action: 'new'
    end
  end

end