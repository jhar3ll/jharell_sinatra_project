class ApplicationController < Sinatra::Base
   register Sinatra::ActiveRecordExtension
   
  configure do 
    set :public_folder, 'public'
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions 
    set :session_secret, "jc_sin_proj"
  end 
  
  get '/' do 
    erb :index
  end 
  
  helpers do 
    
    def current_user 
      @current_user ||= Owner.find_by(id: session[:user_id]) if session[:user_id]
    end 
    
    def logged_in?
      !!current_user
    end 
  end 
end