class DogsController < ApplicationController
    def index
        #GET /dogs
        #self.render json: Dog.all
        @dogs = Dog.all
        render :index
    end

    def show
        #GET /dogs/123
        #self.render json: Dog.find(self.params[:id])
        @dog = Dog.find(params[:id])
        render :show
    end

 
    def create
        dog = Dog.new(self.dog_params)
    
        if dog.save
            render json: dog
        else
            render json: dog.errors.full_messages, status: :unprocessable_entity    
        end
    end

    def destroy
        dog = Dog.find(params[:id])
        dog.destroy
        render json: dog
    end

    def update
        dog = Dog.find(params[:id])

        success = dog.update(self.dog_params)
        if success
            render json: dog
        else
            render json: dog.errors.full_messages, status: :unprocessable_entity    
        end
    end

    protected
    def dog_params
        self.params[:dog].permit(:name)
    end
end