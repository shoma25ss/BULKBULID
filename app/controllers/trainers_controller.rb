class TrainersController < ApplicationController
  before_action :set_trainer, only: %i[ show ]

  def index
    @trainers = Trainer.all
  end

  def show
  end

  def new
    @trainer = Trainer.new
  end

  def create
    @trainer = Trainer.new(trainer_params)

    respond_to do |format|
      if @trainer.save
        format.html {redirect_to @trainer, notice: "Trainer was successfully created."}
        format.json {render :show,status: :created,location: @trainer }
      else
        format.html {render :new, status: :unprocessable_content }
        format.json {render json: @trainer.errors, status: :unprocessable_content}
      end
    end
  end

  private
    def trainer_params
      params.expect(trainer: [ :name, :role, :employment_type, :store_id, :phone, :email, :session_price, :registered_on ])
    end
    
    def set_trainer
      @trainer = Trainer.find(params.expect(:id))
    end
  end