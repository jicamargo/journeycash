class LabelsController < ApplicationController
  # Devise authentication
  before_action :authenticate_user!

  # cancan authorization
  #  load_and_authorize_resource

  # Set label
  before_action :set_label, only: %i[show edit update destroy]

  # GET /labels of current_user
  def index
    @labels = current_user.labels
  end

  # GET /labels/1 or /labels/1.json
  def show; end

  # GET /labels/new
  def new
    @label = Label.new
  end

  # GET /labels/1/edit
  def edit; end

  # POST /labels or /labels.json
  def create
    @label = Label.new(label_params)
    @label.user_id = current_user.id

    authorize! :create, @label

    respond_to do |format|
      if @label.save
        format.html { redirect_to label_url(@label), notice: 'label was successfully created.' }
        format.json { render :show, status: :created, location: @label }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labels/1 or /labels/1.json
  def update

    authorize! :update, @label

    respond_to do |format|
      if @label.update(label_params)
        format.html { redirect_to label_url(@label), notice: 'label was successfully updated.' }
        format.json { render :show, status: :ok, location: @label }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @label.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labels/1 or /labels/1.json
  def destroy

    authorize! :destroy, @label

    @label.destroy

    respond_to do |format|
      format.html { redirect_to labels_url, notice: 'label was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_label
    @label = Label.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def label_params
    params.require(:label).permit(:name)
  end
end
