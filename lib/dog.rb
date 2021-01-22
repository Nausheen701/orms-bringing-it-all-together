class Dog

    attr_accessor :id, :name, :breed

    def initialize (id: nil, name:, breed:)
        @id=id
        @name=name
        @breed=breed
    end

    def self.create(name:, breed:)
        dog = Dog.new(name, breed)
        dog = Dog.new(name: name, breed: breed)
        dog.save
        dog
    end
      
      def self.find_or_create_by(name:, breed:)
        sql = <<-SQL
              SELECT *
              FROM dogs
              WHERE name = ?  
              WHERE name = ?
              AND breed = ?
              LIMIT 1
            SQL
           
                if !dog.empty?
                  dog_data = dog[0]
                  dog = Dog.new(dog_data[0], dog_data[1], dog_data[2])
                  dog = Dog.new(id: dog_data[0], name: dog_data[1], breed: dog_data[2])
                else
                  dog = self.create(name: name, breed: breed)
                end

                def self.new_from_db(row)
                    id = row[0]
                    name = row[1]
                    breed = row[2]
                    self.new(id, name, breed)
                    self.new(id: id, name: name, breed: breed)
                  end
                
                  def self.find_by_name(name)
                    sql = <<-SQL
                      SELECT *
                      FROM dogs
                      WHERE name = ?
                      LIMIT 1
                    SQL
                    DB[:conn].execute(sql,name).map do |row|
                      self.new_from_db(row)
                    end.first
                  end
        def self.find_by_id(id)
            sql = <<-SQL
                SELECT *
                FROM dogs
                WHERE id = ?
                LIMIT 1
            SQL
                 DB[:conn].execute(sql,id).map do |row|
                      self.new_from_db(row)
                    end.first
                  end
                  def update
                    sql = "UPDATE dogs SET name = ?, breed = ?  WHERE id = ?"
                    DB[:conn].execute(sql, self.name, self.breed, self.id)
                  end
                
                end

    end 

