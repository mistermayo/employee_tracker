class Project < ActiveRecord::Base
  belongs_to(:employee)
  scope(:not_done, -> do
    where({:done => false})
  end)
end
