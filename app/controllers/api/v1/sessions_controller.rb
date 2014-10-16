module Api
  module V1
    class SessionsController < ApplicationController

      include ErrorSerializer

      def new
        redirect_to '/auth/twitter'
      end

      def create
        auth = request.env["omniauth.auth"]
        if user_allowed? auth
          user = User.where(:provider => auth['provider'],
                            :uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
        end

        unless user.nil?
          reset_session
          session[:user_id] = user.id
          close_popup = "<html><body><script>window.close()</script></body></html>"
          render inline: close_popup
        else
          # TODO: render more proper errors and status
          raise "user not allowed"
        end
      end

      def destroy
        reset_session
        render json: :no_content
      end

      def current
        # TODO: figure out if I can extract non-ActiveModel serializers for use next to active_model_serializers
        render json: { sessions: session }
      end

      private

      def user_allowed?(auth)
        auth["info"]["nickname"].eql? "jaketrent"
      end

    end
  end
end
