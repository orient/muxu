class Comment < ActiveRecord::Base
  belongs_to :obj
  belongs_to :user
  
  def self.find_recent (options ={})
  	with_scope :find => options do 
		find(:all, :order=>'created_at DESC')
  	end
  end
  
  def self.find_hot (options ={})
  	with_scope :find =>options do
  		find_by_sql("select * from comments group by obj_id order by count(*) DESC")
  	end
  end

end
