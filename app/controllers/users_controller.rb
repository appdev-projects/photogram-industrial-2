class UsersController < ApplicationController
  def show
    @user = User.find_by!(username: params.fetch(:username))
  end

  def leading
    @user = User.find_by!(username: params.fetch(:username))
  end

  def following
    @user = User.find_by!(username: params.fetch(:username))
  end
end