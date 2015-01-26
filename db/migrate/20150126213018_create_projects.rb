class CreateProjects < ActiveRecord::Migration
  def change
    create_table(:projects) do |t|
      t.column(:project_name, :string)
      t.column(:employee_id, :integer)
      t.column(:done, :boolean)

      t.timestamps
    end
  end
end
