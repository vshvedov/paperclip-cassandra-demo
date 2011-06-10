class Item < ActiveRecord::Base
  attr_accessible :title, :image
  
  has_attached_file :image,
                    :styles => { :original  => "180x135" },
                    :storage => :cassandra,
                                :connection => Cassandra.new('DemoKeyspace', '127.0.0.1:9160'),
                                :column_family => :Images,
                                :key_prefix => 'I',
                                :path => ":style",
                                :url => "/:style/:param.:extension"
                    
end
