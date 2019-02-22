class ContractorsController < ApplicationController
  def index
    if params[:search].present?
      @contractors = Contractor.near(params[:search], 50, :order => :distance)
    else
      @contractors = Contractor.all
    end
  end

  def show
    @contractor = Contractor.find(params[:id])
  end

  def new
    @contractor = Contractor.new
  end

  def create
    @contractor = Contractor.new(allowed_params)
    if @contractor.save
      redirect_to @contractor, :notice => "Successfully created contractor."
    else
      render :new
    end
  end

  def edit
    @contractor = Contractor.find(params[:id])
  end

  def update
    @contractor = Contractor.find(params[:id])
    if @contractor.update_attributes(allowed_params)
      redirect_to @contractor, :notice  => "Successfully updated locontractorcation."
    else
      render :edit
    end
  end

  def destroy
    @contractor = Contractor.find(params[:id])
    @contractor.destroy

    redirect_to contractors_url, :notice => "Successfully destroyed contractor."
  end

  private

  def allowed_params
    params.require(:contractor).permit(:id, :name, :address, :latitude, 
      :longitude, :min_budget, :max_budget, :has_design_services, :has_build_services)
  end
  end
