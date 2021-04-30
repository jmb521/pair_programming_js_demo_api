class TimeslotsController < ApplicationController
before_action :set_timeslot, only:[:show, :edit, :destroy]
    def index
        @timeslots = Timeslot.all

        render json: @timeslots, include: :user       
          
    end

    def show
        @timeslot = Timeslot.find_by(id: params[:id])
        if @timeslot
            render json: @timeslot
        else
            render json: {error: "No timeslot found"}
        end
    end

    def create
        
        @timeslot = Timeslot.create(timeslot_params)
        if @timeslot
            render json: {timeslot: @timeslot, message: "Created Successfully"}
        else
            render json: {error: @timeslot.errors}
        end
    end

    def update
        @timeslot = Timeslot.find_by(id: params[:id])

        if @timeslot && @timeslot.update(timeslot_params)
            
                render json: {timeslot: @timeslot}
            
        else
            render json: {error: @timeslot.errors}
        end
    end

    def destroy
        if @timeslot
            @timeslot.destroy
            render json: { timeslot: @timeslot}
        else
            render json: {error: "Timeslot could not be deleted"}
        end
    end





    private

    def timeslot_params
        params.require(:timeslot).permit(:activity, :booked_email, :booked_time, :taken, :user_id, :id)
    end

    def set_timeslot
        @timeslot = Timeslot.find_by(id: params[:id])
    end
end
