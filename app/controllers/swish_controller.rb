class SwishController < ApplicationController
  before_action :find_pong

  def create
    payload = {
      callbackUrl: 'https://7b493249.ngrok.io/swish/callback',
      payeeAlias: ping_phone,
      payerAlias: pong_phone,
      amount: 1000,
      currency: 'SEK'
    }
    response = swish_call(:post, 'https://mss.cpc.getswish.net/swish-cpcapi/api/v1/paymentrequests/', payload)
    body = ping_swish(response.headers[:location])
    render json: body
  end

  private

  def find_pong
    @swish_pong = Pong.find(params['swish']['pong_id'])
  end

  def pong_phone
    binding.pry
    @swish_pong.user.phone_number
  end

  def ping_phone
    binding.pry
    @swish_pong.ping.user.phone_number
  end
end
