module User::Operation
	class Day2 < Trailblazer::Operation

		step :get_records

		step :check_request, Output(:success) => Track(:success),
												 Output(:failure) => Track(:mobile)

		step :filter_with_time_interval, Output(:success) => Track(:success),
																		 Output(:failure) => Track(:failure),
											 								magnetic_to: :success

		step :filter_with_status, Output(:success) => Track(:success),
														  Output(:failure) => Track(:failure),
															magnetic_to: :success

		step :set_response_for_web, Output(:success) => Track(:success),
															  Output(:failure) => Track(:failure),
																magnetic_to: :success

		step :order_desc_on_created_at, Output(:success) => Track(:mobile),
															    	Output(:failure) => Track(:failure),
															    	magnetic_to: :mobile

    step :set_response_for_mobile, Output(:success) => Track(:mobile),
														       Output(:failure) => Track(:failure),
															     magnetic_to: :mobile
																
		fail :invalid_request
		


		def get_records(ctx, **)
			p 'Getting User Records'
			ctx[:users] = User.all
		end
		

		def check_request(ctx, params:, **)
			
			p 'checking Request'
			if params[:request_type] == "web"
				true
			elsif params[:request_type] == "mobile"
				false
			end

		end
		


		def filter_with_time_interval(ctx, **)
			p 'Filtering Based on Time Interval'
		end
		


		def filter_with_status(ctx, **)
			p 'Filtering Based on Status'
		end
		


		def set_response_for_web(ctx, **)
			p 'Setting Response for web'
		end

		def order_desc_on_created_at(ctx, users:, **)
			p 'Arranging Records in Descending Order'
			ctx[:users] = users.order(created_at: :desc)
		end

		def set_response_for_mobile(ctx, **)
			p 'Setting Response for Mobile App'
		end

		def invalid_request(ctx, **)
			p "Invalid Request"
			ctx[:error] = "Invalid Request"
		end
		

	end
end
