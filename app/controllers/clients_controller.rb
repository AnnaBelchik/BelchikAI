class ClientsController < ApplicationController
  before_action :set_client, only: %i[ show edit update destroy]
  before_action :set_main_data

  # GET /clients or /clients.json
  def index
    @clients = Client.all
  end

  def sign_in
    @client = Client.new
  end

  def check_sign_in
    @client = Client.find_by_phone(client_params[:phone])
    respond_to do |format|
      if @client.check_sign_in(client_params[:password])
        session[:client_id] = @client.id
        format.html { redirect_to client_path(@client), notice: 'Sign in successfull!' }
      else
        flash[:error] = 'Bad phone or password'
        format.html { redirect_back(fallback_location: root_path) }
      end
    end
  end

  # GET /clients/1 or /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        session[:client_id] = @client.id
        format.html { redirect_to @client, notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :show, status: :unprocessable_entity }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def sign_out
    reset_session
    redirect_back(fallback_location: root_path)
  end

  private

  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:surname, :forename, :middle_name, :birthday, :street, :number_home,
                                   :number_appartment, :phone, :login, :password)
  end
end
