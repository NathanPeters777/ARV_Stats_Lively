class OutcomePhotosForTarget < ActiveRecord::Migration
  def self.up
    add_column :targets, :outcome1_photo_file_name, :string
    add_column :targets, :outcome1_photo_content_type, :string
    add_column :targets, :outcome1_photo_file_size, :integer
    add_column :targets, :outcome1_photo_updated_at, :datetime
    add_column :targets, :outcome2_photo_file_name, :string
    add_column :targets, :outcome2_photo_content_type, :string
    add_column :targets, :outcome2_photo_file_size, :integer
    add_column :targets, :outcome2_photo_updated_at, :datetime
  end

  def self.down
    remove_column :targets, :outcome1_photo_file_name
    remove_column :targets, :outcome1_photo_content_type
    remove_column :targets, :outcome1_photo_file_size
    remove_column :targets, :outcome1_photo_updated_at
    remove_column :targets, :outcome2_photo_file_name
    remove_column :targets, :outcome2_photo_content_type
    remove_column :targets, :outcome2_photo_file_size
    remove_column :targets, :outcome2_photo_updated_at
  end
end
