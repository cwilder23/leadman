class User
  include Mongoid::Document
  include Mongoid::Timestamps #for created_at and updated_at 
  include Mongoid::Paranoia #for deleted
  
  rolify
  field :provider, type: String
  field :uid, type: String
  field :name, type: String
  field :email, type: String
  field :last_logon, type: Time   #required  -  Use Mongoid validators to enforce
  attr_accessible :role_ids, :as => :admin
  attr_accessible :provider, :uid, :name, :email
  
  #Relationships
  belongs_to :compnay
  
  # run 'rake db:mongoid:create_indexes' to create indexes
  index({ email: 1 }, { unique: true, background: true })

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

end
