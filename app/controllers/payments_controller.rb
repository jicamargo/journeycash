class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[ show edit update destroy ]

  # GET /payments or /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1 or /payments/1.json
  def show    
  end

  # GET /payments/new
  def new
    @payment = Payment.new
    # create a list of groups to choose from
    @groups = Group.all
    #create a list of labels to choose from
    @labels = Label.all
  end

  # GET /payments/1/edit
  def edit
  end

  # POST /payments or /payments.json
  def create
    @payment = Payment.new(payment_params)
    @payment.group_id = params[:payment][:group_id]
    
    # Verify if select a existing label or create a new one 
    if params[:payment][:label_id].present?
      @payment.label_id = params[:payment][:label_id]
    else
      new_label_name = params[:payment][:new_label]
      
      # Verify if the new label name is not empty
      if new_label_name.present?
        # look for a label with the same name
        new_label_name = new_label_name.capitalize
        existing_label = Label.find_by(name: new_label_name)
        
        if existing_label
          # if exist a label with the same name, use it
          @payment.label_id = existing_label.id
        else
          # if not exist a label with the same name, create a new one
          new_label = Label.create(name: new_label_name, user_id: current_user.id)
          @payment.label_id = new_label.id
        end
      end
    end

    respond_to do |format|
      if @payment.save
        format.html { redirect_to payment_url(@payment), notice: "Payment was successfully created." }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to payment_url(@payment), notice: "Payment was successfully updated." }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url, notice: "Payment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def payment_params
      params.require(:payment).permit(:label_id, :group_id, :amount)
    end
end
