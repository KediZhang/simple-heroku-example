require 'sinatra'
require 'sinatra/reloader' if development? 



# Root
get '/' do
  return 422
end

error 422 do 
    { error: "You haz an error" }
end




# End Points
string = "Programming for Online Prototypes"
get '/title' do
	string
end

get '/catalog_description' do
	"An introduction to rapidly prototyping web-based products and services. This 7-week experience will teach students the basics of web development for online services. Specifically, well focus on lightweight, minimal UI, microservices (e.g. bots, conversational interfaces, platform integrations, designing micro-interactions, etc.) Well introduce and examine these new web service trends and interactive experiences. Students will learn through instructor led workshops and hands-on experimentation. As an intro level course, no knowledge of programming is needed. By the end of the course, students will be able to design, prototype and deploy their own web-delivered services."
end

get '/units' do
	"6"
end

get '/instructor' do
  instructor = "Daragh Byrne, daragh@daraghbyrne.me, Slack ID: @daragh"
  instructor
end





# Redirect
get '/name' do
  redirect to('/title')
end




# Add a configuration block and provide settings that define three links (to the course slack, the main site and the github repository)
configure { set :slack, 'onlineprototypes2017.slack.com' }
configure { set :site, 'https://canvas.cmu.edu/courses/2138' }
configure { set :repo, 'https://canvas.cmu.edu/courses/2138' }

get '/links' do
  "This is page for links, type <br/> 
   /slack <br/>
   /site <br/>
   or <br/>
   /repo <br/>
   after /links to check </b>"
end

get '/links/:item' do
  if params["item"] == 'slack'
    settings.slack? 
    settings.slack
  elsif params["item"] == 'site'
    settings.site?
    settings.site
  elsif params["item"] == 'repo'
    settings.repo?  
    settings.repo
  else
    redirect to ('/links')
  end
end




# Add an endpoint to look up meeting times for the course.
get '/meeting_times/:item' do
  "You can check class times and office hours"
end

get '/meeting_times/:item' do
  if params["item"] == 'class'
    "Class time: 3 - 5pm, T R "
  elsif params["item"] == 'officehours'
    "Office hours: 5 - 6:30pm, F "
  else
    redirect to ('/meeting_times')
  end
end

  






