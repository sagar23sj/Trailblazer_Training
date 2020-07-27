module User::Operation
	class Index < Trailblazer::Operation

		
		
		step :is_request_valid?
		step :fetch_users
		fail :set_error_message, :fail_fast => true
		# step :sample_user
		fail :set_second_error_message

		def fetch_users(ctx, **)
			ctx[:users] = User.all
		end

		def is_request_valid?(ctx, params:,  **)
			params[:is_valid]
		end

		def set_error_message(ctx, **)
			ctx[:error] = "Invalid Request"
		end

		# def sample_user(ctx, **)
		# 	false
		# end

		def set_second_error_message(ctx, **)
			ctx[:error] = "Second Invalid Request"
		end

		

	end

end