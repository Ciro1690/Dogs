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
        @dog = Dog.new(self.dog_params)
    
        if @dog.save
            #render json: dog
            #dog_url(@dog) == /dog/id
            redirect_to dog_url(@dog)
        else
            render json: @dog.errors.full_messages, status: :unprocessable_entity    
        end
    end

    def new
    #/dogs/new
    #show a form to create a new object
        render :new
    end

    def edit
    #/dog/:id/edit
    #show a form to edit an existing object
    end

    def destroy
        @dog = Dog.find(params[:id])
        @dog.destroy
        redirect_to dogs_url
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