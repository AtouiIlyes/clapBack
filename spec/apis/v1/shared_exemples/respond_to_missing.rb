RSpec.shared_examples 'respond to missing' do |url|  
  # before do 
  #   token = JWT.encode({user: User.first.id}, 
  #     ENV["AUTH_SECRET"], "HS256")
  #   header "Authorization", "Bearer #{token}"
  #   get url
  # end

  it 'responds with 404' do
    expect(last_response.status).to eq 404
  end

  it 'responds with error' do
    message = json["errors"].first["detail"] 
    expect(message).to eq("Not found")
  end
end  