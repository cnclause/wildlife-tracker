class AnimalsController < ApplicationController
    skip_before_action :authorized
    # skip_before_action :authorize_request
    
    def index 
        @animals = Animal.all
        render json: @animals, include: :users
    end

  
end
