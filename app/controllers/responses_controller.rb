class ResponsesController < ApplicationController
  def index
    @myresponses = Response.all
  end

  def show
    @myresponse = Response.find(params[:id])
  end

  def new
    @myresponse = Response.new
  end

  def create
    @myresponse = Response.new(params[:response])
    if @myresponse.save
      flash[:notice] = "Successfully created response."
      redirect_to @myresponse
    else
      render :action => 'new'
    end
  end

  def edit
    @myresponse = Response.find(params[:id])
  end

  def update
    @myresponse = Response.find(params[:id])
    if @myresponse.update_attributes(params[:response])
      flash[:notice] = "Successfully updated response."
      redirect_to response_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @myresponse = Response.find(params[:id])
    @myresponse.destroy
    flash[:notice] = "Successfully destroyed response."
    redirect_to responses_url
  end
end
