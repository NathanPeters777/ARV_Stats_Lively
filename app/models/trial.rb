class Trial < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    transcript_as_text              :text
    timestamps
  end
  attr_accessible :trn1, :trn2, :cr1, :cr2, :solar_wind_speed, :viewer_local_time, :lst_time, :user_prediction

  belongs_to :owner, :class_name => "User", :creator => true, :inverse_of => :trials

  belongs_to :target, :inverse_of => :trials

  belongs_to :user, :inverse_of => :trials

  # --- Permissions --- #

  def create_permitted?
    unless acting_user.guest?
       target.group.in?(acting_user.joined_groups)
    else
      false
    end
  end

  def update_permitted?
    acting_user.administrator? || owner_is?(acting_user)
  end

  def destroy_permitted?
    acting_user.administrator? || owner_is?(acting_user)
  end

  def view_permitted?(field)
    true
  end

end
