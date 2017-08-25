require "string_to_ipa/version"
require "sqlite3"

module StringToIpa
  class Phonetic
    attr_accessor :word, :phonetic
    attr_reader :id

    def initialize(options)
      @word = options[:word]
      @phonetic = options[:phonetic]
      @id = options[:id]
    end

    def to_ipa
      phonetic = database.execute("SELECT phonetic from phonetics where word = ?", @word.upcase)

      if phonetic == []
        return @word
      else
        return phonetic[0]["phonetic"]
      end
    end

    def to_word
      word = database.execute("SELECT word from phonetics where phonetic = ?", @phonetic)

      if word == []
        return @phonetic
      else
        return word[0]["word"].downcase
      end
    end

    def insert
      database.execute("INSERT INTO phonetics (word, phonetic) VALUES (?, ?)", @word, @phonetic)
      @id = database.last_insert_row_id
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
        database.execute("UPDATE phonetics SET #{key} = ? WHERE id = #{@id}", value)
      end
    end

    def delete
      database.execute("DELETE FROM phonetics WHERE id = #{@id}")
    end

    def self.find(s_id)
      result = database.execute("SELECT * FROM phonetics WHERE id = #{s_id}")[0]
      self.new(result)
    end

    private

    def database
      @database ||= begin
        db = SQLite3::Database.new(File.join(File.expand_path(File.dirname(__FILE__)), "..", "ipagem.db"))
        db.results_as_hash = true
        db.execute( "PRAGMA encoding = \"UTF-16\"" )
        db
      end
    end

  end
end


class String
  def to_ipa
    StringToIpa::Phonetic.new(word: self).to_ipa
  end


  def to_word
    StringToIpa::Phonetic.new(phonetic: self).to_word
  end
end
