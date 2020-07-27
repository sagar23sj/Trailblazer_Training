module User::Operation
	class Show < Trailblazer::Operation

		step :is_request_valid?
		step :fetch_user
		fail :set_error_message, :fail_fast => true

		def fetch_user(ctx, params:, **)
			ctx[:user] = User.find(params[:id])
		end

		def is_request_valid?(ctx, params:,  **)
			User.exists?(params[:id]) if params[:id] != nil
		end

		def set_error_message(ctx, **)
			ctx[:error] = "User Doesn't Exist"
		end
	
	end
end
