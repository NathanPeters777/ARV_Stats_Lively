class Target < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name                   :string
    prompt_or_cue          :text
    outcome1               :string
    outcome2               :string
    coordinate             :string
    final_outcome          :string
    group_prediction       :string
    timestamps
  end
  attr_accessible :name, :prompt_or_cue, :outcome1, :outcome2, :outcome1_photo, :outcome2_photo, :coordinate, :final_outcome, :group_prediction

  belongs_to :owner, :class_name => "User", :creator => true, :inverse_of => :targets

  belongs_to :group, :inverse_of => :targets

  has_many :trials, :dependent => :destroy, :inverse_of => :target

  children :trials

  has_attached_file :outcome1_photo
  validates_attachment_content_type :outcome1_photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  has_attached_file :outcome2_photo
  validates_attachment_content_type :outcome2_photo, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  # --- Permissions --- #

  def create_permitted?
    acting_user == group.owner
  end

  def update_permitted?
    acting_user.administrator? || acting_user == group.owner
  end

  def destroy_permitted?
    acting_user.administrator? || acting_user == group.owner
  end

  def view_permitted?(field)
    true
  end

end
