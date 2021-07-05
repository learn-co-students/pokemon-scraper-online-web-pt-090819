class Pokemon
  
  attr_accessor :id,:name,:type,:db
  
  def initialize(id:,name:,type:,db:)
    @id =id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name,type)  VALUES(?,?);",name,type)
  end
  
  def self.find(id,db)
   pocmon =  db.execute("SELECT * FROM pokemon WHERE id = ?;",id).flatten
   Pokemon.new(id: pocmon[0],name: pocmon[1],type: pocmon[2],db: db)
  end
end
