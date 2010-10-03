class Obj < ActiveRecord::Base
	include Paperclip
	
	has_many :comments
	has_many :users, :through=>:comments
	
	validates_presence_of :name
	has_attached_file :image, :styles =>{:medium=>"140x160>", :thumb =>"100x147>"}
	validates_attachment_presence :image
	validates_attachment_size :image, :less_than =>3.megabytes
	validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png','image/gif']
	
	
end
