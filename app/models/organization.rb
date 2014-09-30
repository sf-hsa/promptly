class Organization < ActiveRecord::Base  
  attr_accessible :name, :user_ids, :recipient_ids, :conversation_ids, :group_ids, :message_ids, :reminder_ids, :organizations_user, :phone_number
  has_many :organizations_user
  has_many :users, through: :organizations_user
  validates_presence_of :name
  validates_plausible_phone :phone_number, :presence => true
  has_many :conversations
  has_many :groups
  has_many :messages
  has_many :reminders

  def to_param
    "#{self.id}"
  end

  def self.save_org_users(org_id, ids, roles)
    ids.each do |user_id|
      if user_id[1] == "1"
        @organization_users = OrganizationsUser.where(:organization_id => org_id, :user_id => user_id[0]).first_or_create
        @org_role = roles["#{user_id[0]}"]
        @organization_users.update_attributes(:roles_mask => OrganizationsUser.mask_for(@org_role[:roles_mask]))
        @organization_users.save
      else
        if OrganizationsUser.exists?(:organization_id => org_id, :user_id => user_id[0])
          OrganizationsUser.find(org_id, user_id[0]).delete
        end
      end
    end
  end

end
