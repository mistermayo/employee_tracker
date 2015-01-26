require('spec_helper')

describe(Project) do
  it("tells which employee it belongs to") do
    employee = Employee.create({:employee_name => "employee", :division_id => 1})
    project = Project.create({:project_name => "project", :employee_id => employee.id, :done => false})
    expect(project.employee()).to(eq(employee))
  end

   describe(".not_done") do
    it("returns the not done projects") do
      not_done_project1 = Project.create({:project_name => "gotta do it", :employee_id => 1, :done => false})
      not_done_project2 = Project.create({:project_name => "gotta do it too", :employee_id => 1, :done => false})
      not_done_projects = [not_done_project1, not_done_project2]
      done_project = Project.create({:project_name => "done project", :employee_id => 1, :done => true})
      expect(Project.not_done()).to(eq(not_done_projects))
    end
  end
end
