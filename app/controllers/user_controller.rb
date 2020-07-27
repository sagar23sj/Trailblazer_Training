class UserController < ApplicationController

  # def index
  #   @users = User::Operation::Index.(params: {is_valid: true})
  #   render json: @users
  # end

  def index
    @users = User::Operation::Index.(params: permit_params)
    render json: @users
  end

  # def show
  #   @user = User::Operation::Show.(params: {id: 1})
  #   render json: @user
  # end

  def show
    @user = User::Operation::Show.(params: permit_params)
    render json: @user
  end

  # def Day2
  #   @users = User::Operation::Day2.(params: {request_type: "mobile"})
  #   render json: @users
  # end

  def Day2
    @users = User::Operation::Day2.(params: permit_params)
    render json: @users
  end

  private

  def permit_params
    params.permit(:is_valid, :id, :request_type)
  end

end
