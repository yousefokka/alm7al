class Cart < ApplicationRecord
  belongs_to :order
  has_many :items
  
  


  def self.upsert_all(records)
    normalized = normalize(records)
    super(normalized)
  end
  

 def self.insert_all!(records)
  normalized = normalize(records)
  super(normalized)
end

def self.insert_all(records)
  normalized = normalize(records)
  
  super(normalized)
end


def self.normalize(records)
  records.each do |rec|
    add_timestamp(rec)
  end
end

def self.add_timestamp(record)
 
  time = Time.now.utc 

  record['created_at'] = time
  record['updated_at'] = time

end
 
 
end
