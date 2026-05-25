class ChefsController < ApplicationController
    before_action :set_chef,only: %i[show edit update destroy]
    def index
        @chefs = Chef.all
    end

    def new
        @chef = Chef.new
    end

    def create
        @chef = Chef.new(chef_params)
        if chef_params[:password] != chef_params[:password_confirmation]
            flash.now[:alert] = "Password confirmation doesn't match password."
            render :new
        elsif @chef.save
            session[:chef_id] = @chef.id
            redirect_to chef_path(@chef), notice: "Chef was successfully created."
        else
            render :new
        end
    end

    def show
    end

    def edit
        
    end

    def update
        if @chef.update(chef_params)
            redirect_to chef_path(@chef), notice: "Chef was successfully updated."
        else
            render 'edit'
        end
    end

    def destroy
        @chef.destroy
        redirect_to chefs_path, notice: "Chef was successfully deleted."
    end

    private
    def chef_params
        params.require(:chef).permit(:name, :email, :password, :password_confirmation)
    end 

    def set_chef
        @chef = Chef.find(params[:id])
    end
end