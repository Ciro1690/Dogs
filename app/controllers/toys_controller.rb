class ToysController < ApplicationController
    def index
        #/dogs/dog_id/toys
        dog = Dog.find(params[:dog_id])
        render json: dog.toys
    end

    def show
        #/dogs/:dog_id/toys/:id
        #/toys/:id <<<
        render json: Toy.find(params[:id])
    end

    def create
        #POST /dogs/:dog_id/toys
        #POST /toys
        toy = Toy.new(self.toy_params)

        if toy.save
            render json: toy
        else
            render json: toy.errors.full_messages, status: :unprocessable_entity    
        end
    end

    def destroy
        #toys/:id
        toy = Toy.find(params[:id])
        toy.destroy
        render json: toy
    end

    def update
        toy = Toy.find(params[:id])

        success = toy.update(self.toy_params)
        if success
            render json: toy
        else
            render json: toy.errors.full_messages, status: :unprocessable_entity    
        end
    end

    protected
    def toy_params
        self.params[:toy].permit(:dog_id, :name)
    end

end