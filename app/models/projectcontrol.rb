class Projectcontrol < ApplicationRecord
  #validates_presence_of   :projectname, :projectcode, :prjdescription, :message => "Cannot be empty"
  validates_presence_of   :projectname, :message => "project name cannot be blank"
  #validates_presence_of   :projectcode, :message => "Projectcode cannot be empty"
  validates_presence_of   :prjdescription, :message => "comment cannot be blank"
  #validates_length_of     :projectcode, :minimum => 6, :message => "Projectdode must be more than 6 digits!"
  #validates               :projectname, presence: {message: "project name cannot be blank"}, :prjdescription, presence: {message: "comment cannot be blank"}
  validates               :projectcode, presence: {message: "project code cannot be blank"}, length: { minimum: 8, message: "minimum of project code is 8 " }
  validates_uniqueness_of :projectcode, :case_sensitive => false, :message => "project code already existed!"
  serialize   :cclist
  
  has_many    :issueboards
  has_many    :releasecenters
  has_many    :projectfiles
  has_many    :projectcclists
  has_many    :projectcomments
  #has_many    :issuereleaserelate
  has_many    :downloadcetres
  
  belongs_to  :osplatform
  belongs_to  :hwplatform
  belongs_to  :status
  belongs_to  :reporter, :class_name => "User"#, :foreign_key => "reporter_id"
  belongs_to  :assignedto, :class_name => "User"#, :foreign_key => "assignedto_id"
  belongs_to  :customerlist
  belongs_to  :categoryproject
  belongs_to  :statussolution
end
