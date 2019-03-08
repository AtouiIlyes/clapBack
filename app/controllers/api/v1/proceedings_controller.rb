class Api::V1::ProceedingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_process, only: [:show, :update, :destroy]

  def index
    @proceedings = Proceeding.all.as_json(include: :steps)
    json_response(@proceedings, api_v1_proceedings_url)
  end

  def show
    json_response(@process.as_json(include: :steps), api_v1_proceedings_url(@process))
  end

  def create
    @process = Proceeding.create!(process_params)
    json_response(@process.as_json(), api_v1_proceedings_url(@process), :created)
  end

  def update
    @process.update(process_params)
    json_response(@process.as_json(include: :steps), api_v1_proceedings_url(@process))
  end

  def destroy
    @process.destroy
    head :no_content
  end

  private

  def set_process
    # 404 managed by concern exeption handler
    @process = Proceeding.find(params[:id])
  end

  def process_params
    params.require(:process).permit(
      :code,
      :libelle,
      :step_ids => []
    );
  end
end
