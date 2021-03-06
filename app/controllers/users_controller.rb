class UsersController < ApplicationController

    def show 
        @user = User.find(params[:id])
        @microposts = @user.microposts.paginate(page: params[:page])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            log_in @user
            redirect_to @user
            flash[:success] = 'Congrats you create an account'
        else 
            render "new"
        end
    end

    private 
    
        def user_params 
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end
