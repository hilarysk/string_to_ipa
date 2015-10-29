require "string_to_ipa/version"
require "sqlite3"

module StringToIpa
  class << self
    def database
      @database ||= SQLite3::Database.new(File.expand_path('../ipagem.db', File.dirname(__FILE__)))
      @database.results_as_hash = true
      @database.execute( "PRAGMA encoding = \"UTF-16\"" );
      @database
    end
  end
  
  class Phonetic
    attr_accessor :word, :phonetic
    attr_reader :id
  
    def initialize(options)
      @word = options["word"]
      @phonetic = options["phonetic"]
      @id = options["id"]
    end
  
    def insert
      self.class.database.execute("INSERT INTO phonetics (word, phonetic) VALUES (?, ?)", @word, @phonetic)
      @id = self.class.database.last_insert_row_id
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
        self.class.database.execute("UPDATE phonetics SET #{key} = ? WHERE id = #{@id}", value)
      end                                                                          
    end
  
    def delete
      self.class.database.execute("DELETE FROM phonetics WHERE id = #{@id}")
    end
  
  
    def self.find(s_id)
      result = self.class.database.execute("SELECT * FROM phonetics WHERE id = #{s_id}")[0]
    
      self.new(result)
    end
  
  end

end

class String
  def to_ipa
    phonetic = StringToIpa.database.execute("SELECT phonetic from phonetics where word = ?", self.upcase)
    
    if phonetic == []
      return self
    else
      return phonetic[0]["phonetic"]
    end
  
  end

end
