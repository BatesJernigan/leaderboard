class CreateSiteControls < ActiveRecord::Migration
  def change
    create_table :site_controls do |t|
      t.integer :offset

      t.timestamps
    end
  end
end
