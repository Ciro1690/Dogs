class DogsController < ApplicationController
    def index
        #GET /dogs
        self.render json: Dog.all
    end

    def show
        #GET /dogs/123
        self.render json: Dog.find(self.params[:id])
    end

    def create
        #POST /dogs
        #{ "dog": {"name": "Enzo"} }

        dog = Dog.new(name: params[:dog][:name])

        if dog.save
            render json: dog
        else
            render json: dog.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        dog = Dog.find(params[:id])
        Dog.destroy
        render json: dog
    end
end