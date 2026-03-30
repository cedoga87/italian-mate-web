require 'sinatra'
require 'italian_mate'

# Step 1: The "Home Page"
get '/' do
  erb :index
end

# Step 2: The "Action" (When you press the button)
post '/process' do
  @input = params[:text_input]
  
  # IMPORTANT: Replace '.process' with the actual method from the Italian Mate gem
  # Check the gem's documentation for the correct command.
  @result = ItalianMate.process(@input) 
  
  erb :index
end

__END__

@@index
<!DOCTYPE html>
<html lang="it">
<head>
  <meta charset="UTF-8">
  <title>Italian Mate Mobile</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
  <style>
    body { font-family: -apple-system, sans-serif; padding: 20px; background: #f8f9fa; color: #333; }
    .container { max-width: 500px; margin: auto; }
    input { width: 100%; padding: 15px; border: 1px solid #ddd; border-radius: 8px; font-size: 16px; box-sizing: border-box; }
    button { width: 100%; padding: 15px; background: #007bff; color: white; border: none; border-radius: 8px; margin-top: 10px; font-size: 18px; font-weight: bold; }
    .card { background: white; padding: 20px; border-radius: 12px; shadow: 0 4px 6px rgba(0,0,0,0.1); margin-top: 20px; }
    h1 { text-align: center; color: #007bff; }
  </style>
</head>
<body>
  <div class="container">
    <h1>🇮🇹 Italian Mate</h1>
    <form action="/process" method="POST">
      <input type="text" name="text_input" placeholder="Type here..." value="<%= @input %>" required autofocus>
      <button type="submit">Translate / Process</button>
    </form>

    <% if @result %>
      <div class="card">
        <strong>Result:</strong><br>
        <p><%= @result %></p>
      </div>
    <% end %>
  </div>
</body>
</html>