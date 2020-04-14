# module PongService
#   def self.pong_creator(pong_params)
#     pong = Pong.create(pong_params)
#     if pong.persisted?
#       render json: { message: 'Your request was added to this trip' }
#     else
#       error_handler('You have to specify what items you need')
#     end
#   end

#   def self.error_handler(error)
#     render json: { message: error }, status: 422
#   end
# end
