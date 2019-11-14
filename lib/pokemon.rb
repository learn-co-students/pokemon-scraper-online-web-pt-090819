class Pokemon
  attr_acessor :name, :type, :id, :db

  def initialize(id = nil, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

end
