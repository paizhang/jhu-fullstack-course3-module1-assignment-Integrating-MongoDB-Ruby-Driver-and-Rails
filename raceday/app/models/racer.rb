class Racer

  attr_accessor :id, :number, :first_name, :last_name, :gender, :group, :secs

  def initialize(params={})
    @id=params[:_id].nil? ? params[:id] : params[:_id].to_s
    @number=params[:number].to_i
    @first_name=params[:first_name]
    @last_name=params[:last_name]
    @gender=params[:gender]
    @group=params[:group]
    @secs=params[:secs].to_i
  end

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