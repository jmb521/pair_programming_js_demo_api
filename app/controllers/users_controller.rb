class UsersController < ApplicationController

    def create
        @user = User.find_or_create_by(user_params)
        if @user.valid?
            render json: @user
        else
            render json: {error: "User was not created"}
        end
    end

    # def index
    #     binding.pry
    # end


    private
    def user_params
        params.require(:user).permit(:email, :name)
    end
end
