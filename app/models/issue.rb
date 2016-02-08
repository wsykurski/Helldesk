class Issue < ActiveRecord::Base
  #belongs_to :creator, :class_name => 'User', :foreign_key => 'creator_id'
  belongs_to :creator, :class_name => 'User'
  belongs_to :assigned, :class_name => 'User', :foreign_key => 'technican_id'
end
