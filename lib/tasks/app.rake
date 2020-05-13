namespace :app do
  
  routes = Rails.application.routes.url_helpers
  session = ActionDispatch::Integration::Session.new(Rails.application)
  
  desc "GET SHORT URL"
  task encode: :environment do 
    url = ENV['URL']
    session.post("https://localhost:3000#{routes.links_path}", params: {
      link: { url: url}
    })
    response = JSON.parse(session.response.body)
    short_url = response["short_url"]
    puts "The shortened url of #{url} is https://short.is/#{short_url}."
  end

  desc "GET ORIGINAL URl"
  task decode: :environment do
    input = ENV['SHORTURL']
    short_url = input[input.length-8, input.length]
    res = session.get "https://localhost:3000#{routes.short_url_path(short_url)}"
    response = JSON.parse(session.response.body)
    if res == 404
      puts "No original url was found for the  short url #{input}."
    else
      puts "The original url of short url #{input} is #{response['url']}."
    end
  end
end