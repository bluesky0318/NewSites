json.extract! customerlist, :id, :companyname, :engineeremail, :customerorder, :companydescription, :created_at, :updated_at
json.url customerlist_url(customerlist, format: :json)
