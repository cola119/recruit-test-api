class ApplicationController < ActionController::API
    # 200 Success
	def response_success(message, data)
	  render status: 200, json: { message: message, user: data }
    end
    
    # 400 Bad Request
	def response_bad_request(cause)
	  render status: 400, json: { message: "Account creation failed", cause: cause }
    end
    
    # 401 Unauthorized
	def response_unauthorized
	  render status: 401, json: { message: 'Authentication Faild' }
    end
    
    # 404 Not Found
	def response_not_found(class_name = 'User')
	  render status: 404, json: { status: 404, message: "No #{class_name.capitalize} Found" }
    end
    
    # 500 Internal Server Error
	def response_internal_server_error
	  render status: 500, json: { message: 'Internal Server Error' }
	end
end
