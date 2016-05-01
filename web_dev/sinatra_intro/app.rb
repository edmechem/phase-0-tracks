# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  if params[:name] && params[:age]
    "#{params[:name]} is #{params[:age]} years old."
  elsif params[:campus]
    response = "Students from #{params[:campus]} campus:<br><br>"
    students = db.execute("SELECT * FROM students WHERE campus=?", [params[:campus]])
    students.each do |student|
      response << "#{student['name']}, #{student['age']}<br>"
    end
    response
  elsif params.count > 0
    params.to_s
  else
    "Hello world!"
  end
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

# Release 0: Add Routes

# A /contact route that displays an address
get '/contact' do
  address = "123 Main St.<br>San Francisco, CA 94101"
end

# A /great_job route
get '/great_job' do
  name = params[:name]
  if name
    "Good job, #{name}!"
  else
    "Good job!"
  end
end

get '/add/:num1/to/:num2' do
  result = (params[:num1].to_i + params[:num2].to_i).to_s
  "#{params[:num1]} + #{params[:num2]} = #{result}"
end

