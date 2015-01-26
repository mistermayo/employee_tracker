require('spec_helper')

describe(Division) do
  it("tells which employees are in it") do
    division = Division.create({:division_name => "Catheter"})
    employee1 = Employee.create({:employee_name => "Divine", :division_id => division.id})
    employee2 = Employee.create({:employee_name => "Esmeralda", :division_id => division.id})
   expect(division.employees()).to(eq([employee1, employee2]))
  end
end
