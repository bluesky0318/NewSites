class AddOsplatformToProjectcontrols < ActiveRecord::Migration[5.0]
  def change
    add_reference :projectcontrols, :osplatform, foreign_key: true
    add_reference :projectcontrols, :hwplatform, foreign_key: true
    add_reference :projectcontrols, :status, 	 foreign_key: true
    add_reference :projectcontrols, :reporter, foreign_key: true
    add_reference :projectcontrols, :assignedto, foreign_key: true
    add_reference :projectcontrols, :customerlist, foreign_key: true
    add_reference :projectcontrols, :categoryproject, foreign_key: true
    add_reference :projectcontrols, :statussolution, foreign_key: true
  end
end
