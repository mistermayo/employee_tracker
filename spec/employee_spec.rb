require('spec_helper')

describe(Employee) do
  it("tells which division they belong to") do
    division = Division.create({:division_name => "division"})
    employee = Employee.create({:employee_name => "employee", :division_id => division.id})
    expect(employee.division()).to(eq(division))
  end
end
