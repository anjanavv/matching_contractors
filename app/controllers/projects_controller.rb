class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :matching_contractors, :interest_request, :project_request]
  def index
    @projects = RenovationProject.all
  end

  def show
    @requested_projects = @project.requested_projects
  end

  def new
    @project = RenovationProject.new
  end

  def create
    @project = RenovationProject.new(allowed_params)
    if @project.save
      redirect_to project_url(@project), :notice => "Successfully created project."
    else
      render :new
    end
  end
  
  def matching_contractors
    @contractors = @project.matching_contractors
  end
  
  def interest_request
    @requested_project = RequestedProject.new(renovation_project_id: @project.id, 
      contractor_id: params[:contractor], owner_interested: params[:status])
    if @requested_project.save
      redirect_to project_url(@project), :notice => "Interest submitted."
    else
      redirect_to project_url(@project), :notice => "Request already submitted"
    end
  end
  
  def project_request
    @requested_project = RequestedProject.find(params[:request_id])
    if @requested_project.update_attributes(project_awarded: params[:status])
      @project.update_attributes(project_awarded: true) if params[:status].to_i == 1
      redirect_to project_url(@project), :notice => "Status updated."
    else
      redirect_to project_url(@project), :notice => "Status not updated"
    end
  end

  private
  
  def set_project
    @project = RenovationProject.find(params[:id])
  end

  def allowed_params
    params.require(:renovation_project).permit(:id, :name, :address, :min_budget,
      :max_budget, :design_services_needed, :build_services_needed)
  end
end
