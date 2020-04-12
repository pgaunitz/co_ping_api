module ResponseJSON
  def response_json
    JSON.parse(response.boy)
  end
end