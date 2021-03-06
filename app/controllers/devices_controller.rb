class DevicesController < ApplicationController

  autocomplete :device, :serial_number

  before_action :find_user
  before_action :confirm_logged_in
  before_action :user_admin, except: [:index, :show]

  def index
    respond_to do |format|
      format.html
      format.json { @devices = Device.search(params[:search]) }
    end
  end

  def show
    @device = Device.find(params[:id])
  end

  def new
    @device = Device.new
  end

  def create
    @device = Device.new(device_params)

    if @device.save
      redirect_to device_path(@device)
    else
      render 'new'
    end
  end

  def edit
    @device = Device.find(params[:id])
  end

  def update
    @device = Device.find(params[:id])

    if @device.update_attributes(device_params)
      redirect_to device_path(@device)
    else
      render 'edit'
    end
  end

  def delete
    @device = Device.find(params[:id])
  end

  def destroy
    @device = Device.find(params[:id])
    @device.destroy
    redirect_to devices_path
  end

  private

  def device_params
    params.require(:device).permit(:serial_number, :user_id, :device_type)
  end

  def find_user
    if params[:search]
      @devices = Device.search(params[:search]).paginate(page: params[:page], :per_page => 15)
    elsif params[:user_id]
      @devices = Device.where(user_id: params[:user_id]).paginate(page: params[:page], :per_page => 15)
    else
      @devices = Device.all.paginate(page: params[:page], :per_page => 15)
    end
  end
end
