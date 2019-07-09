class CreateDownloadcetres < ActiveRecord::Migration[5.0]
  def change
    create_table :downloadcetres do |t|

      t.string      :dwnprojectcode
      t.string      :dwnfilename
      t.integer     :dwnfilemajorver
      t.integer     :dwnfilemiddlever
      t.integer     :dwnfileminorver
      t.integer     :projectcontrol_id
      t.integer     :releasecenter_id
      t.integer     :user_id
      t.integer     :releasefile_id
      t.string      :dwnfiledescription
      t.boolean     :dwndownloadfinished
      t.timestamp   :dwnfinishedtime
      
      t.timestamps null: false
    end
  end
end
