class CreateDivisions < ActiveRecord::Migration
  def change
    create_table(:divisions) do |t|
      t.column(:division_name, :string)

      t.timestamp
    end

    add_column(:employees, :division_id, :integer)
  end
end
