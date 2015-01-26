require("rspec")
require("pg")
require("sinatra/activerecord")
require("employee")
require("division")

RSpec.configure do |config|
  config.after(:each) do
    Employee.all().each() do |employee|
      employee.destroy()
    end
  end
end
