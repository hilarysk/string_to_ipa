require "string_to_ipa/version"
require "sqlite3"

module StringToIpa
  DATABASE = SQLite3::Database.new("ipagem.db")

  DATABASE.results_as_hash = true
  DATABASE.execute( "PRAGMA encoding = \"UTF-16\"" );
  
  class Phonetic
    attr_accessor :word, :phonetic
    attr_reader :id
  
    def initialize(options)
      @word = options["word"]
      @phonetic = options["phonetic"]
      @id = options["id"]
    end
  
    def insert
      DATABASE.execute("INSERT INTO phonetics (word, phonetic) VALUES (?, ?)", @word, @phonetic)
      @id = DATABASE.last_insert_row_id
    end
  
    def save      
      attributes = []
                                                                                 
      instance_variables.each do |i|                                               
        attributes << i.to_s.delete("@")                                           
      end     
                                                                         
                                                                                 
      query_hash = {}                                                 
                                                                                 
      attributes.each do |a|                                             
        value = self.send(a)
        query_hash[a] = value                                                       
      end                                                                

      query_hash.each do |key, value|
        DATABASE.execute("UPDATE phonetics SET #{key} = ? WHERE id = #{@id}", value)
      end                                                                          
    end
  
    def delete
      DATABASE.execute("DELETE FROM phonetics WHERE id = #{@id}")
    end
  
  
    def self.find(s_id)
      result = DATABASE.execute("SELECT * FROM phonetics WHERE id = #{s_id}")[0]
    
      self.new(result)
    end
  
  end

end

class String
  def to_ipa
    StringToIpa::DATABASE.execute("SELECT phonetic from phonetics where word = ?", self.upcase)[0]["phonetic"]
  end
end
