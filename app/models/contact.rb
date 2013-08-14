class Contact < ActiveRecord::Base
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :cluster_group

  serialize :keywords, Array
end
