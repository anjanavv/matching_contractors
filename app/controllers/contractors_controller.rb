class ContractorsController < ApplicationController
  def index
    @contractors = Contractor.all
  end

  def show
    @contractor = Contractor.find(params[:id])
    @requested_projects = @contractor.requested_projects
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
  
  def interest_request
    @requested_project = RequestedProject.find(params[:request_id])
    if @requested_project.update_attributes(contractor_accepted: params[:status])
      redirect_to contractor_url(@requested_project.contractor_id), :notice => "Status updated."
    else
      redirect_to contractor_url(@requested_project.contractor_id), :notice => "Status not updated."
    end
  end

  private

  def allowed_params
    params.require(:contractor).permit(:id, :name, :address, :min_budget, 
      :max_budget, :has_design_services, :has_build_services)
  end
end
