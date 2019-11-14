class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_numb, db)
    pokemon = db.execute("SELECT name, type FROM pokemon WHERE id = ?", id_numb).flatten
    id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    name = pokemon[0]
    type = pokemon[1]
    new_pokemon = self.new(id: id, name: name, type: type, db: db)
    new_pokemon
  end
end
