class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]
    # before_action :authorize_request, except: :create
    # before_action :find_user, except: %i[create index]

    def profile
        render json: { user: UserSerializer.new(current_user) }, status: :accepted
    end

    def index
        @users = User.all 
        render json: @users, include: :animals
    end

    def show
        # @user = User.find(params[:id])

        render json: @user, include: :animals
    end
    
    def create
        @user = User.create(user_params)
        
        if @user.valid?
            # @user.save
            @token = encode_token(user_id: @user.id)
            render json: { user: UserSerializer.new(@user) }, status: :created
        else
            render json: { errors: @user.errors.full_messages }, status: :not_acceptable
        end
    end

    def update
        unless @user.update(user_params)
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
    end

    def destroy
        @user.destroy
    end
    
    def remove_animal
        @user = User.find(1)
        @user.animals.destroy(params[:animal_id])
    end

    def add_animal
        @user_animal = UserAnimal.create(user_animal_params)

        if @user_animal.save
            render json: @user_animal, status: :created
        else
            render json: @user_animal.errors, status: :unprocessable_entity
        end
    end

    private

    def find_user
        @user = User.find_by!('username': params[:_username])
        rescue ActiveRecord::RecordNotFound
            render json: { errors: 'User not found' }, status: :not_found
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end

    # def user_animal_params
    #     params.permit(:user_id, :animal_id)
    # end
end
