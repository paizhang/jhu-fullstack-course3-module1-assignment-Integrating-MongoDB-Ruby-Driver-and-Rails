class Racer

  def self.mongo_client
    Mongoid::Clients.default
  end

  def self.collection
    self.mongo_client['racers']
  end

  # Parameters prototype, sort, offset and limit are all optional.
  def self.all(prototype={}, sort={:number=>1}, offset=0, limit=nil)
    result=collection.find(prototype)
               .sort(sort)
               .skip(offset)
    result=result.limit(limit) if !limit.nil?

    return result
  end


end