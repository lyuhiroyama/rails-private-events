class EventRegistrationsController < ApplicationController
  before_action :set_registration, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /registrations or /registrations.json
  def index
    @registrations = Registration.all
  end

  # GET /registrations/1 or /registrations/1.json
  def show
  end

  # GET /registrations/new
  def new
    @registration = EventRegistration.new
  end

  # GET /registrations/1/edit
  def edit
  end

  # POST /registrations or /registrations.json
  def create
    @event = Event.find(params[:event_id])
    @registration = EventRegistration.new(user: current_user, event: @event)

    respond_to do |format|
      if @registration.save
        format.html { redirect_to @event, notice: "Registration was successfully created." }
        format.json { render @event, status: :created, location: @registration }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registrations/1 or /registrations/1.json
  def update
    respond_to do |format|
      if @registration.update(registration_params)
        format.html { redirect_to @registration, notice: "Registration was successfully updated." }
        format.json { render :show, status: :ok, location: @registration }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1 or /registrations/1.json
  def destroy
    @registration = EventRegistration.find(params[:id])
    @event = @registration.event
    @registration.destroy!

    respond_to do |format|
      format.html { redirect_to @event, status: :see_other, notice: "Registration was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registration
      @registration = EventRegistration.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def registration_params
      params.expect(registration: [ :user_id_id, :event_id_id ])
    end
end
