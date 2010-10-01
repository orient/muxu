class Comment < ActiveRecord::Base
  belongs_to :obj
  belongs_to :user
end
