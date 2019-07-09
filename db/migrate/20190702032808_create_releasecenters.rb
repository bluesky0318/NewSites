class CreateReleasecenters < ActiveRecord::Migration[5.0]
  def change
    create_table :releasecenters do |t|
      
      t.belongs_to  :projectcontrol
      t.string      :releasesummary
      t.text        :releasedescription
      t.integer     :reporter_id
      t.integer     :assignedto_id
      t.integer     :customerlist_id
      #t.integer     :releasehwplatform_id
      t.integer     :status_id
      t.string      :cclist

      t.timestamps null: false
    end
  end
end
