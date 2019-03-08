class Api::V1::StepsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_proceeding
  before_action :set_step, only: [:show, :update, :destroy]

  def index
    @steps = Step.all
    json_response(@steps, api_v1_proceeding_steps_url)
  end

  def show
    json_response(@step.as_json(), api_v1_proceeding_steps_url(@step))
  end

  def create
    @step = Step.create!(step_params)
    json_response(@step.as_json(), api_v1_proceeding_steps_url(@step), :created)
  end

  def update
    @step.update(step_params)
    json_response(@step.as_json(), api_v1_proceeding_steps_url(@step))
  end

  def destroy
    @step.destroy
    head :no_content
  end

  private

  def set_proceeding
    # 404 managed by concern exeption handler
    @proceeding = Proceeding.find(params[:proceeding_id])
  end

  def set_step
    # 404 managed by concern exeption handler
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(
      :stepType,
      :name,
      :description,
      :sended,
      :days_number, 
      :rank,
      :proceeding_id
    );
  end
end
