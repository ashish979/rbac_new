class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    redirect_to root_path
  end

  def error_404
    respond_to do |format|
      format.html { render file: 'pages/error_404', layout: 'error', status: 404 }
      format.any { render json: { error: 'Not found', status: 404 } }
    end
  end

  def error_403
    respond_to do |format|
      format.html { render file: 'pages/error_403', layout: 'error', status: 403 }
      format.any { render json: { error: 'Unauthorized', status: 403 } }
    end
  end

  def error_500
    respond_to do |format|
      format.html { render file: 'pages/error_500', layout: 'error', status: 500 }
      format.any { render json: { error: 'Internal server error', status: 500 } }
    end
  end
end
