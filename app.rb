require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/division")
require("./lib/employee")
require("pg")

get('/') do
  @divisions = Division.all()
  erb(:index)
end

post("/divisions") do
  division_name = params["division_name"]
  division = Division.new({:division_name => division_name, :id => nil})
  division.save()
  @divisions = Division.all()
  erb(:index)
end

get("/divisions/:id") do
  @division = Division.find(params["id"].to_i())
  erb(:division)
end

patch("/divisions/:id") do
  division_name = params.fetch("division_name")
  @division = Division.find(params.fetch("id").to_i())
  @division.update({:division_name => division_name})
  @divisions = Division.all()
  erb(:index)
end

get('/divisions/:id/edit') do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division_edit)
end

# --------------------------------

post('/employees') do
  employee_name = params.fetch('employee_name')
  division_id = params["division_id"].to_i()
  @employee = Employee.new({:employee_name => employee_name, :division_id => division_id})
  @employee.save()
  @division = Division.find(division_id)
  erb(:division)
end

get("/employees/:id") do
  @employee = Employee.find(params["id"].to_i())
  erb(:employee_edit)
end

patch("/employees/:id") do
  employee_name = params.fetch("employee_name")
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.update({:employee_name => employee_name})
  @employees = Employee.all()
  erb(:employee_edit)
end

get('/employees/:id/edit') do
  @employee = Employee.find(params.fetch("id").to_i())
  erb(:employee_edit)
end
