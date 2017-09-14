require 'sinatra'
require 'sinatra/reloader' if development? 

length = 10

get '/password_generator' do
  
  password = length.times.map{rand(10)}.join
      subs = rand (length)
      letters = (0...subs+1).map { (65 + rand(26)).chr }.join
      password_array = password.split("")
      letters_array = letters.split ("")
      replace_order = 0
      while replace_order <= subs
        password_array[replace_order]=letters_array[replace_order]
       if replace_order <= subs
         replace_order = replace_order + 1 
       else
         break
       end
      end
      password = password_array.join
      
    "Here is your #{length} digits password<br/>
    #{password.to_s}"
  end
  
get '/password_generator/:length' do
  if (6..64).include?(params["length"].to_i)   
    length = params["length"].to_i 
    redirect to ('/password_generator')
  else
    "It should be 6 - 64 digits, type a number within this range again"
  end
end

  
  
  
  
  
  
  
  

