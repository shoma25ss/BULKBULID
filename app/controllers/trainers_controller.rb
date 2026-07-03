class TrainersController < ApplicationController
  before_action :set_trainer, only: %i[ show edit update destroy ]

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

  def edit
  end

  def update
    respond_to do |format|
      if @trainer.update(trainer_params)
        format.html { redirect_to @trainer, notice: "Trainer was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @trainer }
      else
        format.html { render :edit, status: :unprocessable_content }
        format.json { render json: @trainer.errors, status: :unprocessable_content }
      end
    end
  end

  def destroy
    @trainer.destroy!

    respond_to do |format|
      format.html { redirect_to trainers_path, notice: "Trainer was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
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