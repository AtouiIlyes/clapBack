module Response
  def json_response(object, location, status = :ok)
    render json: object, status: status, location: location
  end
end