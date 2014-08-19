class Todo < ActiveRecord::Base
  validates_uniqueness_of :title
  validates :guid, presence: true, uniqueness: true
end
