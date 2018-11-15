require 'pg'

def setup_test_database

  connection = PG.connect(dbname: 'Makersbnb_test')

  connection.exec("TRUNCATE users, spaces;")

end
