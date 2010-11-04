class Newsletter
  include DataMapper::Resource
  validates_presence_of :email
  validates_format_of   :email, :as => :email_address
  
  property :id, Integer, :serial => true
  property :email, String
  property :full_name, String
  property :created_at, DateTime
  
  before :valid?, :set_created_at
  
  def set_created_at(context = :default)
    self.created_at = Time.now
  end
end

# To migrate run: heroku console
# Note, if you run these commands it will delete all data :(
# require  'dm-migrations'
# DataMapper.auto_migrate!