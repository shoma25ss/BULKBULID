class TrainersController < ApplicationController
  before_action :set_trainer, only: %i[ show ]

  def index
    @trainers = Trainer.all
  end

  def show
  end

  private
    def set_trainer
      @trainer = Trainer.find(params.expect(:id))
  end
end