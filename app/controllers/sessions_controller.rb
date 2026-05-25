class SessionsController < ApplicationController
    def new

    end


    def create
        chef = Chef.find_by(email: params.dig(:session, :email))

        if chef&.authenticate(params.dig(:session, :password))
            session[:chef_id] = chef.id
            redirect_to chef_path(chef), notice: "Logged in successfully."
        else
            flash.now[:alert] = "Invalid email or password."
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        session.delete(:chef_id)
        redirect_to root_path, notice: "Logged out successfully."
    end
end