class Tool < ActiveRecord::Base
  validates :name,     presence:   true,
                       uniqueness: true
  validates :price,    presence:   true
  validates :quantity, presence:   true
  validates :user_id,  presence:   true

  belongs_to :user

  def self.most_recent
    if count == 0
      "No tools yet!"
    else
      last.name
    end
  end
end
