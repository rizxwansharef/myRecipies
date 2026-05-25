class IngredientsController <ApplicationController 

    def index
        @ingredients = Ingredient.all
    end

    def show
        @ingredient = Ingredient.find(params[:id])
    end

    def new
        @ingredient = Ingredient.new
    end

    def create
        if authorized_for_admin?
            @ingredient = Ingredient.new(ingredient_params)
            if @ingredient.save
                redirect_to @ingredient, notice: "Ingredient was successfully created."
            else
                render :new
            end
        else
            redirect_to ingredients_path, alert: "You are not authorized to perform this action."
        end
    end
    
    def destroy
        if authorized_for_admin?
            @ingredient = Ingredient.find(params[:id])
            @ingredient.destroy
            redirect_to ingredients_path, notice: "Ingredient was successfully deleted."
        else
            redirect_to ingredients_path, alert: "You are not authorized to perform this action."
        end
    end

    private
    def ingredient_params
        params.require(:ingredient).permit(:name)
    end 
end