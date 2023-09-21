class GroupsController < ApplicationController
  # Devise authentication
  before_action :authenticate_user!

  # cancan authorization
  #  load_and_authorize_resource

  # Set group
  before_action :set_group, only: %i[show edit update destroy]

  # GET /groups of current_user
  def index
    @groups = current_user.groups
      .left_joins(:payments)
      .select('groups.id, groups.name, groups.icon, SUM(payments.amount) as total_amount')
      .group('groups.id, groups.name, groups.icon')
      .order('groups.created_at ASC')

    # replace nil with 0
    @groups.each do |group|
      group.total_amount ||= 0
    end
  end

  # select the payments of the group
  def show
    @group = Group.find(params[:id])
    @payments = @group.payments
  end

  # GET /groups/new
  def new
    create_icon_names
    @group = Group.new
    @group.icon = @icon_names[0] # set default icon
    @selected_icon = @group.icon
  end

  # GET /groups/1/edit
  def edit
    create_icon_names
    @selected_icon = @group.icon
    @group
  end

  # POST /groups or /groups.json
  def create
    create_icon_names
    @group = Group.new(group_params)
    @group.user_id = current_user.id

    authorize! :create, @group

    respond_to do |format|
      if @group.save
        format.html { redirect_to groups_url, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
    create_icon_names
    @group.user_id = current_user.id

    authorize! :update, @group

    respond_to do |format|
      if @group.update(group_params)
        format.html { redirect_to groups_url, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
    authorize! :destroy, @group
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
    @group = Group.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon, :user_id)
  end

  # Create icon names for select
  def create_icon_names
    @icon_names = []
    Dir.glob('app/assets/images/caticons/*.png').each do |file|
      @icon_names << ("#{File.basename(file, '.png')}.png")
    end
  end
end
