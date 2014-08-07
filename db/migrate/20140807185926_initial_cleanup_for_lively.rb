class InitialCleanupForLively < ActiveRecord::Migration
  def self.up
    add_column :targets, :coordinate, :string
    remove_column :targets, :confidence_level
    remove_column :targets, :cr_divergence
    remove_column :targets, :trials_cr_delta_mean
    remove_column :targets, :trials_cr_delta_stddev
    remove_column :targets, :trials_cr_delta_snr
    remove_column :targets, :trials_zscore
    remove_column :targets, :due_date

    add_column :trials, :transcript_as_text, :text
    remove_column :trials, :trn1
    remove_column :trials, :trn2
    remove_column :trials, :cr1
    remove_column :trials, :cr2
    remove_column :trials, :solar_wind_speed
    remove_column :trials, :viewer_local_time
    remove_column :trials, :lst_time
    remove_column :trials, :user_prediction
  end

  def self.down
    remove_column :targets, :coordinate
    add_column :targets, :confidence_level, :float
    add_column :targets, :cr_divergence, :float
    add_column :targets, :trials_cr_delta_mean, :float
    add_column :targets, :trials_cr_delta_stddev, :float
    add_column :targets, :trials_cr_delta_snr, :string
    add_column :targets, :trials_zscore, :float
    add_column :targets, :due_date, :date

    remove_column :trials, :transcript_as_text
    add_column :trials, :trn1, :string
    add_column :trials, :trn2, :string
    add_column :trials, :cr1, :float
    add_column :trials, :cr2, :float
    add_column :trials, :solar_wind_speed, :integer
    add_column :trials, :viewer_local_time, :datetime
    add_column :trials, :lst_time, :datetime
    add_column :trials, :user_prediction, :string
  end
end
