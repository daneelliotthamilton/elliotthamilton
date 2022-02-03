module Support
  class FeedbacksController < ApplicationController
    skip_before_action :redirect_to_landing


    def create
      @feedback = Support::Feedback.new(feedback_params)
      recaptcha_valid = verify_recaptcha(action: 'send_feedback')
      checkbox_success = verify_recaptcha(secret_key: Rails.application.credentials.recaptcha_v2[:secret_key]) unless recaptcha_valid
      respond_to do |format|
        if recaptcha_valid || checkbox_success
          if @feedback.save
            SupportMailer.send_feedback(@feedback).deliver_later
            format.html { redirect_to root_url, notice: 'Thank you. I will get back to you as soon as possible.' }
            format.js
          else
            format.html { render :back }
            format.js { render :new }
            format.json { render json: @feedback.errors, status: :unprocessable_entity }
          end
        else
          @show_checkbox_recaptcha = true if recaptcha_valid == false
          format.html { render :back }
          format.js { render :new }
          format.json { render json: @feedback.errors, status: :unprocessable_entity }
        end
      end
    end

    private

      def feedback_params
        params.require(:support_feedback).permit(:name, :email,  :subject, :message)
      end
  end
end
