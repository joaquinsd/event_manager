class Concert < ApplicationRecord
  belongs_to :group

  def group_name
    group.name
  end
end
