class SamplesController < ApplicationController

  def index
    @samples = Sample.all
  end

  def show
    @sample = Sample.find(params[:id])
  end

  def new
    @sample = Sample.new
  end

  def edit
    @sample = Sample.find(params[:id])
  end

  def create
    @sample = Sample.new(params[:sample])
      if @sample.save
        redirect_to @sample, :notice => 'Sample was successfully created'
      else
        render :action => "new" 
      end
  end

  def update
    @sample = Sample.find(params[:id])
      if @sample.update_attributes(params[:sample])
         redirect_to @sample, :notice => 'Sample was successfully updated.'
      else
         render :action => "edit" 
      end
  end

  def destroy
    @sample = Sample.find(params[:id])
    @sample.destroy
  end
end