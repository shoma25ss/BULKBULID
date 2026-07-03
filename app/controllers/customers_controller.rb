class CustomersController < ApplicationController
    before_action :set_customer, only: %i[ show edit update destroy ]
  
    def index
      @customers = Customer.all
    end
  
    def show
    end
  
    def new
      @customer = Customer.new
    end
  
    def create
      @customer = Customer.new(customer_params)
  
      respond_to do |format|
        if @customer.save
          format.html {redirect_to @customer, notice: "Customer was successfully created."}
          format.json {render :show,status: :created,location: @customer }
        else
          format.html {render :new, status: :unprocessable_content }
          format.json {render json: @customer.errors, status: :unprocessable_content}
        end
      end
    end
  
    def edit
    end
  
    def update
      respond_to do |format|
        if @customer.update(customer_params)
          format.html { redirect_to @customer, notice: "Customer was successfully updated.", status: :see_other }
          format.json { render :show, status: :ok, location: @customer }
        else
          format.html { render :edit, status: :unprocessable_content }
          format.json { render json: @customer.errors, status: :unprocessable_content }
        end
      end
    end
  
    def destroy
      @customer.destroy!
  
      respond_to do |format|
        format.html { redirect_to customers_path, notice: "Customer was successfully destroyed.", status: :see_other }
        format.json { head :no_content }
      end
    end
  
    private
      def customer_params
        params.expect(customer: [ :name, :name_kana, :gender, :birthday, :phone, :email, :status, :store_id, :trainer_id, :join_date, :referral_source ])
      end
      
      def set_customer
        @customer = Customer.find(params.expect(:id))
      end
    end