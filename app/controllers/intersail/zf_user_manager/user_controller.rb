module Intersail
  module ZfUserManager
    class UserController < ApplicationController
      include Intersail::ZfUserManager::Concerns::Messageable
      include Intersail::ZfUserManager::UserServices

      before_action :set_user, only: [:show, :create, :update, :destroy, :new_profile, :edit_profile, :destroy_profile]
      before_action :set_section
      before_action :set_search_params, only: [:index, :show, :create, :update, :destroy, :new_profile, :edit_profile, :destroy_profile]

      def index
        index_function
      end

      def show
        show_function
        render 'index'
      end

      def create
        create_function
        render 'index'
      end

      def update
        update_function
        render 'index'
      end

      def destroy
        destroy_function
        render 'index'
      end

=begin
      def new_profile
        new_profile_function
      end

      def edit_profile
        edit_profile_function
      end

      def destroy_profile
        destroy_profile_function
      end
=end

      private

      def set_user
        set_user_function(params[:id])
      end

      def set_section
        @section = :user
      end

      def set_search_params
        set_search_params_function
      end
    end
  end
end